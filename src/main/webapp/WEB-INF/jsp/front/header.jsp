<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-primary navbar-dark fixed-top">
    <a class="navbar-brand" href="${ctx}/index">订票系统</a>

    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${ctx}/index">首页</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">首页</a>
            </li>
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
                <li class="nav-item">
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