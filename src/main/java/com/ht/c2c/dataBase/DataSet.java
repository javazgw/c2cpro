package com.ht.c2c.dataBase;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.*;

import static com.ht.c2c.dataBase.DataSetEvent.DataSetValueChangeEvent;

/**
 * json 格式
 *
 *  {"datasetid":{"row1":{"rowid":1,"name":"zgw"},"row2":{"rowid":1,"name":"zgw"}}}


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
	public String getValue(int rownum,String name)
	{
		return v.get(rownum).getValue(name);
	}
	public String  getValue(int rownum,int columnindex)
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
    @JSONField(name="V")
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

         /*   DataSet ds = new DataSet();
        ds.addDataSetLinstener(DataSetEvent.EventType.CELLCHANGING,new DataSetListener() {
            @Override
            public void DataSetEvnetHandle(DataSetEvent event) {
                System.out.println("say hi cellchanging"+event.newvalue+event.oldvalue);
            }
        });
        Row r = new Row();
        r.setValue("rowid","2");
        ds.addRow(r);
        r.setValue("rowid","333");
        ds.setValue(0,"rowid","4444");
        System.exit(1);
*/
        Hashtable<String,Object> ht = new Hashtable<String,Object>();
        ht.put("k",ht);
        System.out.println(ht.size());

    }
}
