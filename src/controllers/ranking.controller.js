import { connection } from "../database/db.js";


export async function getRanking(req, res){

    try{
        const ranking = (await connection.query(`
        SELECT 
            u.id, u.name, 
            COUNT (urls."userId") as "linksCount", 
            u."visitCount" 
        FROM users u LEFT JOIN urls 
            ON urls."userId" = u.id 
        GROUP BY u.id 
        ORDER BY u."visitCount" DESC 
        LIMIT 10;
        `)).rows;

        res.status(200).send(ranking);

    } catch(err){
        console.log(err);
        res.sendStatus(500);
    }
}