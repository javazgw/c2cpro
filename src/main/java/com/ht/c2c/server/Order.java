package com.ht.c2c.server;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Order implements Filter {
    private static final Pattern REWRITE_PATTERN = Pattern.compile("(^[1-9]\\d*)$");
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        String url = request.getRequestURL().toString();
        String number = url.substring(url.lastIndexOf("/")).replace("/", "");

        Matcher m = REWRITE_PATTERN.matcher(number);
        if(m.find()) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/BS?action=getorderitem&id=" + m.group(1));
            dispatcher.forward(servletRequest, servletResponse);
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    public void destroy() {

    }
}
