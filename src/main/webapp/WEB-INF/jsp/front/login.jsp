<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订票系统 - 登录</title>
    <%@include file="../base.jsp" %>
    <link href="${ctx}/static/css/login.css" rel="stylesheet" type="text/css">
</head>

<body>
    <div class="lg-header">
        <h1 style="margin-top: 50px">订票系统</h1>
    </div>

    <div class="middle-content">
        <div class="login-show">
            <img src="${ctx}/static/images/loginbg.jpg">
        </div>

        <div class="wrap">
            <div class="login-box-page">
                <div class="login-box">
                    <ul class="tab-title">
                        <li class="current">会员登录</li>
                    </ul>

                    <div class="lg-tabcontent">
                        <div class="form-box">
                            <div class="unit">
                                <input type="text" placeholder="手机号" id="tel">
                            </div>

                            <div class="unit">
                                <input type="password" placeholder="密码" id="password">
                            </div>
                            <button type="submit" class="btn" id="loginBtn">
                                登录
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <div class="w">
            <div style="text-align: center">
                Copyright(C)2021 毕设
            </div>
        </div>
    </div>

    <script>
        $("#loginBtn").click(function () {
            var tel = $("#tel").val().trim();
            if (tel === "") {
                alert("请输入手机号！");
                return;
            }
            var password = $("#password").val();
            if (password === "") {
                alert("请输入密码！");
                return;
            }

            $.postWithDialog("${ctx}/login", {
                "tel": tel,
                "password": password
            }, function (data) {
                var redirect = getQueryVariable("redirect");
                if (!redirect) {
                    window.location.href = "${ctx}/index";
                } else {
                    window.location.href = decodeURIComponent(redirect);
                }
            });
        })

        $("#tel").keypress(function(event){
            if(event.which === 13) {
                $("#loginBtn").click();
            }
        })

        $("#password").keypress(function(event){
            if(event.which === 13) {
                $("#loginBtn").click();
            }
        })

        $(".lg-header").click(function () {
            window.location.href = "${ctx}/index";
        })
    </script>
</body>
</html>
