<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订票系统 - 后台登录</title>
    <%@include file="../base.jsp" %>
    <link href="${ctx}/static/css/backend/login.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
    <div class="ch-container" style="margin-top: 200px">
        <div class="row">
            <div class="col-md-12 center login-header">
                <h2>管理后台 - 登录</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-5 center well login-box">
                <div class="alert alert-info">请输入用户名和密码</div>
                <div class="form-horizontal">
                    <fieldset>
                        <div class="input-group input-group-lg">
                            <input type="text" class="form-control" id="username"
                                   placeholder="用户名">
                        </div>
                        <div class="clearfix"></div>
                        <br>
                        <div class="input-group input-group-lg">
                            <input type="password" class="form-control" id="password"
                                   placeholder="密码">
                        </div>
                        <div class="clearfix"></div>
                        <p class="center">
                            <button id="loginBtn" class="btn btn-primary">登录</button>
                        </p>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("#loginBtn").click(function () {
        var username = $("#username").val().trim();
        var password = $("#password").val().trim();
        $.postWithDialog("${ctx}/backend/index/login", {
            "username": username,
            "password": password
        }, function () {
            window.location.href = "${ctx}/backend/home"
        })
    })

    $("#username").keypress(function(event){
        if(event.which === 13) {
            $("#loginBtn").click();
        }
    })

    $("#password").keypress(function(event){
        if(event.which === 13) {
            $("#loginBtn").click();
        }
    })

</script>
</body>
</html>
