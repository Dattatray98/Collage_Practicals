import express from "express";
import cors from "cors";
import ConnectDB from "./config/db";
import createTable from "./routes/createTable";
import update from "./routes/update";
import Delete from "./routes/deleteData";
import Showdata from "./routes/showData";

const app = express()

const PORT = 8000;
app.use(express.json());
app.use(cors())

ConnectDB().then(() => console.log("database connected")).catch((e) => console.log("error : ", e))

app.get("/", async (req, res) => {
    res.json({ message: "server started" });
});

app.use("/api", createTable);
app.use("/api", update);
app.use("/api", Delete); 
app.use("/api", Showdata);


app.listen(PORT, () => console.log("server started at http://localhost:8000"))