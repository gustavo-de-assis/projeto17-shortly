import { nanoid } from "nanoid";
import { connection } from "../database/db.js";

export async function shortenUrl(req, res) {
    const { url } = req.body;
    const shortUrl = nanoid();

    const { authorization } = req.headers;
    const token = authorization?.replace('Bearer ', '');

    console.log(token)

    if(!token){
        return res.status(401).send("Unauthorized!")
    }

    try {
        const storedUrl = await connection.query(`
            SELECT * 
            FROM urls 
            WHERE url = $1`,
            [url]);

        // URL exists?
        if (storedUrl.rows.length > 0) {
            return res.status(409).send("This URL has already been saved");
        }
        else {
            const user = await connection.query(`
                SELECT u.id 
                FROM users u 
                    JOIN sessions s 
                ON u.id = s."userId" 
                    WHERE s.token = $1;`, 
                [token]);
            
            if(user.rows.length === 0){
                return res.status(404).send("User not Found!");
            }

            await connection.query(`
                INSERT 
                INTO urls 
                (url, "shortUrl") 
                VALUES ($1, $2)`,
                [url, shortUrl]);

            const newUrl = await connection.query(`
                SELECT * 
                FROM urls 
                WHERE url = $1`,
                [url]);

            console.log("User id:",user.rows[0].id, "Url id:" ,newUrl.rows[0].id);

            await connection.query(`
                INSERT 
                INTO shortened_urls 
                ("userId", "urlId", "visitCount") 
                VALUES ($1, $2, 0)`,
                [user.rows[0].id, newUrl.rows[0].id]);
        }

        res.sendStatus(200);

    } catch (err) {
        console.log(err);
        res.sendStatus(500);
    }
}

export async function getUrlById(req, res) {
    const {id} = req.params;

    try{
        const url = await connection.query(`
            SELECT * FROM urls WHERE id = $1
        `, [id]);

        if(url.rows.length === 0) {
            return res.status(404).send("Url not found!");
        }

        res.status(200).send(url.rows[0]);

    } catch (err) {
        console.log(err);
        res.sendStatus(500);
    }
}