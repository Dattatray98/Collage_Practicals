import { Router } from "express";
import { DeleteData } from "../controllers/deleteData";

const router = Router();


router.delete("/delete/:id", DeleteData);


export default router;