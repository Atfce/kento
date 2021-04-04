package com.liangjian.ticket.config;

import com.liangjian.ticket.vo.Const;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;


//后台管理系统过滤器 避免没登录的人也能进来
public class BackendLoginFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        HttpServletResponseWrapper httpResponse = new HttpServletResponseWrapper((HttpServletResponse) servletResponse);
        String path = httpRequest.getRequestURI();
        if (path.contains("/backend/")) {
            if (path.contains("css") || path.contains("403") || path.contains("js") || path.contains("/backend/index")) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                HttpSession session = ((HttpServletRequest) servletRequest).getSession();
                if (Objects.isNull(session.getAttribute(Const.BACKEND_USER))) {
                    //未登录的
                    String[] paths = path.split("/");
                    path = "/backend/index/403";
                    httpRequest.getRequestDispatcher(path).forward(servletRequest, servletResponse);
                } else {
                    //已经登录的
                    filterChain.doFilter(servletRequest, servletResponse);
                }
            }
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
