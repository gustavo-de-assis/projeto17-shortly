import { nanoid } from "nanoid";
import { connection } from "../database/db.js";

export async function shortenUrl(req, res){
    const user = res.locals.user;
    const {url} = req.body;
    const shortUrl = nanoid();

    try{

        const storedUrl = await connection.query(`SELECT * FROM urls WHERE url = $1`, [url]);

        // URL exists?
        if( storedUrl.rows.length > 0){
            return res.status(409).send("This URL has already been saved");
        }

        else{
            await connection.query(`INSERT INTO urls (url, "shortUrl") VALUES ($1, $2)`, [url, shortUrl]);

            const newUrl = (`SELECT * FROM urls WHERE url = $1`, [url]);

            await connection.query(`INSERT INTO "shortened_url" ("userId", "urlId", "visitCount") VALUES ($1, $2, 0)`, [userId, newUrl.rows[0].id]); 
        } 
        // FAlta buscar o id do usuário no banco;

        res.sendStatus(200);

    } catch (err){
        console.log(err);
        res.sendStatus(500);
    }
    console.log (user, url);
}