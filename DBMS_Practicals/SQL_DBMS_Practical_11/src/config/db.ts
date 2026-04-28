import oracledb from "oracledb";

const ConnectDB = async () => {
        return await oracledb.getConnection({
            user: "SYS",
            password: "Dattu98", // e.g., "Dattu98"
            connectString: "localhost:1521/xe",
            // You must explicitly set this for administrative accounts
            privilege: oracledb.SYSDBA 
        });
}

export default ConnectDB;