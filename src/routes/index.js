import { Router } from "express";
import authRouter from "./auth.route.js";
import rankingRouter from "./ranking.route.js";
import urlsRouter from "./urls.route.js";
import usersRouter from "./users.route.js";

const router = Router();


router.use(urlsRouter);
router.use(authRouter);
router.use(usersRouter);
router.use(rankingRouter);

export default router;