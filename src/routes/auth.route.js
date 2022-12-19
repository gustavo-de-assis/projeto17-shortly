import { Router } from "express";
import { signIn, signUp } from "../controllers/auth.controller.js";
import { userLogin, userValidation } from "../middlewares/users.middleware.js";

const authRouter = Router();

authRouter.post("/signIn", userLogin, signIn);
authRouter.post("/signUp", userValidation, signUp);


export default authRouter;