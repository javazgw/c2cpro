package com.ht.c2c.dataBase;

import java.util.EventListener;

/**
 * Created by Administrator on 15-5-27.
 */
public interface  DataSetListener extends EventListener {
    public void DataSetEvnetHandle(DataSetEvent event);
}
