package com.ht.c2c.tools;

import com.alibaba.fastjson.JSON;
import com.ht.c2c.dataBase.Cell;
import com.ht.c2c.dataBase.DataSet;
import com.ht.c2c.dataBase.Row;
import com.ht.c2c.redis.Redis;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Vector;

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


                    int type = rs.getMetaData().getColumnType(i+1);

                    //System.out.println("colname"+colname +"type = "+ type);
                    //java.sql.Types.VARCHAR:
                    //对于mysql 这是JSON 类型  右面jdbc 升级估计会有bug
                    if(type ==Types.LONGVARCHAR)
                    {
                       // System.out.println(rs.getObject(colname).getClass());

                       // r.setValue(colname, rs.getObject(colname));
                        Cell c = new Cell(colname,rs.getObject(colname),Types.LONGVARCHAR);

                        r.addCell(c);
                    }
                    else{
                        r.setValue(colname, rs.getString(colname));
                    }

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

    /**
     *
     * 数据库语句sql 加载到redis，一般初始化时候调用全部，
     * 做这个函数的时候我在思考为什么要用redis，作用是什么
     * 我已经把ds 重要的表作为缓存了，为什么还需要redis作为缓存呢
     * redis 你丫的顶多保存我的session吧，但是nnd 我根本就在抛弃session 用jwt
     * 留着redis 究竟有什么用
     * @param sql
     * @throws SQLException
     */
    public void query2Redis(String sql)throws SQLException

    {

        Connection conn  =dataSource.getConnection();

        Statement stmt = conn.createStatement();
        Configure.log(" q:"+sql);
        ResultSet rs = stmt.executeQuery(sql);
        int count = 0;
        try {
            while (rs.next()) {
                count ++;
                //Row r = new Row();

                Hashtable<String,String> ht = new Hashtable<>();
                String key ="";
                String keyvalue = "";
                for (int i = 0; i < rs.getMetaData().getColumnCount(); i++) {
                    String colname = rs.getMetaData().getColumnName(i + 1);
                   // r.setValue(colname, rs.getString(colname));
                  //  rs.getMetaData().getColumnType(i+1);
                    if(null!=rs.getString(colname))
                        ht.put(colname,rs.getString(colname));
                    if(colname.equals("icode"))
                    {
                        keyvalue = rs.getString(colname);
                    }
                }

                Redis.getInstance().getJedis().hset(keyvalue,ht);

            }

        }
        finally {


            rs.close();
            stmt.close();
            conn.close();
        }

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


    /**
     * hash 的插入
     * @param table
     * @param contentht
     */
    public void insertFromHt(String table,HashMap<String,Object> contentht) throws Exception {
        StringBuffer sql = new StringBuffer("insert into "+table+" ( ");

        for(String key:contentht.keySet())
        {
            sql.append(key);
            sql.append(",");

        }
        sql.deleteCharAt(sql.length()-1);
        sql.append(") values (");
        for(String key:contentht.keySet())
        {
            sql.append("'");
            sql.append(contentht.get(key));
            sql.append("'");
            sql.append(",");


        }
        sql.deleteCharAt(sql.length()-1);
        sql.append(")");
        Update(sql+"");
    }
    /**
     * 从hash 进行更新,
     *
     * @param table  表名
     * @param contentht  更新的内容
     * @param conditionht 更新的条件
     */

    public void updateFromHt(String table, HashMap<String,Object>  contentht,HashMap<String,Object> conditionht) throws Exception {
      //  String updatejson = "{\"recivename\":\"2222\",\"addr\":\"广222东\",\"tel\":\"333333\",\"mobil\":\"3234234234\",\"ccode\":\"zgw\"}";

      //  Hashtable<String,String> ht = JSON.parseObject(content, Hashtable.class);

        StringBuffer sql = new StringBuffer("update "+table+" set  ");
        for(String key:contentht.keySet())
        {
            sql.append(key);
            sql.append(" = ");
            sql.append("'");
            if(contentht.get(key) instanceof JSON)
            {
                sql.append(JSON.toJSONString(contentht.get(key)));

            }
            else {
                sql.append(contentht.get(key).toString());
            }
            sql.append("'");
            sql.append(",");
        }
        sql.deleteCharAt(sql.length()-1);
//        String keyjson = "{'icode':1}";
//        Hashtable<String,Object> keyht = JSON.parseObject(keyjson, Hashtable.class);
        sql.append(" where ");
        for (String key:conditionht.keySet())
        {
            sql.append(key);
            sql.append(" = ");
            if(conditionht.get(key) instanceof  Integer)
            {

                sql.append(conditionht.get(key));

            }
            else
            {
                sql.append("'");
                sql.append(conditionht.get(key));
                sql.append("'");
            }


            sql.append(",");
        }
        sql.deleteCharAt(sql.length()-1);

        Update(sql+"");
    }


    public static String getDateNow()
    {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    }


    public static void main(String[] argv) throws Exception {

        long l = System.currentTimeMillis();
       /* for (int i = 0;i<1000;i++) {
            SQLTools.getInstance().Update("insert into bcode (bcode,bname) values('0001','zgw')");

        }*/
        l = System.currentTimeMillis()-l;
        System.out.println("insert time s"+l/1000);

//        DataSet ds = SQLTools.getInstance().query("select * from gcode");
//        System.out.println(ds);
      //  SQLTools.getInstance().query2Redis("select * from gcode");
       // SQLTools.getInstance().Update("update gcode set gname='ipad',price='5000.00',descript='234' where icode =1\n");

       Date d = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        format.format(d);

//        SQLTools.getInstance().Update("insert into addr (recivename,addr,tel,mobil,createdate) values(?,?,?,?,?)",new String[]{
//        "zgw","广东","3236","13828259855",format.format(d)
//        });






//        System.out.println(sql);

    }
}
