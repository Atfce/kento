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
            <input autocomplete="off" type="text" class="form-control" id="scheduledDeparture" placeholder="请输入出发时间">
        </div>
        <div class="col-md-3">
            <button type="button" class="btn btn-primary">查询航班</button>
            <button type="button" class="btn btn-info" id="addFlight">添加航班</button>
            <button type="button" class="btn btn-danger">删除选中</button>
        </div>
    </div>
    </div>
</form>

<%--<div class="offset-2 col-md-8">--%>
<%--    <table id="example" class="display" style="width:100%">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>Name</th>--%>
<%--            <th>Position</th>--%>
<%--            <th>Office</th>--%>
<%--            <th>Age</th>--%>
<%--            <th>Start date</th>--%>
<%--            <th>Salary</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <tr>--%>
<%--            <td>Tiger Nixon</td>--%>
<%--            <td>System Architect</td>--%>
<%--            <td>Edinburgh</td>--%>
<%--            <td>61</td>--%>
<%--            <td>2011/04/25</td>--%>
<%--            <td>$320,800</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Garrett Winters</td>--%>
<%--            <td>Accountant</td>--%>
<%--            <td>Tokyo</td>--%>
<%--            <td>63</td>--%>
<%--            <td>2011/07/25</td>--%>
<%--            <td>$170,750</td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</div>--%>

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
                        <label>飞机型号</label>
                        <input type="text" autocomplete="off" class="form-control" name="aircraft" placeholder="请输入飞机型号">
                    </div>
                    <div class="form-group">
                        <label>座位数</label>
                        <input type="text" autocomplete="off" class="form-control" name="seatTotal" placeholder="请输入座位数量">
                    </div>
                    <div class="form-group">
                        <label>价格</label>
                        <input type="text" autocomplete="off" class="form-control" name="amount" placeholder="请输入价格">
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="addOneYear">
                        <label class="form-check-label" for="addOneYear">为接下来一年添加相同的航班</label>
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
    $(function () {
        $('#scheduledDeparture').datetimepicker({
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

        // $('#example').DataTable();

        $("#addFlight").unbind().click(function () {
            $("#addModal").modal("show")
        });

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
            };

            $.postJsonWithDialog("${ctx}/backend/flight/save", JSON.stringify(flight), function () {
                alert("操作成功！")
            })
        })
    });
</script>

</body>
</html>
