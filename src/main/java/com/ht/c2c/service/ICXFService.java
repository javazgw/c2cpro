/*
 * Copyright (c) 2020.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.service;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
@WebService(name = "/cxfService")
//@WebService(name = "cxfService", targetNamespace = "http://localhost/services/testCXF")
public interface ICXFService {

    @WebMethod
    String test1(@WebParam(name = "name")String name);
}