package com.ht.c2c.dataBase;

import com.alibaba.fastjson.serializer.JSONSerializer;
import com.alibaba.fastjson.serializer.ObjectSerializer;
import com.alibaba.fastjson.serializer.SerializeWriter;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.Vector;

public class CellSerializer implements ObjectSerializer {
    public static final  CellSerializer instance = new  CellSerializer();
    @Override
    public void write(JSONSerializer jsonSerializer, Object o, Object o1, Type type, int i) throws IOException {
        SerializeWriter out = jsonSerializer.out;
        if (o == null) {
            System.out.println("null");
            out.writeNull();
            return;
        }


        System.out.println("name"+o+"  o1="+o1+"  type = "+type +""+i);
        //原来的值code
        String strVal = o.toString();
        System.out.println(strVal);
        //通过code查找相关名称，测试先写死值

//        out.writeString(name);
//        String str = "";
        //str +=((Cell)o).getCellname()+":{v:";
        //str += ((Cell)o).getValue()+":{t:";;
       // str += ((Cell)o).getCelltype()+"}";

//        out.writeString(((Cell)o).getCellname(),'\n');

//        out.writeFieldValue(' ',((Row)o).getValue(),((Row)o).getValue());
      //  out.writeString("\u0000");
      //  out.writeString(":{"+((Cell)o).getValue(),' ');
//    /    out.writeString("}");
        Row r = ((Row)o);
        Vector<Cell> v = r.getVector();
//        out.writeFieldValue(' ',((Row)o).getVector(),((Row)o).getValue());
        out.writeFieldName(r.getValue("icode"));

        out.write('{');
//        out.writeFieldName(c.getCellname());
        int count = 0;
        for(Cell c :v)
        {
            count++;
            out.writeFieldName(c.getCellname());
            out.write('{');
            out.writeString("value");
            out.write(':');
            out.writeString(c.getValue());
            out.write(',');
            out.write("\"type\":");
            out.writeInt(c.getCelltype());
//            out.writeFieldName(c.getValue());
            out.write('}');

            if(count!=v.size())
                out.write(',');
        }
        out.write('}');
    }
}
