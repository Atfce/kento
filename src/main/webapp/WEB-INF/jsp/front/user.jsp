<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订票系统 - 个人中心</title>
    <%@include file="../base.jsp" %>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="../ticket_flight_detail.jsp" %>

<h5 class="mt-3" style="text-align: center">个人中心</h5>
<div class="row mt-5">
    <div class="offset-1 col-10 border-0">
        <div class="row border border-primary rounded-lg" style="background: #f6fafc">
            <div class="col-3" style="height: 800px">
                <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <a class="nav-link active mt-3" id="user-tab" data-toggle="pill" href="#v-pills-user" role="tab" aria-controls="v-pills-home" aria-selected="true">个人信息</a>
                    <a class="nav-link mt-3 disabled" data-toggle="pill" role="tab" aria-controls="v-pills-profile" aria-selected="false">订单信息</a>
                    <a class="nav-link mt-3 ml-3" id="finished-ticket-tab" data-toggle="pill" href="#v-pills-finished" role="tab" aria-controls="v-pills-profile" aria-selected="false">已完成订单</a>
                    <a class="nav-link mt-3 ml-3" id="ready-travel-ticket-tab" data-toggle="pill" href="#v-pills-ready-travel" role="tab" aria-controls="v-pills-profile" aria-selected="false">待出行订单</a>
                    <a class="nav-link mt-3 ml-3" id="ready-pay-ticket-tab" data-toggle="pill" href="#v-pills-ready-pay" role="tab" aria-controls="v-pills-profile" aria-selected="false">待支付订单</a>
                </div>
            </div>
            <div class="col-9">
                <div class="tab-content" id="v-pills-tabContent">
                    <div class="tab-pane fade show active mt-4" id="v-pills-user" role="tabpanel" aria-labelledby="finished-ticket-tab">
                        <div>
                            <div class="form-group">
                                <label>手机号码</label>
                                <input type="text" class="form-control" id="tel" value="${user.tel}" disabled>
                                <small class="form-text text-muted">手机号码作为登录号，不能修改</small>
                            </div>
                            <div class="form-group">
                                <label>姓氏</label>
                                <input type="text" class="form-control" id="lastName" value="${user.lastName}" placeholder="请输入您的中文姓">
                            </div>
                            <div class="form-group">
                                <label>名字</label>
                                <input type="text" class="form-control" id="firstName" value="${user.firstName}" placeholder="请输入您的中文名">
                            </div>
                            <div class="form-group">
                                <label>身份证号码</label>
                                <input type="text" class="form-control" id="idCard" value="${user.idCard}" placeholder="请输入您的身份证号码">
                            </div>
                            <div class="form-group">
                                <label>性别</label>
                                <select class="form-control" id="gender" value="${user.gender}">
                                    <option value="1">男</option>
                                    <option value="0">女</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>密码</label>
                                <input type="text" class="form-control" id="password" placeholder="留空则表示不修改密码">
                            </div>
                            <div style="text-align: center">
                                <button type="button" class="btn btn-primary" id="changeUserInfoBtn">
                                    修改
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade show mt-4" id="v-pills-finished" role="tabpanel" aria-labelledby="ready-travel-ticket-tab">
                        <table id="finishedTicketTable" class="display">
                            <thead>
                            <tr>
                                <th>订单id</th>
                                <th>创建时间</th>
                                <th>支付时间</th>
                                <th>起飞时间</th>
                                <th>航班</th>
                                <th>支付金额</th>
                                <th>姓名</th>
                                <th>手机号码</th>
                            </tr>
                            </thead>
                            <tbody>
                        </table>
                    </div>
                    <div class="tab-pane fade show" id="v-pills-ready-travel" role="tabpanel" aria-labelledby="user-tab">
                        <table id="readyTravelTicketTable" class="display">
                            <thead>
                            <tr>
                                <th>订单id</th>
                                <th>创建时间</th>
                                <th>支付时间</th>
                                <th>起飞时间</th>
                                <th>航班</th>
                                <th>支付金额</th>
                                <th>姓名</th>
                                <th>手机号码</th>
                            </tr>
                            </thead>
                            <tbody>
                        </table>
                    </div>
                    <div class="tab-pane fade show" id="v-pills-ready-pay" role="tabpanel" aria-labelledby="ready-pay-ticket-tab">
                        <table id="readyPayTicketTable" class="display">
                            <thead>
                            <tr>
                                <th>订单id</th>
                                <th>创建时间</th>
                                <th>起飞时间</th>
                                <th>航班</th>
                                <th>支付金额</th>
                                <th>姓名</th>
                                <th>手机号码</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var ticketData = [];
    $(function () {
        $("#changeUserInfoBtn").unbind().click(function () {
            $.postWithDialog("${ctx}/user/change_user_info", {
                "lastName": $("#lastName").val().trim(),
                "firstName": $("#firstName").val().trim(),
                "idCard": $("#idCard").val().trim(),
                "gender": $("#gender").val().trim(),
                "password": $("#password").val().trim(),
            }, function (data) {
                alert("修改成功");
                window.location.reload();
            })
        });

        var getTicketsUrl = "${ctx}/user/get_tickets";

        //已完成订单
        var drawFinished = 1;
        var dtFinished = null;
        dtFinished = $("#finishedTicketTable").dataTableWithDefault(
            {
                ordering: false,
                processing: true,
                serverSide: true,
                ajax: {
                    url: getTicketsUrl + "?status=2",
                    dataSrc: function (json) {
                        if (json.hasOwnProperty('code') && json.code == -1) {
                            alert(json.msg);
                            return [];
                        }
                        json.draw = drawFinished++;
                        json.recordsTotal = json.total;
                        json.recordsFiltered = json.total;
                        json.data = json.records;
                        for (let i = 0; i < json.data.length; i++) {
                            ticketData[json.data[i].id] = json.data[i];
                        }
                        return json.data;
                    },
                },
                columns: [
                    {data: "id"},
                    {data: "createTime"},
                    {data: "payTime"},
                    {data: "flight.scheduledDeparture"},
                    {
                        data: null, "render": function (data, type, row) {
                            return '<a class="btn btn-primary btn-sm" onclick="onDetail(\'' + row.id + '\')">查看详情</a>';
                        }
                    },
                    {data: "cost"},
                    {data: "travelerName"},
                    {data: "tel"}
                ]
            }
        );

        //待出行订单
        var drawReadyTravel = 1;
        var dtReadyTravel = null;
        dtReadyTravel = $("#readyTravelTicketTable").dataTableWithDefault(
            {
                ordering: false,
                processing: true,
                serverSide: true,
                ajax: {
                    url: getTicketsUrl + "?status=1",
                    dataSrc: function (json) {
                        if (json.hasOwnProperty('code') && json.code == -1) {
                            alert(json.msg);
                            return [];
                        }
                        json.draw = drawReadyTravel++;
                        json.recordsTotal = json.total;
                        json.recordsFiltered = json.total;
                        json.data = json.records;
                        for (let i = 0; i < json.data.length; i++) {
                            ticketData[json.data[i].id] = json.data[i];
                        }
                        return json.data;
                    },
                },
                columns: [
                    {data: "id"},
                    {data: "createTime"},
                    {data: "payTime"},
                    {data: "flight.scheduledDeparture"},
                    {
                        data: null, "render": function (data, type, row) {
                            return '<a class="btn btn-primary btn-sm" onclick="onDetail(\'' + row.id + '\')">查看详情</a>';
                        }
                    },
                    {data: "cost"},
                    {data: "travelerName"},
                    {data: "tel"}
                ]
            }
        );


        //待支付订单
        var drawReadyPay = 1;
        var dtReadyPay = null;
        dtReadyPay = $("#readyPayTicketTable").dataTableWithDefault(
            {
                ordering: false,
                processing: true,
                serverSide: true,
                ajax: {
                    url: getTicketsUrl + "?status=0",
                    dataSrc: function (json) {
                        if (json.hasOwnProperty('code') && json.code == -1) {
                            alert(json.msg);
                            return [];
                        }
                        json.draw = drawReadyPay++;
                        json.recordsTotal = json.total;
                        json.recordsFiltered = json.total;
                        json.data = json.records;
                        for (let i = 0; i < json.data.length; i++) {
                            ticketData[json.data[i].id] = json.data[i];
                        }
                        return json.data;
                    },
                },
                columns: [
                    {data: "id"},
                    {data: "createTime"},
                    {data: "flight.scheduledDeparture"},
                    {
                        data: null, "render": function (data, type, row) {
                            return '<a class="btn btn-primary btn-sm" onclick="onDetail(\'' + row.id + '\')">查看详情</a>';
                        }
                    },
                    {data: "cost"},
                    {data: "travelerName"},
                    {data: "tel"},
                    {
                        data: null, "render": function (data, type, row) {
                            return '<a class="btn btn-info btn-sm" onclick="onPay(\'' + row.id + '\')">去支付</a>';
                        }
                    },
                ]
            }
        );
    });

    function onPay(id) {
        window.open("${ctx}/booking/pay?ticketId=" + id);
    }
</script>

</body>
</html>
