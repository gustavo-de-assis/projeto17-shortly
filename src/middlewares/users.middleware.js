import joi from "joi";
import bcrypt from "bcrypt";
import { connection } from "../database/db.js";


const userSchema = joi.object({
    name: joi.string().min(3).required(),
    email: joi.string().required(),
    password: joi.string().min(6).required(),
    confirmPassword: joi.ref('password')
}).with('password', 'confirmPassword');

export function userValidation (req, res, next){
    const user = req.body;

    const validationError = userSchema.validate(user, {
        abortEarly: false,
    }).error;

    if(validationError){
        const error = validationError.details.map((e) => e.message);
        return res.status(422).send(error);
    }

    next();
}

export async function userLogin (req, res, next){
    const {email, password} = req.body;

    try{
        const user = await connection.query(`
            SELECT * FROM users u WHERE u.email = $1;
        `,[email]);

        if (user.rows.length === 0){
            return res.status(404).send("User not Found!");
        }

        const passwordCheck = bcrypt.compareSync(
            password,
            user.rows[0].password
        );

        if (!passwordCheck) {
            return res.sendStatus(401);
        }        

        delete user.rows[0].password;
        res.locals.user = user;
   
    } catch (err){
        console.log(err);
        res.sendStatus(500);
    }


    next();
}