import { Request, Response } from "express"
import ConnectDB from "../config/db"


export const createTable = async (req: Request, res: Response) => {
    const { book_id, book_name } = req.body;
    console.log("request received with : ", book_id, book_name);

    let connection
    try {
        connection = await ConnectDB();

        const createTableSQL = `INSERT INTO books(book_id, book_name) VALUES (:book_id, :book_name)`;

        const result = await connection.execute(createTableSQL, { book_id, book_name }, { autoCommit: true });
        console.log("Rows inserted:", result.rowsAffected);
        return res.status(201).json({ message : "user created"});

    } catch (error) {
        console.log(error);
    } finally {
        if (connection) {
            await connection.close();
        }
    }

}