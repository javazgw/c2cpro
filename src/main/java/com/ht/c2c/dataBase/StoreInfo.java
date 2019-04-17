package com.ht.c2c.dataBase;


import java.io.Serializable;
import java.util.HashMap;

/**StoreInfo作为和服务器端数据交互的重要的类，里面定义了数据的表名，字段名，外码等，可以被序列化
 * 其用法通常有，
 * 一。通过定义，和服务器获取数据在BaseStroe里
 * 例如：
 * 
 * StoreInfo info = new StoreInfo();
*
*		info.setTablename("s_service_po_g");
*		info.setSql("select * from s_service_po_g where upicode='{icode}'");
*		info.setParent(store);// 关联主表
**		// info.setAutoinccolumn("idx"); // 自增字段，如果子表一定需要
	*	info.setLinkparentcolumns(new String[] { "icode" }); // 关联主表字段
	*	info.setLinkparent_chile_columns(new String[] { "upicode" });// 关联主表字段
	*																	// (子表)
*
*		info.setKeyname(new String[] { "icode" }); // 主键
*
*		s_service_po_g_store = new BaseStore<BusiObject>(type, info);
*		
*	
*二。jsp中使用的定义	
*
*三。可以功过自己定义里面的内容编写服务端代码。
*但是此类的设计初衷是轻量级。
*注意，因为此类是基础常用类，于是如果在服务器端有特殊的用法，记得代码review的时候注释里补充使用例子。
 * 外码产生方式 2010-10
 * INC 大写，4位自增长度，CODENAMEFILTER 是过滤条件，影响自增的计算，要注意
 * CODENAME 是外码的字段
 * 	info.addBusiParams("CODENAMEPARAMS", "{D:MMdd}{-}{INC:4}");
		info.addBusiParams("CODENAMEFILTER", "1=1");
		info.addBusiParams("CODENAME", "codename");
 * @author Administrator
 *2010-10-15
 * javazgw@gmail.com
 */
public class StoreInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9217089346351015561L;
	String sql = null;
	transient String filter = null;

	transient String[] linkparentcolumns = null; // 与主表关联的字段 (主表字段)
	transient String[] linkparent_chile_columns = null; // 与主表关联的字段（子表字段）
	 String advsearch = null; // 高级搜索
	transient String targetcolumn = ""; // 高级搜索瞄准字段
	transient String autoinccolumn = null; // 自增字段
	


	 String sortcolumn = null; // 提交到服务器端进行orderby的字段，用,分割开
	 String limit = "50";
	 String start = null;
	 String needAllRow = null; // 如果有值则通知服务器不用计算行的总数，否则需要计算
	 String forcenolimit="false";//强制服务器不分页，默认分页，true为不分页
	// transient HashMap filterparmas; //zgw 2009-11-02 添加新的子表过滤方法，在主表换行的时候，采用
	// 替换值的方式 @see com.base.myproject.client.busi.BaseStore

	String tablename = null;
	String treesortcolumn;//树状结构的排序字段；
	String busicode;//业务编码
	
	transient HashMap<String, String> parmas= new HashMap<String, String>();
	/*传给服务器的hashmap，内容一般有使用者自己定义。可以被序列化传到服务器
	 *
	 *
	 * 1.jsp显示table和导出excel使用。
	 *
	 * 注意此处规则无规范。自己搜索getExtParmas函数确定哪里使用了。
	 */
	transient HashMap<String, Object> extparmas= new HashMap<String, Object>();
	HashMap<String, String> busiparmas= new HashMap<String, String>();
	private String[] keyname = null; // 主键

	String sqltablename =null;//在表sqltable里定义获取数据的sql
	//组织的sql宏，传参数用
	HashMap<String, String> sqlmacro= new HashMap<String, String>();

	public String getAutoinccolumn() {
		return autoinccolumn;
	}

	public void setAutoinccolumn(String autoinccolumn) {
		this.autoinccolumn = autoinccolumn;
	}

	public String getTargetcolumn() {
		return targetcolumn;
	}

	public void setTargetcolumn(String targetcolumn) {
		this.targetcolumn = targetcolumn;
	}

	public String getAdvsearch() {
		return advsearch;
	}

	public void setAdvsearch(String advsearch) {
		this.advsearch = advsearch;
	}

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	// where 1=1;
	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}

	public String[] getLinkparentcolumns() {
		return linkparentcolumns;
	}
/**
 * setLinkparentcolumns
	 * 与setLinkparent_chile_columns必须成对使用
 * @param linkparentcolumns
 */
	public void setLinkparentcolumns(String[] linkparentcolumns) {
		this.linkparentcolumns = linkparentcolumns;
	}

	/**
	 * @return the linkparent_chile_columns
	 */
	public String[] getLinkparent_chile_columns() {
		return linkparent_chile_columns;
	}

	/**
	 * 子表与主表关联字段，用于子表添加记录的时候保持和主表内容一致,setLinkparentcolumns
	 * 与setLinkparent_chile_columns必须成对使用
	 *
	 * @param linkparent_chile_columns
	 *            the linkparent_chile_columns to set
	 */
	public void setLinkparent_chile_columns(String[] linkparent_chile_columns) {
		this.linkparent_chile_columns = linkparent_chile_columns;
	}

	/**
	 * @return the need_total_row_num
	 */
	public String getNeedAllRow() {
		return needAllRow;
	}


	public void setNeedAllRow(String needAllRow) {
		this.needAllRow = needAllRow;
	}

	public StoreInfo() {

	}

	public HashMap<String, String> getParmas() {
		return parmas;
	}

	public void setParmas(HashMap<String, String> parmas) {
		this.parmas = parmas;
	}
	/**
	 * 兼容getStoreInfoString
	 * 采用ht的方式，
	 * @return
	 * @deprecated
	 */
	public HashMap<String,String> getstoreinfoht()
	{

		{
//			sbf.append("tableinftablename=" + getTablename());
			parmas.put("tableinftablename" , getTablename());
		}
		if (getFilter() == null) {
//			sbf.append("&tableinfsql=" + getSql());
			parmas.put("tableinfsql" , getSql());
		} else {
//			sbf.append("&tableinfsql=" + getSql() + getFilter());
			parmas.put("tableinfsql" , getSql() + getFilter());
		}

		if (getAdvsearch() != null) {
//			sbf.append("&advsearch=" + getAdvsearch());
			parmas.put("advsearch" , getAdvsearch());
		}
		if (getAutoinccolumn() != null) {
//			sbf.append("&autoinccolumn=" + getAutoinccolumn());
			parmas.put("autoinccolumn" , getAutoinccolumn());
		}
		if (getSortcolumn() != null) {
//			sbf.append("&sortcolumn=" + getSortcolumn());
			parmas.put("sortcolumn" , getSortcolumn());
		}
		if (getLimit() != null) {
//			sbf.append("&limit=" + getLimit());
			parmas.put("limit" , getLimit());
		}
		if (getStart() != null) {
//			sbf.append("&start=" + getStart());
			parmas.put("start" , getStart());
		}
		if (getNeedAllRow() != null) {
//			sbf.append("&needallrow=" + getNeedAllRow());
			parmas.put("needallrow" , getNeedAllRow());
		}
		if (getForcenolimit() != null) {
//			sbf.append("&forcenolimit=" + getForcenolimit());
			parmas.put("forcenolimit" , getForcenolimit());
		}

		if (getBusicode() != null) {
			parmas.put("busicode" ,getBusicode());
		}

		return parmas;
	}
	/**
	 * 旧版本的处理办法，用getstoreinfoht代替
	 * @return
	 */
@Deprecated
	public String getStoreInfoString() {
		StringBuffer sbf = new StringBuffer();
		// if(getTablename()!=null)
		{
			sbf.append("tableinftablename=" + getTablename());

		}
		if (getFilter() == null) {
			sbf.append("&tableinfsql=" + getSql());
		} else {
			sbf.append("&tableinfsql=" + getSql() + getFilter());
		}

		if (getAdvsearch() != null) {
			sbf.append("&advsearch=" + getAdvsearch());
		}
		if (getAutoinccolumn() != null) {
			sbf.append("&autoinccolumn=" + getAutoinccolumn());
		}
		if (getSortcolumn() != null) {
			sbf.append("&sortcolumn=" + getSortcolumn());
		}
		if (getLimit() != null) {
			sbf.append("&limit=" + getLimit());
		}
		if (getStart() != null) {
			sbf.append("&start=" + getStart());
		}
		if (getNeedAllRow() != null) {
			sbf.append("&needallrow=" + getNeedAllRow());
		}
		if (getForcenolimit() != null) {
			sbf.append("&forcenolimit=" + getForcenolimit());
		}
		if (getBusicode() != null) {
			sbf.append("&busicode=" + getBusicode());
		}

		return new String(sbf);
	}

	public String getForcenolimit() {
		return forcenolimit;
	}
/**
 * 强制服务器不分页，默认分页，true为不分页
 * @param forcenolimit
 */
	public void setForcenolimit(String forcenolimit) {
		this.forcenolimit = forcenolimit;
	}

	public String[] getKeyname() {
		return keyname;
	}

	public void setKeyname(String[] keyname) {
		this.keyname = keyname;
	}

	public String getSortcolumn() {
		return sortcolumn;
	}

	public void setSortcolumn(String sortcolumn) {
		this.sortcolumn = sortcolumn;
	}

	public String getLimit() {

		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getTreesortcolumn() {
		return treesortcolumn;
	}

public HashMap<String, String> getBusiparmas() {
		return busiparmas;
	}

	public void setBusiparmas(HashMap<String, String> busiparmas) {
		this.busiparmas = busiparmas;
	}

	public void addBusiParams(String key,String value)
	{
		this.busiparmas.put(key, value);
	}

/**
 * 只在树状结构数据的时候才有用，
 * @param treesortcolumn 排序字段
 */

	public void setTreesortcolumn(String treesortcolumn) {
		this.treesortcolumn = treesortcolumn;
	}

public String getBusicode() {
	return busicode;
}

public void setBusicode(String busicode) {
	this.busicode = busicode;
}

public HashMap<String, Object> getExtparmas() {
	return extparmas;
}

public void setExtparmas(HashMap<String, Object> extparmas) {
	this.extparmas = extparmas;
}


public void addExtparmas(String key,Object o)
{
	this.extparmas.put(key, o);

}
public Object getExtParmas(String key)
{
	return this.extparmas.get(key);
}

public String getSqltablename() {
	return sqltablename;
}

public void setSqltablename(String sqltablename) {
	this.sqltablename = sqltablename;
}

public HashMap<String, String> getSqlmacro() {
	return sqlmacro;
}

public void setSqlmacro(HashMap<String, String> sqlmacro) {
	this.sqlmacro = sqlmacro;
}



}
