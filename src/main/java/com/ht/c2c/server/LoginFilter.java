package com.ht.c2c.server;

import com.ht.c2c.tools.JWT;
import io.jsonwebtoken.Claims;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by guangwangzhuang on 2019/4/12.
 */
public class LoginFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;

        System.out.println("token = "+httpServletRequest.getHeader("token"));
        String tokenStr = httpServletRequest.getHeader("token");
        if (tokenStr != null ) {

            try {
                Claims str  =  JWT.parseJWT(tokenStr);
                System.out.println(str);

            }

            catch (Exception e) {

                //不要抛出异常.....难看
               // System.out.println(e.getMessage());
            }
        }
        filterChain.doFilter(servletRequest,servletResponse);
    }

    public void destroy() {

    }
}
