package com.ht.c2c.dataBase;

import java.util.EventObject;

/**
 * Created by Administrator on 15-5-27.
 */
public class DataSetEvent extends EventObject {


    public EventType eventType;

    public Row r;
    public Cell c;
    public DataSet ds;
   public String colname,oldvalue,newvalue;
    /**
     * Constructs a prototypical Event.
     *
     * @param source The object on which the Event initially occurred.
     * @throws IllegalArgumentException if source is null.
     */
    public DataSetEvent(Object source) {
        super(source);
    }
    public DataSetEvent(Object source,EventType type)
    {
        this(source);

        this.eventType = type;
    }

    public DataSetEvent(Object source,DataSet ds,Row r,Cell c,EventType type)
    {
        super(source);
        this.ds = ds;
        this.r = r;
        this.c = c;
        this.eventType = type;


    }


    public static enum  EventType
    {
        DATASETNEW,
        LOADDATA,
        SETVALUE,
        SAVEDATASTART,
        SAVEDATACOMPLETE,
        ROWADD,
        ROWDELETE,
        CELLCHANGEED,
        CELLCHANGING

    }
    @Deprecated
    public static DataSetEvent DataSetChangeEvent(DataSet ds)
    {
        DataSetEvent dse = new DataSetEvent(ds);
        return dse;
    }

    @Deprecated
    public static DataSetEvent DataSetValueChangeEvent(DataSet ds,Row r,String colname,String oldvalue,String newvalue ,EventType type)
    {
        DataSetEvent dse = new DataSetEvent(ds);
        dse.colname=colname;
        dse.oldvalue = oldvalue;
        dse.newvalue = newvalue;
        dse.eventType = type;
        dse.ds = ds;
        dse.r = r;



        return dse;
    }
    public static DataSetEvent DataSetValueChangeEvent(DataSet ds,Row r,Cell c,String oldvalue,String newvalue ,EventType type)
    {
        DataSetEvent dse = new DataSetEvent(ds);
        assert  c!=null:"字段为什么是null!";
        dse.colname=c.cellname;
        dse.oldvalue = oldvalue;
        dse.newvalue = newvalue;
        dse.eventType = type;
        dse.ds = ds;
        dse.r = r;



        return dse;
    }

    /**
     * 行增加
     * @param row
     * @return
     */
    @Deprecated
    public static DataSetEvent DataSetRowAdd(Row row)
    {

        DataSetEvent dse = new DataSetEvent(row);
        return dse;
    }
}
