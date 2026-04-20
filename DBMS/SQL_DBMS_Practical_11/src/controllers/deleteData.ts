import { Request, Response } from "express";
import ConnectDB from "../config/db";


export const DeleteData = async (req: Request, res: Response) => {
    let connection;
    const id = req.params.id as string;
    console.log("received request with : ", id)

    try {
        connection = await ConnectDB();

        const DeleteSQL = `DELETE FROM books WHERE book_id = :id`;
        const DeleteChild = `DELETE FROM Users WHERE book_id = :id`;

        const success = await connection.execute(DeleteChild, { id }, { autoCommit: true });

        if (success) {
            const result: any = await connection.execute(DeleteSQL, { id }, { autoCommit: true });
        }

        res.status(201).json({
            message: "deleted user"
        });

    } catch (error) {
        console.log(error)
    } finally {
        if (connection) {
            await connection.close();
        }
    }
}