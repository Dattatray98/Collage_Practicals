import { Router } from "express";
import { returnBook } from "../controllers/return";

const router = Router();


router.post("/return", returnBook);

export default router;
