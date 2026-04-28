import { Router } from "express";
import { UpdateData } from "../controllers/update";

const router = Router();


router.put("/update/:id", UpdateData);


export default router;