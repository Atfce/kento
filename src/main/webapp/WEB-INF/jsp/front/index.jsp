<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订票系统 - 首页</title>
    <%@include file="../base.jsp" %>
</head>
<body>
<%@include file="header.jsp" %>
<form style="margin-top: 50px">
    <div class="row">
        <form method="get">
            <div class="offset-2 form-group col-md-2">
                <input type="text" class="form-control" name="departureCity" id="departureCity" placeholder="请输入出发城市">
            </div>
            <div class="form-group col-md-2">
                <input type="text" class="form-control" name="arrivalCity" id="arrivalCity" placeholder="请输入到达城市">
            </div>
            <div class="form-group col-md-2">
                <input autocomplete="off" type="text" name="scheduledTime" class="form-control" id="scheduledTime" placeholder="请输入出发时间">
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-primary" id="queryFlight">查询</button>
            </div>
        </form>
    </div>
</form>

<div class="offset-1 col-md-9">
    <table id="datatable" class="display" style="width:100%">
        <thead>
        <tr>
            <th>航班编号</th>
            <th>起飞时间</th>
            <th>到达时间</th>
            <th>起飞城市</th>
            <th>到达城市</th>
            <th>价格</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
    </table>
</div>

<div class="modal fade bd-example-modal-lg" id="detailModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modalTitle">航班详细信息</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            航班编号：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="flightNoH5"></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            飞机型号：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="aircraftH5"></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            出发时间：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="scheduledDepartureH5"></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            到达时间：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="scheduledArrivalH5"></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            出发城市：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="departureCityH5"></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            到达城市：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="arrivalCityH5"></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            座位数：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="seatTotalH5"></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            剩余座位数：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="seatEmptyH5"></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            价格：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="amountH5"></h5>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
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
        var draw = 1;
        var dt = null;
        var departureCity = getQueryVariable("departureCity") ? getQueryVariable("departureCity") : "";
        var arrivalCity = getQueryVariable("arrivalCity") ? getQueryVariable("arrivalCity") : "";
        var scheduledTime = getQueryVariable("scheduledTime") ? getQueryVariable("scheduledTime") : "";

        var queryUrl = "${ctx}/get_flight_list?departureCity=" + departureCity
            + "&arrivalCity=" + arrivalCity
            + "&scheduledTime=" + scheduledTime;
        $("#departureCity").val(decodeURI(departureCity));
        $("#arrivalCity").val(decodeURI(arrivalCity));
        $("#scheduledTime").val(decodeURI(scheduledTime));

        dt = $("#datatable").dataTableWithDefault(
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
                            let flight = json.data[i];
                            flights[flight.id] = flight;
                        }
                        return json.data;
                    },
                },
                columns: [
                    {data: "flightNo"},
                    {data: "scheduledDeparture"},
                    {data: "scheduledArrival"},
                    {data: "departureCity"},
                    {data: "arrivalCity"},
                    {data: "amount"},
                    {data: null, "render": function (data, type, row) {
                            return '<a class="btn btn-primary btn-sm" onclick="onBuy(\'' + row.id + '\')">预订</a>' +
                                '<a class="btn btn-info btn-sm ml-2" onclick="onDetail(\'' + row.id + '\')">详细信息</a>';
                        }
                    }
                ]
            }
        );
    });

    function onBuy(id) {
        <c:if test="${user == null}">
            alert("您尚未登录！请先登录后再进行选购！");
            return;
        </c:if>
        window.location.href = "${ctx}/booking?flightId=" + id;
    }

    function onDetail(id) {
        $("#flightNoH5").html(flights[id].flightNo);
        $("#aircraftH5").html(flights[id].aircraft);
        $("#scheduledDepartureH5").html(flights[id].scheduledDeparture);
        $("#scheduledArrivalH5").html(flights[id].scheduledArrival);
        $("#departureCityH5").html(flights[id].departureCity);
        $("#arrivalCityH5").html(flights[id].arrivalCity);
        $("#seatTotalH5").html(flights[id].seatTotal);
        $("#seatEmptyH5").html(flights[id].seatEmpty);
        $("#amountH5").html(flights[id].amount);
        $("#detailModal").modal("show");
    }
</script>

</body>
</html>
