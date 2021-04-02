<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理后台 - 航班管理</title>
    <%@include file="../base.jsp" %>
</head>
<body>
<%@include file="header.jsp" %>

<form style="margin-top: 50px">
    <div class="form-row">
        <div class="offset-2 form-group col-md-2">
            <input type="text" class="form-control" id="departureCity" placeholder="请输入出发城市">
        </div>
        <div class="form-group col-md-2">
            <input type="text" class="form-control" id="arrivalCity" placeholder="请输入到达城市">
        </div>
        <div class="form-group col-md-2">
            <input autocomplete="off" type="text" class="form-control" id="scheduledTime" placeholder="请输入出发时间">
        </div>
        <div class="col-md-3">
            <button type="button" class="btn btn-primary" id="queryFlight">查询航班</button>
            <button type="button" class="btn btn-info" id="addFlight">添加航班</button>
        </div>
    </div>
    </div>
</form>

<div class="offset-2 col-md-8">
    <table id="datatable" class="display" style="width:100%">
        <thead>
        <tr>
            <th>航班编号</th>
            <th>飞机型号</th>
            <th>起飞时间</th>
            <th>到达时间</th>
            <th>起飞城市</th>
            <th>到达城市</th>
            <th>航班状态</th>
            <th>座位数</th>
            <th>剩余座位数</th>
            <th>价格</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">添加航班</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>航班编号</label>
                        <input type="text" autocomplete="off" class="form-control" name="flightNo" placeholder="请输入航班编号">
                    </div>
                    <div class="form-group">
                        <label>飞机型号</label>
                        <input type="text" autocomplete="off" class="form-control" name="aircraft" placeholder="请输入飞机型号">
                    </div>
                    <div class="form-group">
                        <label>出发时间</label>
                        <input type="text" autocomplete="off" class="form-control" name="scheduledDeparture" placeholder="请输入出发时间">
                    </div>
                    <div class="form-group">
                        <label>到达时间</label>
                        <input type="text" autocomplete="off" class="form-control" name="scheduledArrival" placeholder="请输入到达时间时间">
                    </div>
                    <div class="form-group">
                        <label>出发城市</label>
                        <input type="text" autocomplete="off" class="form-control" name="departureCity" placeholder="请输入到达出发城市">
                    </div>
                    <div class="form-group">
                        <label>到达城市</label>
                        <input type="text" autocomplete="off" class="form-control" name="arrivalCity" placeholder="请输入到达城市">
                    </div>
                    <div class="form-group">
                        <label>座位数</label>
                        <input type="text" autocomplete="off" class="form-control" name="seatTotal" placeholder="请输入座位数量">
                    </div>
                    <div class="form-group">
                        <label>价格</label>
                        <input type="text" autocomplete="off" class="form-control" name="amount" placeholder="请输入价格">
                    </div>
                    <div class="form-check" id="add30DaysDiv">
                        <input type="checkbox" class="form-check-input" id="add30Days">
                        <label class="form-check-label" for="add30Days">为接下来30天添加相同的航班</label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="add">确定添加</button>
            </div>
        </div>
    </div>
</div>

<script>
    var flights = [];
    $(function () {
        $('#scheduledTime').datetimepicker({
            format: "yyyy-mm-dd",
            todayBtn: 1,
            todayHighlight: 1,
            autoclose: 1,
            minView: 2
         });
        $("[name='scheduledDeparture']").datetimepicker({
            format: "yyyy-mm-dd hh:ii:00",
            todayBtn: 1,
            todayHighlight: 1,
            autoclose: 1
         });
        $("[name='scheduledArrival']").datetimepicker({
            format: "yyyy-mm-dd hh:ii:00",
            todayBtn: 1,
            todayHighlight: 1,
            autoclose: 1
        });

        $("#addFlight").unbind().click(function () {
            $("#add30DaysDiv").css("display", "block");
            $("#addModal").modal("show");

            $("#addModal #add").unbind().click(function () {
                var flight = {
                    "flightNo": $("#addModal [name='flightNo']").val().trim(),
                    "scheduledDeparture": $("#addModal [name='scheduledDeparture']").val().trim(),
                    "scheduledArrival": $("#addModal [name='scheduledArrival']").val().trim(),
                    "departureCity": $("#addModal [name='departureCity']").val().trim(),
                    "arrivalCity": $("#addModal [name='arrivalCity']").val().trim(),
                    "aircraft": $("#addModal [name='aircraft']").val().trim(),
                    "seatTotal": $("#addModal [name='seatTotal']").val().trim(),
                    "amount": $("#addModal [name='amount']").val().trim(),
                    "add30Days": $("#add30Days").is(':checked')
                };

                $.postJsonWithDialog("${ctx}/backend/flight/save", JSON.stringify(flight), function () {
                    alert("添加航班成功！");
                    window.location.reload();
                })
            });
        });

        var draw = 1;
        var dt = $("#datatable").dataTableWithDefault(
            {
                ordering: false,
                processing: true,
                serverSide: true,
                ajax: {
                    url: "${ctx}/backend/flight/get_list",
                    dataSrc: function (json) {
                        json.draw = draw++;
                        json.recordsTotal = json.total;
                        json.recordsFiltered = json.total;
                        json.data = json.records;
                        for (let i = 0; i < json.data.length; i++) {
                            let flight = json.data[i];
                            flights[flight.id] = flight;
                        }
                        return json.data;
                    },
                },
                columns: [
                    {data: "flightNo"},
                    {data: "aircraft"},
                    {data: "scheduledDeparture"},
                    {data: "scheduledArrival"},
                    {data: "departureCity"},
                    {data: "arrivalCity"},
                    {data: "status"},
                    {data: "seatTotal"},
                    {data: "seatEmpty"},
                    {data: "amount"},
                    {data: null, "render": function (data, type, row) {
                            return '<a class="btn btn-primary btn-sm" onclick="onEdit(\'' + row.id + '\')">编辑</a>' +
                                '<a class="btn btn-danger btn-sm ml-2" onclick="onDelete(\'' + row.id + '\')">删除</a>';
                        }
                    }
                ]
            }
        );

        $("#queryFlight").click(function () {
            var url = "${ctx}/backend/flight/get_list?departureCity=" + $("#departureCity").val().trim()
                + "&arrivalCity=" + $("#arrivalCity").val().trim()
                + "&scheduledTime=" + $("#scheduledTime").val().trim();
            dt.api().ajax.url(url).load();
        });
    });

    function onDelete(id) {
        if (!confirm("确认删除该航班？")) {
            return;
        }
        $.postWithDialog("${ctx}/backend/flight/delete", {
            "id": id
        }, function () {
            alert("删除成功！");
            window.location.reload();
        })
    }

    function onEdit(id) {
        $("#add30DaysDiv").css("display", "none");
        $("#addModal [name='flightNo']").val(flights[id].flightNo);
        $("#addModal [name='scheduledDeparture']").val(flights[id].scheduledDeparture);
        $("#addModal [name='scheduledArrival']").val(flights[id].scheduledArrival);
        $("#addModal [name='departureCity']").val(flights[id].departureCity);
        $("#addModal [name='arrivalCity']").val(flights[id].arrivalCity);
        $("#addModal [name='aircraft']").val(flights[id].aircraft);
        $("#addModal [name='seatTotal']").val(flights[id].seatTotal);
        $("#addModal [name='amount']").val(flights[id].amount);
        $("#addModal").modal("show");

        $("#addModal #add").unbind().click(function () {
            var flight = {
                "id": id,
                "flightNo": $("#addModal [name='flightNo']").val().trim(),
                "scheduledDeparture": $("#addModal [name='scheduledDeparture']").val().trim(),
                "scheduledArrival": $("#addModal [name='scheduledArrival']").val().trim(),
                "departureCity": $("#addModal [name='departureCity']").val().trim(),
                "arrivalCity": $("#addModal [name='arrivalCity']").val().trim(),
                "aircraft": $("#addModal [name='aircraft']").val().trim(),
                "seatTotal": $("#addModal [name='seatTotal']").val().trim(),
                "amount": $("#addModal [name='amount']").val().trim(),
                "status": flights[id].status,
                "seatEmpty": flights[id].seatEmpty,
            };

            $.postJsonWithDialog("${ctx}/backend/flight/save", JSON.stringify(flight), function () {
                alert("更新航班成功！");
                window.location.reload();
            })
        });
    }
</script>

</body>
</html>
