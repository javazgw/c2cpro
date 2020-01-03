/*
 * Copyright (c) 2019.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.dataBase.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TestMSSQL {

    public static void main(String[] argc) throws ClassNotFoundException {
        //Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
       // Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Class.forName( "net.sourceforge.jtds.jdbc.Driver" );
        //Connection con = DriverManager.getConnection( "jdbc:jtds:sqlserver://<your server ip
        //address>:1433/zacmpf", userName, password );

        String url =  "jdbc:jtds:sqlserver://192.168.1.99:1433/ht1";
       // String url2 =  "jdbc:jtds:sqlserver://192.168.1.22:1433/ht2";
        /**
         *
         * Class.forName( "net.sourceforge.jtds.jdbc.Driver" );
         * Connection con = DriverManager.getConnection( "jdbc:jtds:sqlserver://<your server ip
         * address>:1433/zacmpf", userName, password );
         * Statement stmt = con.createStatement();
         */
        // Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        String connectionUrl =
//                "jdbc:sqlserver://192.168.1.23:1433;"
//                        + "database=ht1;"
//                        + "user=sa;"
//                        + "password=123321;"
//                        + "encrypt=true;"
//                        + "trustServerCertificate=false;"
//                        + "loginTimeout=30;";
//
//        String connectionUrl2 =
//                "jdbc:sqlserver://192.168.1.22:1433;"
//                        + "database=AdventureWorks;"
//                        + "user=sa;"
//                        + "password=123321;"
//                        + "encrypt=true;"
//                        + "trustServerCertificate=false;"
//                        + "loginTimeout=30;";

//---------1
        try(Connection connection = DriverManager.getConnection(url,"sa","123321");
            ResultSet rs =connection.createStatement().executeQuery("select count(*) as c from bcode");
        )
        {

            while(rs.next())
            {
                System.out.println("database1 bcode row count  = "+rs.getInt("c"));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
//--------2
//        try(Connection connection = DriverManager.getConnection(url2,"sa","Ht123456");
//            ResultSet rs =connection.createStatement().executeQuery("select count(*) as c from bcode");
//        )
//        {
//
//            while(rs.next())
//            {
//                System.out.println("database2 bcode row count  = "+rs.getInt("c"));
//            }
//        }
//        catch (SQLException e) {
//            e.printStackTrace();
//        }

//insert into database 1
        try (Connection connection = DriverManager.getConnection(url,"sa","123321");) {



            for(int i = 0;i<1;i++) {
                connection.createStatement().executeUpdate("insert into bcode (bcode,bname) values (123,'name_')");
            }


            // Code here.
        }
        // Handle any errors that may have occurred.
        catch (SQLException e) {
            e.printStackTrace();
        }



//insert into database 2
//       try (Connection connection = DriverManager.getConnection(url2,"sa","Ht123456");) {
//
//
//
//            for(int i = 0;i<2;i++) {
//                connection.createStatement().executeUpdate("insert into bcode (bcode,bname) values (123,'name_"+i+"')");
//            }
//
//
//            // Code here.
//        }
//        // Handle any errors that may have occurred.
//        catch (SQLException e) {
//            e.printStackTrace();
//        }




        //---------1
        try(Connection connection = DriverManager.getConnection(url,"sa","123321");
            ResultSet rs =connection.createStatement().executeQuery("select count(*) as c from bcode");
        )
        {

            while(rs.next())
            {
                System.out.println("result database1 bcode row count  = "+rs.getInt("c"));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
//--------2
//        try(Connection connection = DriverManager.getConnection(url2,"sa","Ht123456");
//            ResultSet rs =connection.createStatement().executeQuery("select count(*) as c from bcode");
//        )
//        {
//
//            while(rs.next())
//            {
//                System.out.println("result database2 bcode row count  = "+rs.getInt("c"));
//            }
//        }
//        catch (SQLException e) {
//            e.printStackTrace();
//        }

    }
}
