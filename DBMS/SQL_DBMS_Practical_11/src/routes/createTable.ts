import { Router } from "express";
import { createTable } from "../controllers/createTable";

const router = Router();


router.post("/create", createTable);

export default router;