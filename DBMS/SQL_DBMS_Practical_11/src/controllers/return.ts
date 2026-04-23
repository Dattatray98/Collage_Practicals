import { Request, Response } from "express";
import ConnectDB from "../config/db";


export const returnBook = async (req: Request, res: Response) => {
    const { book_id, user_id, user_name } = req.body;
    console.log(book_id, user_id, user_name);
    let connection;
    try {
        connection = await ConnectDB();

        const ReturnSQL = `INSERT INTO History (book_id, user_id, user_name) VALUES (:book_id, :user_id, :user_name)`;
        const BooksSQL = `UPDATE Books SET is_borrowed = 0 WHERE book_id = :book_id`;
        const UsersSQL = `DELETE FROM USERS WHERE id = :user_id`;

        await connection.execute(ReturnSQL, { book_id, user_id, user_name });
        await connection.execute(BooksSQL, { book_id });
        await connection.execute(UsersSQL, { user_id });

        await connection.commit();

        return res.status(201).json({
            message:"success"
        })

    } catch (error) {
        console.log(error);
    } finally {
        if (connection) {
            connection.close();
        }
    }
}