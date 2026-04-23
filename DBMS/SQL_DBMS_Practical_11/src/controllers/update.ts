import { Request, Response } from "express";
import ConnectDB from "../config/db";

export const UpdateData = async (req: Request, res: Response) => {
    let connection;
    const id = req.params.id as string;
    const { book_name } = req.body;
    console.log(id, book_name)

    try {
        connection = await ConnectDB();

        const updatedata = `UPDATE Books SET book_name = :book_name WHERE book_id = :id`;

        const result = await connection.execute(updatedata, {book_name, id}, {autoCommit:true})

        res.status(201).json({ message: "books updated" });

    } catch (error) {
        console.log(error);
    } finally {
        if (connection) {
            await connection.close();
        }
    }
}