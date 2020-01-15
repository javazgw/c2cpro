/**
 * 
 */
package com.ht.c2c.dataBase;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Vector;

/**
 * @author zgw
 *2009-11-22 上午11:40:34
 * javazgw@gmail.com
 */
public class Row implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6586800595603708112L;

	Vector<Cell> v = new Vector<Cell>();
	@JSONField(serialize=false)
    DataSet dataSet;
	/**
	 * 空的构造函数，序列化的要求
	 */
	public Row()
	{
		
	}
	/**
	 * 设置新值
	 * @param key
	 * @param value
	 */
	public void PutValue(String key,String value)
	{
		Cell cell = new Cell();
		cell.setCellname(key);
		cell.setValue(value);
		addCell(cell);
	}
	/**
	 * 赋值。原来基础上赋值
	 * @param key
	 * @param value
	 */
	
	public void setValue(String key,String value)
	{
		boolean flag = false;
		for(Cell c:v)
		{
			if(c.getCellname().equals(key))
			{
				c.setValue(value);
				//flag =true;
                return;
			}
			
		}
		//if(!flag)
			PutValue(key, value);
	}
	public void addCell(Cell cell)
	{
		v.add(cell);
	}
	public void removeCell(Cell  cell)
	{
		v.remove(cell);
	}

	public String getValue(String name)
	{
		for(Cell c:v)
		{
			if(c.getCellname().equals(name))
			{
				return c.getValue();
			}
			
		}
		return null;
	}
	/**
	 * 根据列号取值
	 * @param index
	 * @return
	 */
	public String getValue(int index)
	{
		return v.get(index).getValue();
	}
/*	*//**
	 * 获取日期类型的字段值
	 * @param name
	 * @return
	 *//*
	public Date getDateValue(String name)
	{
		for(Cell c:v)
		{
			if(c.getCellname().equals(name))
			{
				return c.getDate();
			}
			
		}
		return null;
	}*/
	/**
	 * 获得字段类型，类型如同java.sql.Types里的类型
	 * @param name
	 * @return
	 */
	public int getCellType(String name)
	{
		for(Cell c:v)
		{
			if(c.getCellname().equals(name))
			{
				return c.getCelltype();
			}
			
		}
		return 0;
	}

	@JSONField(name="V")
	public Vector<Cell> getVector()
	{
		return v;
	}

    /**
     *
     * 获得被添加的DataSet
     * @return
     */
    public DataSet getDataSet() {
        return dataSet;
    }

    /**
     *  设置被添加的DataSet
     */

    public void setDataSet(DataSet dataSet) {
        if(this.dataSet==null)
        this.dataSet = dataSet;
    }
    public Cell getCell(String name)
    {
        for(Cell c:v)
        {
            if(c.getCellname().equals(name))
                return c;
        }
        return null;
    }

    @Deprecated
	public String toString()
    {
        return "name"+":"+v.toString();
    }
}
