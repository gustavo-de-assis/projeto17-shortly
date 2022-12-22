import { Router } from "express";
import { getUrlById, openShortenedUrl, shortenUrl } from "../controllers/urls.controller.js";
import { urlValidation } from "../middlewares/urls.middleware.js";

const urlsRouter = Router();

urlsRouter.post("/urls/shorten", urlValidation, shortenUrl);
urlsRouter.get("/urls/:id", getUrlById);
urlsRouter.get("/urls/open/:shortUrl", openShortenedUrl);
//urlsRouter.delete("/urls/:id");


export default urlsRouter;