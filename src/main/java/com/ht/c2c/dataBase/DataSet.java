package com.ht.c2c.dataBase;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.parser.Feature;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ht.c2c.tools.SQLTools;
import org.slf4j.LoggerFactory;


import java.io.Serializable;
import java.util.*;
import java.util.logging.Logger;

import static com.ht.c2c.dataBase.DataSetEvent.DataSetValueChangeEvent;
import static com.ht.c2c.dataBase.DataSetTools.getJson;
import static com.ht.c2c.tools.SQLTools.getDateNow;

/**
 * json 格式
 *
 *  {"datasetid":{"row1":{"rowid":1,"name":"zgw"},"row2":{"rowid":1,"name":"zgw"}}}

 {
 "datasetid": {
 "rowid1": {
 "name": {
 "value": 123
 },
 "tel": {
 "value": 333
 }
 },
 "rowid2": {
 "name": {
 "value": 123
 },
 "tel": {
 "value": 333
 }
 }
 }
 }
 */
public class DataSet implements Serializable{

    transient  private Map<DataSetEvent.EventType,List> listener;

	/**
	 * 
	 */
	private static final long serialVersionUID = -670895950551932457L;
    protected String datasetid = new ObjectId().toString();

	protected Vector<Row> v = new Vector<Row>();
//	//和getrowcount 是有区别的，服务器并不会返回所有数据，返回数据的总数更快。
//	//所以totalcout只是告诉客户端总共有怎么多是数据，getrowcount
	//取消 用finddataset
//	int totalcout =0;
	
//	DataSet parentDs=null;//父数据集
//	java.util.LinkedList<DataSet> chileDS = new java.util.LinkedList<DataSet>();
//	String[] parentLinkString = null; //链接父数据集的关联字段
//	String[] chileLinkString = null;//子数据集和父数据集关联字段
/**
 * 空的构造函数，序列化的要求
 */
	
	public DataSet()
	{
       // fireEvent(DataSetEvent.EventType.DATASETNEW,new DataSetEvent(this, DataSetEvent.EventType.DATASETNEW));
	}
	public void addRow(Row row)
	{
		v.add(row);
        row.setDataSet(this);
		fireEvent(DataSetEvent.EventType.ROWADD,new DataSetEvent(row,this,row,null, DataSetEvent.EventType.ROWADD));
	}

    /**
     * 清楚所有
     */
    public void removeAll()
    {
        v.clear();
    }
	public void removerow(Row row)
	{
		v.remove(row);
        fireEvent(DataSetEvent.EventType.ROWDELETE,new DataSetEvent(row,this,row,null, DataSetEvent.EventType.ROWDELETE));
	}

    /**
     * 一般用于首次加载，触发加载完成事件，和addRow 的区别是触发事件不同
     * @param rows
     */
    public void loadData(Row[] rows)
    {
        for(Row r:rows)
        {
            v.add(r);
        }
        fireEvent(DataSetEvent.EventType.LOADDATA,new DataSetEvent(this, DataSetEvent.EventType.LOADDATA));
    }
	public Object getValue(int rownum,String name)
	{
		return v.get(rownum).getValue(name);
	}
	public Object  getValue(int rownum,int columnindex)
	{
		return v.get(rownum).getValue(columnindex);
	}
/*	*//**
	 * 获取日期类型的字段值
	 * @param rownum
	 * @param name
	 * @return
	 *//*
	public Date getDate(int rownum,String name)
	{
		return v.get(rownum).getDateValue(name);
	}*/
	/**
	 * 获得字段类型
	 * @param rownum
	 * @param name
	 * @return
	 */
	public int getCellType(int rownum,String name)
	{

		return v.get(rownum).getCellType(name);
	}
	public String toString()
	{
		String str = "";
		for(Row row : v)
		{
			for(Cell cell:row.getVector())
			{
				str +=" name="+cell.getCellname()+" value="+cell.getValue();
			}
			str +="\n";
		}
		return str;
	}
	/**
	 * dataset的行数
	 * @return
	 */
	public int getRowCount()
	{
		return v.size();
	}
	/**
     * 注意，有可能不准确，因为第二行和第一行是允许不一致的，如果是数据库查询结果是准确的
	 * 取得字段数量
	 * @return
	 */
	public int getColumncount()
	{
		return v.get(0).getVector().size();
	}
	
	public Row getRow(int index)
	{
		return v.get(index);
	}
	/**
	 * 设置行，列值
	 * @author zgw 20120802
	 * 
	 * @param row
	 * @param name
	 * @param value
	 * 
	 * 
	 */
	public void setValue(int row,String name,String value)
	{
		if(row>=getRowCount())
		{
			Row r = new Row();

			r.PutValue(name, value);
			addRow(r);
		}
		else {
          /*  fireEvent(DataSetEvent.EventType.CELLCHANGING,DataSetValueChangeEvent(this,v.get(row), name, v.get(row).getValue(name), value,DataSetEvent.EventType.CELLCHANGING));
            //fireEvent(DataSetEvent.EventType.CELLCHANGING,new DataSetEvent(v.get(row),this,v.get(row),null, DataSetEvent.EventType.CELLCHANGING));
			v.get(row).setValue(name, value);
            fireEvent(DataSetEvent.EventType.CELLCHANGEED,DataSetValueChangeEvent(this,v.get(row), name, v.get(row).getValue(name), value,DataSetEvent.EventType.CELLCHANGEED));
*/
            setValue(v.get(row),name, value);

        }
	}

    /**
     * 此函数看上去貌似很奇葩,都知道row了,直接赋值不可以吗
     * 偏偏在这里还要调用dataset的setValue
     * 理由是要触发事件.
     * @param row
     * @param name
     * @param value
     */
    public void setValue(Row row, String name,String value){
        //如果字段从无到有的赋值,这里有null 的错误

        fireEvent(DataSetEvent.EventType.CELLCHANGING,DataSetValueChangeEvent(this,row, name, row.getValue(name), value,DataSetEvent.EventType.CELLCHANGING));
//        fireEvent(DataSetEvent.EventType.CELLCHANGING,DataSetValueChangeEvent(this,row, name, row.getValue(name), value,DataSetEvent.EventType.CELLCHANGING));
        //fireEvent(DataSetEvent.EventType.CELLCHANGING,new DataSetEvent(v.get(row),this,v.get(row),null, DataSetEvent.EventType.CELLCHANGING));
        //v.get(row).setValue(name, value);
        row.setValue(name,value);
//        fireEvent(DataSetEvent.EventType.CELLCHANGEED,DataSetValueChangeEvent(this,row, name, row.getValue(name), value,DataSetEvent.EventType.CELLCHANGEED));
        fireEvent(DataSetEvent.EventType.CELLCHANGEED,DataSetValueChangeEvent(this,row, row.getCell(name), row.getValue(name), value,DataSetEvent.EventType.CELLCHANGEED));
    }
    @JSONField(name="DataSet")
    public Vector<Row> getV() {
        return v;
    }

    public void fireEvent(DataSetEvent.EventType type,DataSetEvent dataSetEvent)
    {

        if(listener!=null)
        {
            List<DataSetListener> list = listener.get(type);
                    if(list!=null)
                    {
                            for(DataSetListener dsl : list)
                            {
                                if(dsl==null)
                                {
                                    System.out.println("dsl is null");
                                }
                                if(dataSetEvent==null)
                                {
                                    System.out.println("datasetevent is null");
                                }
                                 dsl.DataSetEvnetHandle(dataSetEvent);
                            }
                    }
        }

    }

    public void addDataSetLinstener(DataSetEvent.EventType type,DataSetListener dsl)
    {
        if(dsl == null)
            return ;
        if(listener == null)
            listener = new HashMap<DataSetEvent.EventType,List>();
        List<DataSetListener> list = listener.get(type);
        if(list == null)
        {
            list = new ArrayList<DataSetListener>();
            listener.put(type,list);
        }
        if(!list.contains(dsl))
            list.add(dsl);
    }

    public String getDatasetid() {
        return datasetid;
    }

    public void setDatasetid(String datasetid) {
        this.datasetid = datasetid;
    }

    /**
     * 保存提供接口外部定义
     * @param dssl
     */
    public void save(DataSetSaveListener dssl)
    {
        dssl.save(this);
    }

    /**
     * rowid 作为关键字,每行都有唯一的id
     * @param rowid
     * @return
     */
    public Row getRow(String rowid)
    {
        for(Row r:getV())
        {
            if(rowid.equals(r.getValue("rowid")))
                return r;
        }
        return null;
    }

    /**
     * 查找行,找到第一个匹配的行 返回row
     *
     * @param name 字段名称
     * @param value 查找字段对应的值 string
     * @return
     */
    public Row getRow(String name,String value)
    {
        for(Row r:getV())
        {
            if(value.equals(r.getValue(name)))
            {
                return r;
            }
        }
        return null;
    }
    public static void main(String[] argc)
    {


//        SerializeConfig.getGlobalInstance().put(Row.class, new RowSerializer());
        SerializeConfig.getGlobalInstance().put(DataSet.class, new DataSetSerializer());

           DataSet ds = new DataSet();
        ds.addDataSetLinstener(DataSetEvent.EventType.CELLCHANGING,new DataSetListener() {
            @Override
            public void DataSetEvnetHandle(DataSetEvent event) {
                System.out.println("say hi cellchanging"+event.newvalue+event.oldvalue);
            }
        });
        Row r = new Row();
        r.setValue("sex","2");
        ds.addRow(r);
        r.setValue("icode","1");
        ds.setValue(0,"name","4444");

        Row r2 = new Row();
        r2.setValue("icode","2");
        r2.setValue("name","row2");
        r2.setValue("json","[{\"uid\":1580972678514,\"name\":\"2d4ff8e5-2fb3-49a7-8ecd-7b4f592b36a0.jpg\",\"url\":\"http://localhost:8080/uploaddata/2d4ff8e5-2fb3-49a7-8ecd-7b4f592b36a0.jpg\",\"status\":\"success\"},{\"uid\":1580972678514,\"name\":\"2d4ff8e5-2fb3-49a7-8ecd-7b4f592b36a0.jpg\",\"url\":\"http://localhost:8080/uploaddata/96c49f78-7da7-4fbe-9f98-864234e5fd82.png\",\"status\":\"success\"}]");
        ds.addRow(r2);
      //  System.exit(1);




        String jsonString = JSON.toJSONString(ds); // 序列化的时候传入filter

        JSONArray ja =(JSONArray)JSON.parseArray(jsonString);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("ds",ja);
        JSONObject jinfo = new JSONObject();
        jinfo.put("total",10);
        jinfo.put("onepagenum","{name:'1212'}");
        jinfo.put("curpagenum",1);

        jsonObject.put("info",jinfo);


        System.out.println(JSON.toJSONString(jsonObject));
        System.out.println("---"+  getJson(ds));
        System.out.println("---"+  jsonString);
        System.out.println("---"+   JSON.toJSONString(r));
        System.out.println("---"+   JSON.toJSONString(r2));



        Hashtable<String,Object> ht = new Hashtable<String,Object>();
        ht.put("k",ht);
        //System.out.println(ht.size());

     /*   String str = "{\"name\":\"213123\",\"addr\":\"123\",\"descript\":\"1231231\",\"aaa\":null,\"resultdesc\":\"23123123\",\"status\":\"待处理\",\"fileList\":[{\"name\":\"7c0447da-dcb2-454e-8fdd-ae5978dc7b39.png\",\"url\":\"http://localhost:8080\\\\uploaddata\\\\7c0447da-dcb2-454e-8fdd-ae5978dc7b39.png\",\"uid\":1580740572720,\"status\":\"success\"}],\"value\":{\"pic\":null}}";
       Object jo = JSON.parse(str);
       System.out.println(jo.getClass());
       // Object jo = JSON.parse(createstr);
      //  Hashtable<String,Object> ht1    = JSON.toJavaObject((JSONObject)jo,Hashtable.class);
        Hashtable<String,Object> ht1 = JSON.parseObject(str, Hashtable.class, Feature.NonStringKeyAsString);
        System.out.println(ht1);*/

        String str = "{}";

        HashMap<String,Object> ht1 = JSON.parseObject(str, HashMap.class);
        ht1.put("zgw",null);
        System.out.println(ht1);

        String updatejson = "{filelist:[{\"name\":\"123\"}]}";
        HashMap<String,Object> ht3 = JSON.parseObject(updatejson, HashMap.class);

        ht.put("updatedate",getDateNow());

        String keyjson = "{'icode':'67e1019b-1849-4bb0-a70c-6b67bf55e74d'}";
        HashMap<String,Object> keyht = JSON.parseObject(keyjson, HashMap.class);
        try {
           // SQLTools.getInstance().updateFromHt("maintain",ht3,keyht);
            DataSet ds1 = SQLTools.getInstance().query("select icode,filelist,name from maintain where icode  ='67e1019b-1849-4bb0-a70c-6b67bf55e74d'");
//            DataSet ds1 = SQLTools.getInstance().query("select icode,filelist,name from maintain limit 0,3");


            System.out.println(getJson(ds1));

        } catch (Exception e) {
            e.printStackTrace();
        }


        String str1 =null;
        String str2 ="1";
        if(str1!=null && !str1.equals("3"))
        {
            System.out.println("true");
        }
        else
        {
            System.out.println("false");
        }
    }
}
