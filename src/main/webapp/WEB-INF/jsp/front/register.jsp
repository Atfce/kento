<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订票系统 - 注册</title>
    <%@include file="../base.jsp" %>
    <link href="${ctx}/static/css/front/register.css" rel="stylesheet" type="text/css">
</head>

<body>
<%@include file="header.jsp" %>
<div class="main-content">
    <div class="layout-content">
        <div class="full-layout-content">
            <div class="cnRegister-content">
                <h1 class="cnRegister-titleP">
                    注册
                </h1>

                <div class="adultAdmission-content">
                    <div class="adultAdmission-titleBox">
                        <p class="adultAdmission-titleBox-titleP">
                            温馨提示
                        </p>
                        <ol>
                            <li>
                                如使用外国人永久居留身份证/港澳台居民居住证件，请选择“其他”证件进行入会。
                            </li>
                            <li>
                                填写姓、名需与所持证件顺序保持一致，否则将影响乘机和积分入账。
                            </li>
                            <li>
                                如用身份证注册，请登录增加护照以免国际航班里程累积失败
                            </li>
                        </ol>
                    </div>

                    <div class="adultAdmission-personal-content">
                        <p class="adultAdmission-personal-title">
                            <b></b>
                            个人信息
                        </p>

                        <div class="adultAdmission-personal-inputDiv">
                            <div class="adultAdmission-personal-leftDiv">
                                <label class="adultAdmission-personal-label">
                                    <span>中文姓</span>
                                    <span style="color: red">*</span>
                                </label>
                                <div class="xo-input-container">
                                    <input class="form-control"
                                           type="text" id="lastName" placeholder="生僻字可用拼音代替">
                                </div>
                            </div>

                            <div class="adultAdmission-personal-rightDiv">
                                <label class="adultAdmission-personal-label">
                                    <span>中文名</span>
                                    <span style="color: red">*</span>
                                </label>
                                <div class="xo-input-container">
                                    <input class="form-control"
                                           type="text" id="firstName" placeholder="生僻字可用拼音代替">
                                </div>
                            </div>
                        </div>

                        <div class="adultAdmission-personal-inputDiv">
                            <div class="adultAdmission-personal-leftDiv">
                                <label class="adultAdmission-personal-label">
                                    <span>身份证号码</span>
                                    <span style="color: red">*</span>
                                </label>
                                <div class="xo-input-container">
                                    <input class="form-control"
                                           type="text" id="idCard" placeholder="请输入身份证号码">
                                </div>
                            </div>

                            <div class="adultAdmission-personal-rightDiv">
                                <label class="adultAdmission-personal-label">
                                    <span>性别</span>
                                    <span style="color: red">*</span>
                                </label>
                                <div class="xo-input-container">
                                    <select class="form-control" id="gender">
                                        <option value="1">男</option>
                                        <option value="0">女</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="adultAdmission-personal-content">
                        <p class="adultAdmission-personal-title">
                            <b></b>
                            联系方式
                        </p>

                        <div class="adultAdmission-personal-inputDiv">
                            <div class="adultAdmission-personal-leftDiv">
                                <label class="adultAdmission-personal-label">
                                    <span>手机号码</span>
                                    <span style="color: red">*</span>
                                </label>
                                <div class="xo-input-container">
                                    <input class="form-control"
                                           type="text" id="tel" placeholder="中国(86)">
                                </div>
                            </div>

                            <div class="adultAdmission-personal-rightDiv">
                                <label class="adultAdmission-personal-label">
                                    <span>登录密码</span>
                                    <span style="color: red">*</span>
                                </label>
                                <div class="xo-input-container">
                                    <input class="form-control"
                                           type="text" id="password" placeholder="请输入密码">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="adultAdmission-safe-content">
                        <p class="adultAdmission-safe-title">
                            <b></b>
                            安全验证
                        </p>
                        <div>
                            <div class="adultAdmission-safe-label">
                                <span>验证码</span>
                                <span style="color: red">*</span>
                            </div>

                            <div class="adultAdmission-safe-detailDiv">
                                <div class="adultAdmission-safe-leftDiv">
                                    <div class="xo-input-container">
                                        <input class="form-control" id="validCode"
                                               placeholder="请输入验证码">

                                    </div>
                                </div>
                                <div>
                                    <div>
                                        <button class="btn btn-primary" id="getValidCodeBtn">
                                            获取验证码
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="adultAdmission-saveBtn-content" style="text-align: center">
                        <button class="btn btn-primary" id="register">
                            注册
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $("#getValidCodeBtn").click(function () {
        var tel = $("#tel").val().trim();
        if (!checkPhone(tel)) {
            return;
        }
        $.postWithDialog("${ctx}/common/send_tel_code", {
            "tel": tel
        }, function (data) {
            alert("验证码发送成功！验证码是" + data.telCode + "(测试用)")
            var that = $("#getValidCodeBtn");
            var timeo = 60;
            var timeStop = setInterval(function () {
                timeo--;
                if (timeo > 0) {
                    that.text('重新发送' + timeo + 's');
                    that.attr('disabled', 'disabled');//禁止点击
                } else {
                    timeo = 60;//当减到0时赋值为60
                    that.text('获取验证码');
                    clearInterval(timeStop);//清除定时器
                    that.removeAttr('disabled');//移除属性，可点击
                }
            }, 1000);
        });
    })

    $("#register").click(function () {
        var user = {
            "lastName": $("#lastName").val().trim(),
            "firstName": $("#firstName").val().trim(),
            "idCard": $("#idCard").val().trim(),
            "gender": $("#gender").val(),
            "tel": $("#tel").val().trim(),
            "password": $("#password").val().trim(),
            "validCode": $("#validCode").val().trim()
        };
        $.postJsonWithDialog("${ctx}/register", JSON.stringify(user), function (data) {
            alert("注册成功！快去登录吧！");
            window.location.href = "${ctx}/login";
        })


    })
</script>
</body>
</html>