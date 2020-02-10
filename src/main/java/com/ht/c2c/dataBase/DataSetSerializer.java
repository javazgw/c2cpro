package com.ht.c2c.dataBase;

import com.alibaba.fastjson.serializer.JSONSerializer;
import com.alibaba.fastjson.serializer.ObjectSerializer;
import com.alibaba.fastjson.serializer.SerializeWriter;

import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.Types;
import java.util.Vector;

public class DataSetSerializer implements ObjectSerializer {
    public static final RowSerializer instance = new RowSerializer();
    @Override
    public void write(JSONSerializer jsonSerializer, Object o, Object o1, Type type, int i) throws IOException {
        SerializeWriter out = jsonSerializer.out;
        if (o == null) {
            System.out.println("null");
            out.writeNull();
            return;
        }

        DataSet ds = ((DataSet)o);
        Vector<Row> v = ds.getV();
        out.write("[");
        int rowcount = 0;
        for(Row r : v)
        {
            rowcount++;


            Vector<Cell> cellVector = r.getVector();
            int count = 0;
            out.write('{');
            for(Cell c :cellVector)
            {
                count++;

                out.writeFieldName(c.getCellname());

                if(c.getValue()!=null) {

                    if(c.getCelltype()==Types.LONGVARCHAR)
                    {
                        out.write(c.getValue().toString());
                    }
                    else {
                        out.writeString(c.getValue().toString());
                    }
                }
                else
                {
                    out.writeNull();
                }

                if(count!=cellVector.size())
                    out.write(',');

            }

            out.write('}');

            if(rowcount!=v.size())
                out.write(',');

        }
        out.write(']');


//        if(rowcount!=v.size())
//            out.write(',');

    }
}
