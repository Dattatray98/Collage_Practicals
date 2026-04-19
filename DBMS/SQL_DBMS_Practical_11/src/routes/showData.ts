import { Router } from "express";
import { ShowData, ShowUserData } from "../controllers/showData";

const router = Router();

router.get("/showdata", ShowData);
router.get("/showUser", ShowUserData);

export default router;
