import { Router } from "express";
import { History, returnBook } from "../controllers/return";

const router = Router();


router.post("/return", returnBook);
router.get("/history", History);

export default router;
