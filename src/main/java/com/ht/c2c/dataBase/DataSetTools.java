package com.ht.c2c.dataBase;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.NameFilter;

public class DataSetTools {

    public DataSetTools()
    {

    }

    public static String getJson(DataSet dataSet)
    {
        NameFilter filter = new NameFilter() {

            @Override
            public String  process(Object source, String name, Object value) {

                System.out.println("----------------source=" + source);
                System.out.println("----------------name=" + name);
                System.out.println("----------------value=" + value);
                System.out.println("");
                // 属性是id并且大于等于100时进行序列化
                if ("ROWID".equals(name)) {
                    //long id = ((Long) value).longValue();
                    //return id >= 100;
                    name = ((Row)source).getValue("icode").toString();

                }
                return name;
            }
        };



        String jsonString = JSON.toJSONString(dataSet,filter);

        return jsonString;
    }
}
