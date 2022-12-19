import pkg from "pg";
import dotenv from "dotenv";

dotenv.config();

const { Pool } = pkg;


export const connection = new Pool({
    connectionString: process.env.DATABASE_URL,
});


/*export const connection = new Pool({
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: 'gusta421',
    database: 'shortly'
});*/