/*
 * Copyright (c) 2020.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.service;


import javax.jws.WebService;

@WebService(endpointInterface = "com.ht.c2c.service.ICXFService",
        portName = "HelloCXF",
        serviceName = "HelloCXFService",
        targetNamespace = "http://localhost/services/testCXF")
public class CXFServiceImpl implements ICXFService {

    @Override
    public String test1(String name) {
        return "Hello " + name;
    }

}