/*
 * Copyright (c) 2019.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.shoping;

import com.ht.c2c.dataBase.DataSet;
import com.ht.c2c.tools.SQLTools;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Shopingcar {
    private Shopingcar shopingcar;
    String cname;
    ArrayList<Shopitem> al = new ArrayList<Shopitem>();

    public Shopingcar(String cname)
    {
        this.cname = cname;

        Connection con = null;
        try {
            con = SQLTools.getInstance().getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from shoppingcar where cname='"+cname+"'");

            while (rs.next()) {
                Shopitem shopitem = new Shopitem();
                shopitem.setGoodsid(rs.getString("gcode"));
               // shopitem.setGoodsname(rs.getString("gname")==null?"":rs.getString("gname"));
                shopitem.setNum(rs.getInt("num"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    public boolean add(Shopitem item)
    {
        try {

            DataSet ds = SQLTools.getInstance().query("select num from shoppingcar where cname = '"+this.cname+"' and gcode ='"+item.goodsid+"'");
            if(ds.getRowCount()==0)
            {

                SQLTools.getInstance().Update("insert into shoppingcar (cname,gcode,num) values('" + this.cname + "','" + item.goodsid + "'," + item.getNum() + ")");
                al.add(item);
            }
            else
            {
                //购物车里有商品就加1
                item.setNum(1+Integer.parseInt(ds.getValue(0,"num")));
                changeNum(item);
            }

        } catch (Exception e) {
            //e.printStackTrace();
            return false;
        }
        return true;

    }
    public boolean removeItem(Shopitem item)
    {
        try {
            SQLTools.getInstance().Update("update shoppiingcar set status =1 where gcode ='"+item.goodsid+"' and cname ='"+this.cname+"'");
            al.remove(item);

        } catch (Exception e) {
            //e.printStackTrace();
            return false;
        }
        return true;

    }

    public boolean changeNum(Shopitem item)
    {
        try {
            SQLTools.getInstance().Update("update shoppingcar set num ="+item.num+" where gcode ='"+item.goodsid+"' and cname ='"+this.cname+"'");
            for(Shopitem si:al)
            {
                if(si.goodsid.equals(item.goodsid))
                {
                    si.num = item.num;
                }
            }

        } catch (Exception e) {
            //e.printStackTrace();
            return false;
        }
        return true;
    }


}
