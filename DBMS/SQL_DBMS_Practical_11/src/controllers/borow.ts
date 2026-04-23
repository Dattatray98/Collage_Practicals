import { Request, Response } from "express";
import ConnectDB from "../config/db";
import OracleDB from "oracledb";

export const BorowBook = async (req:Request, res:Response)=>{
    const {name, email, book_id} = req.body;
    let connection;
    try{
        connection = await ConnectDB();

        const borowSQL = `INSERT INTO Users(name, email, book_id) VALUES (:name, :email, :book_id)`;
        const BookSQL =  `UPDATE Books SET is_borrowed = 1 WHERE book_id = :book_id`;

        const result = await connection.execute(borowSQL, {name, email, book_id}, {autoCommit:true, outFormat:OracleDB.OUT_FORMAT_OBJECT});

        await connection.execute(BookSQL, {book_id}, {autoCommit:true});

        console.log(result);
        res.status(201).json({
            result:result
        });
    }catch(error){
        console.error(error);
    }finally{
        if(connection){
            connection.close();
        }
    }
}