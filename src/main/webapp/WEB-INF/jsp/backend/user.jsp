<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理后台 - 用户管理</title>
    <%@include file="../base.jsp" %>
</head>
<body>
<%@include file="header.jsp" %>
<form style="margin-top: 50px">
    <div class="form-row">
        <form method="get">
            <div class="offset-2 form-group col-md-2">
                <input type="text" class="form-control" id="tel" name="tel" placeholder="请填写手机号码">
            </div>
            <div class="form-group col-md-1">
                <input type="text" class="form-control" id="lastName" name="lastName" placeholder="请填写姓氏">
            </div>
            <div class="form-group col-md-1">
                <input type="text" class="form-control" id="firstName" name="firstName" placeholder="请填写名字">
            </div>
            <div class="form-group col-md-2">
                <input type="text" class="form-control" id="idCard" name="idCard" placeholder="请填写身份证号码">
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-primary">查询</button>
            </div>
        </form>
    </div>
</form>

<div class="offset-2 col-md-8">
    <table id="datatable" class="display" style="width:100%">
        <thead>
        <tr>
            <th>手机号码</th>
            <th>姓氏</th>
            <th>名字</th>
            <th>身份证号</th>
            <th>性别</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">修改用户信息</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>手机号码</label>
                        <input type="text" autocomplete="off" class="form-control" name="tel" placeholder="请输入手机号码" disabled>
                        <small class="form-text text-muted">手机号码作为登录号，不能修改</small>
                    </div>
                    <div class="form-group">
                        <label>姓氏</label>
                        <input type="text" autocomplete="off" class="form-control" name="lastName" placeholder="请输入姓氏">
                    </div>
                    <div class="form-group">
                        <label>名字</label>
                        <input type="text" autocomplete="off" class="form-control" name="firstName" placeholder="请输入名字">
                    </div>
                    <div class="form-group">
                        <label>身份证号码</label>
                        <input type="text" autocomplete="off" class="form-control" name="idCard" placeholder="请输入身份证号码">
                    </div>
                    <div class="form-group">
                        <label>性别</label>
                        <select class="form-control" name="gender">
                            <option value="1">男</option>
                            <option value="0">女</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input type="text" autocomplete="off" class="form-control" name="password" placeholder="留空则表示不修改密码">
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

<script>
    var userData = [];

    $(function () {
        var tel = getQueryVariable("tel") ? getQueryVariable("tel") : "";
        var lastName = getQueryVariable("lastName") ? getQueryVariable("lastName") : "";
        var firstName = getQueryVariable("firstName") ? getQueryVariable("firstName") : "";
        var idCard = getQueryVariable("idCard") ? getQueryVariable("idCard") : "";

        $("#tel").val(decodeURI(tel));
        $("#lastName").val(decodeURI(lastName));
        $("#firstName").val(decodeURI(firstName));
        $("#idCard").val(decodeURI(idCard));

        var queryUrl = "${ctx}/backend/user/query?tel=" + tel
            + "&lastName=" + lastName + "&firstName=" + firstName
            + "&idCard=" + idCard;
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
                            userData[json.data[i].id] = json.data[i];
                        }
                        return json.data;
                    },
                },
                columns: [
                    {data: "tel"},
                    {data: "lastName"},
                    {data: "firstName"},
                    {data: "idCard"},
                    {
                        data: "gender", "render": function (data, type, row) {
                            if (data == 0) {
                                return "女";
                            }
                            if (data == 1) {
                                return "男";
                            }
                            return "error";
                        }
                    },
                    {
                        data: null, "render": function (data, type, row) {
                            return '<a class="btn btn-info btn-sm" onclick="onEdit(\'' + row.id + '\')">编辑</a>' +
                                '<a class="btn btn-danger btn-sm ml-3" onclick="onDelete(\'' + row.id + '\')">删除</a>';
                        }
                    }
                ]
            }
        );
    });

    function onEdit(id) {
        $("#editModal [name='tel']").val(userData[id].tel);
        $("#editModal [name='lastName']").val(userData[id].lastName);
        $("#editModal [name='firstName']").val(userData[id].firstName);
        $("#editModal [name='idCard']").val(userData[id].idCard);
        $("#editModal [name='gender']").val(userData[id].gender);
        $("#editModal").modal("show");

        $("#editModal #change").unbind().click(function () {
            $.postWithDialog("${ctx}/backend/user/update", {
                "userId": id,
                "lastName": $("#editModal [name='lastName']").val().trim(),
                "firstName": $("#editModal [name='firstName']").val().trim(),
                "idCard": $("#editModal [name='idCard']").val().trim(),
                "gender": $("#editModal [name='gender']").val().trim(),
                "password": $("#editModal [name='password']").val().trim(),
            }, function () {
                alert("修改用户信息成功！");
                window.location.reload();
            })
        });
    }

    function onDelete(id) {
        if (!confirm("确认删除该用户？")) {
            return;
        }
        $.postWithDialog("${ctx}/backend/user/delete", {
            "id": id
        }, function (data) {
            alert("删除用户成功！");
            window.location.reload();
        })
    }

</script>
</body>
</html>
