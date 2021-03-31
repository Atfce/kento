<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订票系统 - 首页</title>
    <%@include file="../base.jsp" %>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-primary navbar-dark fixed-top">
    <a class="navbar-brand" href="#">订票系统</a>

    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">首页</a>
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
                <a class="nav-link" href="${ctx}/index/register">注册</a>
            </li>
            </c:if>
            <c:if test="${user != null}">
                <li class="nav-item">
                    <a class="nav-link" href="${ctx}/user/info"><c:out value="${user.tel}"/></a>
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
        window.location.href = "${ctx}/index/login?redirect=" + encodeURIComponent(url);
    })

    $("#logout").click(function () {
        $.ajax({
            url: "${ctx}/index/logout",
            type: "GET",
            success: function (data) {
                if (data.code == -1) {
                    alert(data.msg);
                } else {
                    alert("退出成功！");
                    window.location.reload();
                }
            },
            error: function (e) {
                alert("请求失败！")
            }
        })
    })
</script>
</body>
</html>
