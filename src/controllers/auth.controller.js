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

export async function signIn (req, res){
    const user = res.locals.user;

    const token = uuidV4();
    const session = {token, userId: user.rows[0].id};
    console.log(session);

    try{
        const existingSession = await connection.query(`SELECT * FROM sessions WHERE "userId" = $1;`, [user.rows[0].id]);
        
        if (existingSession.rows.length === 0) {
            // Session does not exist => create one
            await connection.query(`INSERT INTO sessions("token", "userId") VALUES ($1, $2);`,[session.token, session.userId]);
        } else {
            // Session exists => update token
            await connection.query(`UPDATE sessions SET token = $1 WHERE "userId" = $2`, [session.token, session.userId])
        }

        res.status(200).send(session);

    } catch (err) {
        console.log(err);
        res.sendStatus(500);
    }


}