import { Router } from "express";
import { ShowData } from "../controllers/showData";

const router = Router();

router.get("/showdata", ShowData);


export default router;
