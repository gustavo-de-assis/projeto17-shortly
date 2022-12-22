import { nanoid } from "nanoid";
import { connection } from "../database/db.js";

export async function shortenUrl(req, res) {
    const { url } = req.body;
    const shortUrl = nanoid(13);

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
                (url, "shortUrl", "userId") 
                VALUES ($1, $2, $3)`,
                [url, shortUrl, user.rows[0].id]);
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

export async function openShortenedUrl(req, res) {
    const {shortUrl} = req.params;

    try{
        const url = await connection.query(`
            SELECT * FROM urls WHERE "shortUrl" = $1;
        `, [shortUrl]);

        if(url.rows.length === 0){
            return res.status(404).send("Url not found!");
        }
        
        const urlCounter = url.rows[0].visitCount +1;
        
        await connection.query(`
            UPDATE urls SET "visitCount" = $1 WHERE id = $2;
        `,[urlCounter, url.rows[0].id]);

        const user = await connection.query('SELECT * FROM users WHERE id = $1', [url.rows[0].userId]);
        const userCounter = user.rows[0].visitCount +1;

        await connection.query(`
            UPDATE users SET "visitCount" = $1 WHERE id = $2;
        `, [userCounter, user.rows[0].id]);
        
        res.redirect(url.rows[0].url);

    } catch (err){
        console.log(err);
        res.sendStatus(500);
    }
}

export async function deleteUrl (req, res){
    const { authorization } = req.headers;
    const {id} = req.params;

    const token = authorization?.replace('Bearer ', '');

    if(!token){
        return res.status(401).send("Unauthorized!")
    }

    try{
        const url = await connection.query(`
            SELECT * FROM urls WHERE id = $1
        `, [id]);

        if (url.rows.length === 0){
            return res.status(404).send("Url not found!");
        }
        const user = await connection.query(`SELECT u.id FROM users u JOIN sessions s ON u.id = s."userId" WHERE s.token = $1`,[token]);

        if (user.rows.length === 0){
            return res.status(404).send("User not found!");
        }
        const userId = user.rows[0].id;

        if(url.rows[0].userId !== userId){
            return res.status(401).send("User does not match to url owner");
        } else {
            await connection.query(`DELETE FROM urls WHERE id = $1;`, [id]);
            res.sendStatus(200);
        }

    } catch (err){
        console.log(err);
        req.sendStatus(500);
    }

}