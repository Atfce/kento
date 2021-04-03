<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订票系统 - 预订</title>
    <%@include file="../base.jsp" %>
</head>
<body>
<%@include file="header.jsp" %>
<h5 class="mt-3" style="text-align: center">创建订单</h5>
<div class="row mt-4">
    <div class="offset-3 col-md-6">
        <div class="card" style="width: 100%">
            <div class="card-header">
                航班信息
            </div>
            <ul class="list-group list-group-flush" id="flightDisplay">
                <li class="list-group-item"></li>
                <li class="list-group-item"></li>
                <li class="list-group-item"></li>
            </ul>
        </div>
    </div>

    <div class="offset-3 col-md-6 mt-5">

        <div class="form-group">
            <label>旅客姓名</label>
            <input type="text" class="form-control" id="name" value="${user.lastName}${user.firstName}" disabled>
            <small class="form-text text-muted">只能添加您一个人，要修改只能联系客服修改</small>
        </div>
        <div class="form-group">
            <label>身份证号码</label>
            <input type="text" class="form-control" id="idCard" value="${user.idCard}" disabled>
            <small class="form-text text-muted">只能添加您一个人，要修改只能联系客服修改</small>
        </div>
        <div class="form-group">
            <label>手机号码</label>
            <input type="text" class="form-control" id="tel" value="${user.tel}">
            <small class="form-text text-muted">用于接收航班信息、管理订单</small>
        </div>
    </div>

    <div class="offset-8 mt-3">
        <button type="button" class="btn btn-primary" id="submit">提交订单</button>
    </div>
</div>

<script>
    $(function () {
        var flightId = getQueryVariable("flightId");
        if (!flightId) {
            alert("请先选择航班！");
        } else {
            $.getWithCallback("${ctx}/booking/get_flight?flightId=" + flightId, function (data) {
                var flight = data.data;
                $("#flightDisplay").each(function () {
                    $(this).children("li").eq(0).html(flight.scheduledDeparture + " -> " + flight.scheduledArrival);
                    $(this).children("li").eq(1).html(flight.departureCity + " -> " + flight.arrivalCity);
                    $(this).children("li").eq(2).html("余座：" + flight.seatEmpty + "/" + flight.seatTotal + " <span style='color: red'>(空姐将会在现场随机为您安排座位)</span>");
                })
            })
        }

        $("#submit").unbind().click(function () {
            var ticket = {
                "flightId": flightId,
                "travelerName": $("#name").val(),
                "idCard": $("#idCard").val().trim(),
                "tel": $("#tel").val().trim()
            };
            $.postJsonWithDialog("${ctx}/booking/submit_ticket", JSON.stringify(ticket), function (data) {
                window.location.href = "${ctx}/booking/pay?ticketId=" + data.ticketId;
            })
        })
    })
</script>
</body>
</html>
