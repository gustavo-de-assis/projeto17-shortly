import bcrypt from "bcrypt";
import { v4 as uuidV4 } from "uuid";
import { connection } from "../database/db.js";

export async function signUp (req, res){
    const {name, email, password} = req.body;

    try{
        const user = await connection.query(`
            SELECT * FROM users WHERE email = $1
        `, [email]);

        if (user.rows.length > 0){
            return res.status(409).send("This email has already been used!");
        }

        const hashPassword = bcrypt.hashSync(password, 10);

        await connection.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3)`, [name, email, hashPassword
        ]);
        
        res.sendStatus(201);

    } catch (err){
        console.log(err);
        res.sendStatus(500);
    }
}