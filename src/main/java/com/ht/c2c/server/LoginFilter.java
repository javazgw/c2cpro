package com.ht.c2c.server;

import javax.servlet.*;
import java.io.IOException;

/**
 * Created by guangwangzhuang on 2019/4/12.
 */
public class LoginFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        filterChain.doFilter(servletRequest,servletResponse);
    }

    public void destroy() {

    }
}
