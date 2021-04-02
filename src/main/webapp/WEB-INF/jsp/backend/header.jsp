<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getRequestURI();
    pageContext.setAttribute("path", path);
%>
<c:set var="path" value="${path}"/>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <a class="navbar-brand" href="${ctx}/backend/home">管理后台</a>

    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link ml-5
                <c:if test="${fn:contains(path,'flight')}">
                    active
                </c:if>" href="${ctx}/backend/flight">航班管理</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-3
                <c:if test="${fn:contains(path,'order')}">
                    active
                </c:if>" href="${ctx}/backend/order">订单管理</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-3
                <c:if test="${fn:contains(path,'message')}">
                    active
                </c:if>" href="${ctx}/backend/message">留言管理</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-3
                <c:if test="${fn:contains(path,'user')}">
                    active
                </c:if>" href="${ctx}/backend/user">用户管理</a>
            </li>
        </ul>

        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#">超级管理员</a>
            </li>
        </ul>
    </div>
</nav>