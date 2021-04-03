<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订票系统 - 支付</title>
    <%@include file="../base.jsp" %>
</head>
<body>
<%@include file="header.jsp" %>
<h4 class="mt-3" style="text-align: center">支付订单</h4>
<div class="row mt-2">
    <div class="offset-3 col-6">
        <ul class="list-group">
            <li class="list-group-item">
                订单编号：
                <span>${ticket.id}</span>
            </li>
            <li class="list-group-item">
                创建时间：
                <span>${ticket.createTime}</span>
            </li>
            <li class="list-group-item">
                起飞城市：
                <span>${ticket.flight.departureCity}</span>
            </li>
            <li class="list-group-item">
                起飞时间：
                <span>${ticket.flight.scheduledDeparture}</span>
            </li>
            <li class="list-group-item">
                到达城市：
                <span>${ticket.flight.arrivalCity}</span>
            </li>
            <li class="list-group-item">
                到达时间：
                <span>${ticket.flight.scheduledArrival}</span>
            </li>
            <li class="list-group-item">
                旅客姓名：
                <span>${ticket.travelerName}</span>
            </li>
            <li class="list-group-item">
                身份证号码：
                <span>${ticket.idCard}</span>
            </li>
            <li class="list-group-item">
                手机号码：
                <span>${ticket.tel}</span>
            </li>
        </ul>
    </div>
</div>

<div class="row mt-3">
    <div class="offset-3 col-2">
        <h5 id="left" style="color: red">您还剩15分钟支付订单</h5>
    </div>
    <div class="offset-1 col-3" style="text-align: right">
        <span style="color: green">一共${ticket.cost}元</span>
        <button type="button" class="btn btn-primary" id="payBtn">支付</button>
    </div>
</div>
<script>
    $(function () {
        var createTime = new Date("${ticket.createTime}");
        var cancelTime = new Date();
        cancelTime.setTime(createTime.getTime() + 1000 * 60 *15);

        window.setInterval(function() {
            var left = leftTime(cancelTime);
            $("#left").html("您还剩" + left + "支付订单")
        } , 1000);

        $("#payBtn").unbind().click(function () {
            $.postWithDialog("${ctx}/booking/pay", {
                "ticketId": "${ticket.id}"
            }, function (data) {
                alert("支付订单成功！");
                <%--window.location.href = "${ctx}/index";--%>
            })
        })
    })
</script>
</body>
</html>
