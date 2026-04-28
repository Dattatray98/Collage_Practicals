import { Router } from "express";
import { BorowBook } from "../controllers/borow";


const router = Router();

router.post("/borow", BorowBook);

export default router;
