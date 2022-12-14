import express from "express";
import cors from "cors";

const app = express();

app.use(cors());
app.use(express.json());


app.listen(4000,console.log("Server Running at port 4000!"));