import { Router } from "express";
import { signIn, signUp } from "../controllers/auth.controller.js";
import { userValidation } from "../middlewares/users.middleware.js";

const authRouter = Router();

authRouter.post("/signIn", signIn);
authRouter.post("/signUp", userValidation, signUp);


export default authRouter;