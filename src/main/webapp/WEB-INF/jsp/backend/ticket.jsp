<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理后台 - 订单管理</title>
    <%@include file="../base.jsp" %>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="../ticket_flight_detail.jsp" %>

<form style="margin-top: 50px">
    <div class="form-row">
        <form method="get">
            <div class="offset-2 form-group col-md-2">
                <input type="text" class="form-control" id="ticketId" name="ticketId" placeholder="请输入订单ID">
            </div>
            <div class="form-group col-md-2">
                <input type="text" class="form-control" id="tel" name="tel" placeholder="请输入游客手机号">
            </div>
            <div class="form-group col-md-2">
                <select class="form-control" name="statusStr" id="statusStr">
                    <option value="all">全部</option>
                    <option value="1">待出行</option>
                    <option value="2">已完成</option>
                    <option value="0">待支付</option>
                    <option value="-1">已取消</option>
                </select>
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-primary">查询</button>
            </div>
        </form>
    </div>
</form>

<!-- Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">编辑订单</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>订单id</label>
                        <input type="text" autocomplete="off" class="form-control" name="id" disabled>
                    </div>
                    <div class="form-group">
                        <label>创建时间</label>
                        <input type="text" autocomplete="off" class="form-control" name="createTime" disabled>
                    </div>
                    <div class="form-group">
                        <label>姓名</label>
                        <input type="text" autocomplete="off" class="form-control" name="travelerName" placeholder="请输入姓名">
                    </div>
                    <div class="form-group">
                        <label>手机号码</label>
                        <input type="text" autocomplete="off" class="form-control" name="tel" placeholder="请输入手机号码">
                    </div>
                    <div class="form-group">
                        <label>身份证号码</label>
                        <input type="text" autocomplete="off" class="form-control" name="idCard" placeholder="请输入身份证号码">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="change">确定修改</button>
            </div>
        </div>
    </div>
</div>

<div class="offset-2 col-md-8">
    <table id="datatable" class="display" style="width:100%">
        <thead>
        <tr>
            <th>订单id</th>
            <th>订单状态</th>
            <th>创建时间</th>
            <th>支付时间</th>
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

<script>
    var ticketData = [];

    $(function () {
        var ticketId = getQueryVariable("ticketId") ? getQueryVariable("ticketId") : "";
        var tel = getQueryVariable("tel") ? getQueryVariable("tel") : "";
        var statusStr = getQueryVariable("statusStr") ? getQueryVariable("statusStr") : "all";

        $("#ticketId").val(decodeURI(ticketId));
        $("#tel").val(decodeURI(tel));
        $("#statusStr").val(decodeURI(statusStr));

        var queryUrl = "${ctx}/backend/ticket/get_list?ticketId=" + ticketId
            + "&tel=" + tel + "&statusStr=" + statusStr;
        var draw = 1;
        var dt = $("#datatable").dataTableWithDefault(
            {
                ordering: false,
                processing: true,
                serverSide: true,
                ajax: {
                    url: queryUrl,
                    dataSrc: function (json) {
                        if (json.hasOwnProperty('code') && json.code == -1) {
                            alert(json.msg);
                            return [];
                        }
                        json.draw = draw++;
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
                    {
                        data: "status", "className": "ellipsis", "render": function (data) {
                            if (data == 0) {
                                return "待支付";
                            }
                            if (data == 1) {
                                return "待出行";
                            }
                            if (data == 2) {
                                return "已完成";
                            }
                            if (data == -1) {
                                return "已取消";
                            }
                            return  "error";
                        }
                    },
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
                    {data: "tel"},
                    {
                        data: null, "render": function (data, type, row) {
                            return '<a class="btn btn-info btn-sm" onclick="onEdit(\'' + row.id + '\')">编辑</a>';
                        }
                    },
                ]
            }
        );
    });

    function onEdit(id) {
        $("#editModal [name='id']").val(ticketData[id].id);
        $("#editModal [name='createTime']").val(ticketData[id].createTime);
        $("#editModal [name='travelerName']").val(ticketData[id].travelerName);
        $("#editModal [name='tel']").val(ticketData[id].tel);
        $("#editModal [name='idCard']").val(ticketData[id].idCard);
        $("#editModal").modal("show");

        $("#editModal #change").unbind().click(function () {
            $.postWithDialog("${ctx}/backend/ticket/edit_ticket", {
                "id": id,
                "createTime": $("#editModal [name='createTime']").val().trim(),
                "travelerName": $("#editModal [name='travelerName']").val().trim(),
                "tel": $("#editModal [name='tel']").val().trim(),
                "idCard": $("#editModal [name='idCard']").val().trim(),
            }, function () {
                alert("编辑订单成功！");
                window.location.reload();
            })
        });
    }
</script>
</body>
</html>
