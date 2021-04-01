<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订票系统 - 登录</title>
    <%@include file="../base.jsp" %>
    <style>
        .lg-header {
            width: 100%;
            max-width: 1024px;
            margin: 0 auto;
            min-height: 120px;
        }

        .middle-content {
            width: 100%;
            position: relative;
            overflow: hidden;
            /*margin-top: 150px;*/
        }

        .login-show {
            position: absolute;
            top: 0;
            left: 50%;
            width: 1920px;
            height: 100%;
            z-index: 0;
            margin-left: -960px;
        }

        .wrap {
            position: relative;
            margin: 0 auto;
            width: 100%;
            max-width: 960px;
            height: 660px;
            z-index: 200;
        }

        .login-box-page{
            position: absolute;
            right: 50px;
            top: 150px;
            width: 328px;
        }

        .login-box {
            right: 0;
            width: 328px;
            padding: 20px 25px;
            background: #FFF;
            font-size: 14px;
            border-radius: 25px;
        }

        .tab-title {
            overflow: hidden;
            margin: 0;
            padding: 0;
            list-style: none;
        }

        ul, li, ol {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .tab-title .current {
            border-bottom: #008AC9 3px solid;
            color: #008AC9;
            width: 100%;
            float: left;
            text-align: center;
            letter-spacing: 1px;
            height: 55px;
            line-height: 55px;
            border-bottom: #e4e4e4 1px solid;
            font-weight: bold;
            font-size: 20px;
            cursor: pointer;
        }

        .lg-tabcontent {
            padding: 20px 0;
            min-height: 200px;
        }

        .form-box {
            overflow: hidden;
            zoom: 1;
        }

        .unit {
            padding-bottom: 20px;
            text-align: left;
            overflow: hidden;
            position: relative;
        }

        .unit input {
            color: #a9a9a9;
            width: 275px;
            border: 1px solid #e4e4e4;
            padding: 0 20px;
            height: 40px;
            line-height: 40px;
            background-color: #FFF;
            display: block;
            float: left;
            font-size: 14px;
        }

        .form-box .btn {
            background: #008AC9;
            color: #FFF;
            line-height: 42px;
            height: 42px;
            text-align: center;
            border: none;
            cursor: pointer;
            font-size: 16px;
            padding: 0;
            width: 100%;
        }

        .footer {
            margin-top: 15px;
            background: #e3eef5;
            width: 100%;
            color: #666;
            font-size: 12px;
            height: 100px;
        }

        .w {
            overflow: hidden;
            line-height: 24px;
            color: #666;
            padding: 30px 0;
            width: 1024px;
            max-width: 1024px;
        }
    </style>
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
    </script>
</body>
</html>
