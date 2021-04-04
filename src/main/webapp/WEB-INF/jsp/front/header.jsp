<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getRequestURI();
    pageContext.setAttribute("path", path);
%>
<c:set var="path" value="${path}"/>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

<link href="${ctx}/static/css/front/common.css" rel="stylesheet" type="text/css">
<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
    <a class="navbar-brand" href="${ctx}/index">订票系统</a>

    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item
                <c:if test="${fn:contains(path,'index')}">
                    active
                </c:if>">
                <a class="nav-link" href="${ctx}/index">首页</a>
            </li>
            <c:if test="${user != null}">
                <li class="nav-item
                <c:if test="${fn:contains(path,'/user')}">
                    active
                </c:if>">
                    <a class="nav-link" href="${ctx}/user/info">个人中心</a>
                </li>
            </c:if>
        </ul>

        <ul class="navbar-nav">
            <c:if test="${user == null}">
                <li class="nav-item">
                    <a class="nav-link" href="#" id="goToLogin">登录</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link">|</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${ctx}/register">注册</a>
                </li>
            </c:if>
            <c:if test="${user != null}">
                <li class="nav-item
                <c:if test="${fn:contains(path,'/user')}">
                    active
                </c:if>">
                    <a class="nav-link" href="${ctx}/user/info"><c:out value="${user.lastName}"/><c:out value="${user.firstName}"/> <c:out value="${user.tel}"/></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link">|</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" id="logout">退出</a>
                </li>
            </c:if>

        </ul>
    </div>
</nav>

<script>
    $("#goToLogin").click(function () {
        var url = window.location.href;
        window.location.href = "${ctx}/login?redirect=" + encodeURIComponent(url);
    })

    $("#logout").click(function () {
        $.getWithCallback("${ctx}/logout", function (data) {
            alert("退出成功！");
            window.location.reload();
        });
    })
</script>