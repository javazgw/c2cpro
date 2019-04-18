package com.ht.c2c.tools;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import org.apache.log4j.PropertyConfigurator;

import javax.sql.DataSource;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;
import java.util.logging.Logger;

/**
 * Created by guangwangzhuang on 2019/4/12.
 */
public class Configure {
    private static Configure configure = null;
   // DataSet sqltableDataSet;
    Properties properties = new Properties();
    static String desettingfile;
    static Logger logger;

    private Configure() throws IOException {
        desettingfile = Configure.class.getProtectionDomain().getCodeSource().getLocation() + "setting.ini";
//        desettingfile = Configure.class.getResource("setting.ini").getFile();
        desettingfile = desettingfile.substring(5, desettingfile.length());
        PropertyConfigurator.configure(desettingfile);
        logger = Logger.getLogger("dev");
        initProperties(desettingfile);


    }

    public static Configure getInstance() {
        if (configure == null)
            try {
                configure = new Configure();
            } catch (IOException e) {
                e.printStackTrace();
            }
        return configure;
    }

    public void initProperties(String filepath) throws IOException {
        log("load path:" + filepath);


        properties.load(new FileReader(filepath));


    }

    public DataSource getDataSource() throws Exception {
        DataSource dataSource = DruidDataSourceFactory.createDataSource(this.properties);
        return dataSource;
    }

    /**
     * 读取数据库的配置文件
     *
     * @throws Exception
     */
    public void loadConfig() throws Exception {


    }

    public static void warn(String warn) {

    }

    public static void error(String err) {


    }

    public static void info(String info) {

    }

    public static void log(String msg) {

        System.out.println(msg);
    }

    //    public static void log(String msg)
//    {
//        log(Level.INFO,msg);
//    }
    public Properties getProperties() {
        return properties;
    }

    public static void main(String[] argv) throws IOException {
        Configure c = Configure.getInstance();
        System.out.println(c.getProperties());

        System.out.println(Configure.class.getProtectionDomain().getCodeSource().getLocation());
    }
}
