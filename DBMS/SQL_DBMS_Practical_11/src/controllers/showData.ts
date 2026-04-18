import { Request, Response } from "express";
import ConnectDB from "../config/db";
import OracleDB from "oracledb";


export const ShowData = async (req: Request, res: Response) => {
    let connection;
    try {
        console.log("received request")
        connection = await ConnectDB();

        const showSQL = `SELECT * from books`;

        const result = await connection.execute(showSQL, [], { outFormat: OracleDB.OUT_FORMAT_OBJECT });
        console.log(result.rows);

        res.status(201).json({
            message: "success",
            result: result.rows
        });

    } catch (error) {
        console.log(error);
    }
}