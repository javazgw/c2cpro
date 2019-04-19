/*
 * Copyright (c) 2019.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.server;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 用户端servlet
 * 负责用户登陆，用户配置，购车车，订单
 */
@WebServlet(name = "cc")
public class CcodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
