import { connection } from "../database/db.js";

export async function userInfo(req, res){
    const { authorization } = req.headers;

    const token = authorization?.replace('Bearer ', '');

    if(!token){
        return res.status(401).send("Unauthorized!")
    }
    try{
        const user = (await connection.query(`
        SELECT u.id, u.name, u."visitCount" 
        FROM users u JOIN sessions s
        ON u.id = s."userId"
        WHERE s.token = $1`,[token])).rows;

        if(user.length === 0 ){
            return res.status(404).send("User not Found!");
        }

        const urls = (await connection.query(`
        SELECT id, "shortUrl", url, "visitCount" FROM urls WHERE "userId" = $1`,[user[0].id])).rows;

        
        const userInfo = {...user[0], shortenedUrls: urls};
        

        res.status(200).send(userInfo);

    } catch (err){
        console.log(err);
        res.sendStatus(500);
    }

}