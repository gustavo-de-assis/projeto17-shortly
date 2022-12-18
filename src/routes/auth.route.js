import { Router } from "express";
import { signUp } from "../controllers/auth.controller.js";
import { userValidation } from "../middlewares/users.middleware.js";

const authRouter = Router();

//authRouter.post("/login");
authRouter.post("/signUp", userValidation, signUp);


export default authRouter;