import { Router } from "express";
import { userInfo } from "../controllers/users.controller.js";

const usersRouter = Router();

usersRouter.get("/users/me", userInfo);


export default usersRouter;