package com.ht.c2c.tools;

import com.ht.c2c.dataBase.DataSet;
import com.ht.c2c.dataBase.Row;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.sql.PreparedStatement;

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

    public int Update(String SqlStr,Object[] params) throws Exception {
        Configure.log(" update:" + SqlStr);
        Connection conn = dataSource.getConnection();
        PreparedStatement statement = null;
        int result = 0;
        try {
            statement = conn.prepareStatement(SqlStr);
            for (int i=0;i<params.length;i++){
                statement.setString(i+1,params[i].toString());
            }
            result = statement.executeUpdate();
            if (result == 0)
                System.out.println("数据未被更新" + SqlStr);
        } finally {
            if (statement != null)
                statement.close();
            conn.close();
        }
        return result;
    }

    public DataSet query(String sql) throws SQLException {


        Connection conn  =dataSource.getConnection();

        Statement stmt = conn.createStatement();
        Configure.log(" q:"+sql);
        ResultSet rs = stmt.executeQuery(sql);
        DataSet ds = new DataSet();

        int count = 0;
        try {
            while (rs.next()) {
                count ++;
                Row r = new Row();
                for (int i = 0; i < rs.getMetaData().getColumnCount(); i++) {
                    String colname = rs.getMetaData().getColumnName(i + 1);
                    r.setValue(colname, rs.getString(colname));
                }
                ds.addRow(r);
            }

        }
        finally {


            rs.close();
            stmt.close();
            conn.close();
        }

        return ds;

    }

    public boolean handleTransaction(Vector<String> SqlArray) throws Exception {


        Configure.info(" handleTransaction:"+SqlArray);
        Connection conn  =dataSource.getConnection();
        Statement stmt= conn.createStatement();
        conn.setAutoCommit(false);
        try {
            for (String sql : SqlArray) {
                stmt.addBatch(sql);

            }
            stmt.executeBatch();
            conn.commit();

            return true;
        }
        finally
        {
            conn.setAutoCommit(true);
            stmt.close();
            conn.close();

        }
    }

    public static void main(String[] argv) throws Exception {

        long l = System.currentTimeMillis();
       /* for (int i = 0;i<1000;i++) {
            SQLTools.getInstance().Update("insert into bcode (bcode,bname) values('0001','zgw')");

        }*/
        l = System.currentTimeMillis()-l;
        System.out.println("insert time s"+l/1000);

        DataSet ds = SQLTools.getInstance().query("select * from gcode");
        System.out.println(ds);

        SQLTools.getInstance().Update("update gcode set gname='ipad',price='5000.00',descript='234' where icode =1\n");
    }
}
