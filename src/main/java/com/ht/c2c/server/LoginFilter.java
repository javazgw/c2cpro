package com.ht.c2c.server;

import com.alibaba.fastjson.JSON;
import com.ht.c2c.returnObject.ReturnObject;
import com.ht.c2c.tools.JWT;
import io.jsonwebtoken.Claims;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


/**
 * Created by guangwangzhuang on 2019/4/12.
 * 记住dofilter 内不要有任何system.out.println的输出
 * 会导致输出异常。前端收到错误
 */
public class LoginFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;
       // responseContext.getHeaders().add("X-Powered-By", "Jersey :-)");
        System.out.println("---doFilter ---");
        String tokenStr = httpServletRequest.getHeader("token");
        if (tokenStr != null ) {


            try {
                Claims str = JWT.getInstance().parseJWT(tokenStr);
                String token = JWT.getInstance().refreshToken(tokenStr);
                httpServletResponse.addHeader("token", token);

                ReturnObject rto = new ReturnObject();
                rto.setMsg("errorhaah");
                rto.setType(123);

                PrintWriter out = httpServletResponse.getWriter();
                out.print(JSON.toJSON(rto));
                return;

            }
            catch (Exception e)
            {
                PrintWriter out = httpServletResponse.getWriter();
                out.print(e.getMessage());
            }



        }
        httpServletResponse.setHeader("X-Powered-By","httech");
//        httpServletResponse.setHeader("Access-Control-Allow-Origin", "*");
        httpServletResponse.setHeader("Access-Control-Allow-Origin", "http://localhost:9527");
        httpServletResponse.setHeader("Access-Control-Allow-Credentials", "true");
        httpServletResponse.setHeader("Access-Control-Allow-Methods", "*");
        httpServletResponse.setHeader("Access-Control-Allow-Headers", "content-type,HT-Token,x-token,token,id,x-powered-by");
        httpServletResponse.setHeader("Access-Control-Request-Headers", "Origin, X-Requested-With, content-Type, Accept, Authorization");
//        httpServletResponse.setHeader("Access-Control-Allow-Methods", "POST, GET, PUT, DELETE, OPTIONS");

//        if (httpServletRequest.getMethod().equals("OPTIONS")) {
//            httpServletResponse.setStatus(HttpServletResponse.SC_ACCEPTED);
//            return;
//        }
        filterChain.doFilter(servletRequest,httpServletResponse);

       }

    public void destroy() {

    }
}
