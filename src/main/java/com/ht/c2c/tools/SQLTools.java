package com.ht.c2c.tools;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by guangwangzhuang on 2019/4/12.
 */
public class SQLTools {
    static SQLTools st = null;
    DataSource dataSource = null;

    private SQLTools() throws IOException, Exception {
        dataSource = Configure.getInstance().getDataSource();
    }

    public static SQLTools getInstance() throws IOException, Exception {
        if (st == null)
            st = new SQLTools();

        return st;
    }

    /**
     * 使用方法：
     * Connection con = SQLTools.getInstance().getConnection();
     * Statement stmt = con.createStatement();
     * ResultSet rs = stmt.executeQuery("select * from bcode");
     * rs.next();
     * 记得 rs.close() stmt.close(),conn.close()
     *
     * @param con
     * @param SqlStr
     * @return
     * @throws Exception
     */
    public ResultSet exeQuery(Connection con, String SqlStr) throws Exception {
        ResultSet result = null;
        Statement stmt = con.createStatement();
        System.out.println("stmt is null?" + (stmt == null)
                + "con is null ?" + (con == null) + " sqlstr =" + SqlStr);
        result = stmt.executeQuery(SqlStr);
        return result;


    }

    /**
     * 取得链接外围释放
     *
     * @return
     * @throws SQLException
     */
    public Connection getConnection() throws SQLException {
        Connection conn = dataSource.getConnection();
        return conn;
    }

    public int Update(String SqlStr) throws Exception {

        Configure.log(" update:" + SqlStr);
        Connection conn = dataSource.getConnection();
        Statement stmt = conn.createStatement();
        int result = 0;
        try {

            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            result = stmt.executeUpdate(SqlStr);
            if (result == 0)
                System.out.println("数据未被更新" + SqlStr);

        } finally {
            if (stmt != null)
                stmt.close();
            conn.close();
        }
        return result;
    }

    public static void main(String[] argv) throws Exception {

        SQLTools.getInstance().Update("insert into bcode (bcode,bname) values('0001','zgw')");

    }
}