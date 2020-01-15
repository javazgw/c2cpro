/**
 * 
 */
package com.ht.c2c.dataBase;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;

/**
 * gwt数据库中的单元，包含名字，值，数据类型
 * @author zgw
 *2009-11-22 上午11:32:41
 * javazgw@gmail.com
 */
public class Cell implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7796088839652470203L;

	String cellname;
	int celltype;
	String value;
	@JSONField(serialize=false)
    Row row;

	public static final int  _nothing = 1;
	public static final int  _insert = 2;
	public static final int  _update = 4;
	public static final int  _delete = 8;
	/**
	 * 空的构造函数，序列化的要求
	 */
	public Cell()
	{
		
	}
    public Cell(String cellname,String value)
    {
        this.cellname =cellname;
        this.value = value;
    }
	/**
	 * @return the cellname
	 */
	@JSONField(name="cellname")
	public String getCellname() {
		
		return cellname;
	}
	/**
	 * @param cellname the cellname to set
	 */
	@JSONField(name="cellname")
	public void setCellname(String cellname) {
		this.cellname = cellname;
	}
	
	/**
	 * @return the value
	 */
	@JSONField(name="value")
	public String getValue() {
		return value;
	}
	/**
	 * @param value the value to set
	 */
	@JSONField(name="value")
	public void setValue(String value) {
		this.value = value;
	}
	
/*	public Date getDate()
	{
		return (Date)value;
	}*/
	public int getCelltype() {
		return celltype;
	}
	public void setCelltype(int celltype) {
		this.celltype = celltype;
	}

    /**
     * 获得父row
     * @return
     */
    public Row getRow() {
        return row;
    }

    /**
     *
     * 设置父row
     * @param row
     */

    public void setRow(Row row) {
        if(this.row == null)
        this.row = row;
    }
}
