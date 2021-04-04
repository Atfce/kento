<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理后台 - 留言管理</title>
    <%@include file="../base.jsp" %>
</head>
<body>
<%@include file="header.jsp" %>
<div>
    <form style="margin-top: 50px">
        <div class="form-row">
            <form method="get">
                <div class="offset-3 form-group col-md-2">
                    <input type="text" class="form-control" id="content" name="content" placeholder="留言内容">
                </div>
                <div class="form-group col-md-1">
                    <select id="statusStr" class="form-control" name="statusStr">
                        <option value="all">全部</option>
                        <option value="0">未回复</option>
                        <option value="1">已回复</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-primary" id="query">查询</button>
                </div>
            </form>
        </div>
    </form>
</div>


<div class="offset-2 col-md-8">
    <table id="datatable" class="display" style="width:100%">
        <thead>
        <tr>
            <th>用户姓名</th>
            <th>手机号</th>
            <th>留言时间</th>
            <th>留言内容</th>
            <th>回复时间</th>
            <th>回复内容</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">回复留言</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>用户姓名</label>
                        <input type="text" autocomplete="off" class="form-control" name="travelerName" placeholder="用户姓名">
                    </div>
                    <div class="form-group">
                        <label>留言内容</label>
                        <textarea style="height: 300px" type="text" autocomplete="off" class="form-control" name="content" disabled></textarea>
                    </div>
                    <div class="form-group">
                        <label>回复内容</label>
                        <textarea style="height: 300px" type="text" autocomplete="off" class="form-control" name="reply" placeholder="请输入回复内容"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="replyBtn">回复</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="wholeModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">完整内容</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>

<script>
    var messageData = [];
    $(function () {
        var content = getQueryVariable("content") ? getQueryVariable("content") : "";
        var statusStr = getQueryVariable("statusStr") ? getQueryVariable("statusStr") : "all";

        $("#content").val(decodeURI(content));
        $("#statusStr").val(decodeURI(statusStr));
        var draw = 1;
        var dt = $("#datatable").dataTableWithDefault(
            {
                ordering: false,
                processing: true,
                serverSide: true,
                ajax: {
                    url: "${ctx}/backend/message/get_list?content=" + $("#content").val().trim() + "&statusStr=" + $("#statusStr").val().trim(),
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
                            messageData[json.data[i].id] = json.data[i];
                        }
                        return json.data;
                    }
                },
                columns: [
                    {
                        data: null, "render": function (data, type, row) {
                            return row.user.lastName + row.user.firstName;
                        }
                    },
                    {
                        data: "user.tel"
                    },
                    {
                        data: "createTime"
                    },
                    {
                        data: "content", "render": function (data, type, row) {
                            var cutString = cutStr(data, 20);
                            return '<a onclick="onWholeContent(\'' + row.id + '\')" style="color: blue; cursor:hand; text-decoration:underline">' + cutString + '</a>';
                        }
                    },
                    {
                        data: "replyTime"
                    },
                    {
                        data: "reply", "render": function (data, type, row) {
                            if (data == null) {
                                return '';
                            }
                            var cutString = cutStr(data, 20);
                            return '<a onclick="onWholeRely(\'' + row.id + '\')" style="color: blue; cursor:hand; text-decoration:underline">' + cutString + '</a>';
                        }
                    },
                    {
                        data: "status", "render": function (data, type, row) {
                            if (data == 0) {
                                return "未回复";
                            }
                            if (data == 1) {
                                return "已回复"
                            }
                            return "error";
                        }
                    },
                    {
                        data: null, "render": function (data, type, row) {
                            return '<a class="btn btn-primary btn-sm" onclick="onReply(\'' + row.id + '\')">回复</a>'
                        }
                    }
                ],
                initComplete: function () {
                    $('[data-toggle="popover"]').popover();
                }
            }
        );
    });

    function onReply(id) {
        var message = messageData[id];
        $("#replyModal [name='travelerName']").val(message.user.lastName + message.user.firstName);
        $("#replyModal [name='content']").val(message.content);

        $("#replyModal").modal("show");

        $("#replyBtn").unbind().click(function () {
            $.postWithDialog("${ctx}/backend/message/reply", {
                "id": id,
                "reply": $("#replyModal [name='reply']").val().trim()
            }, function (data) {
                alert("回复成功！");
                $("#replyModal").modal("hide");
                window.location.reload();
            });
        })
    }

    function onWholeContent(id) {
        var message = messageData[id];
        $("#wholeModal p").html(message.content);
        $("#wholeModal").modal("show");
    }

    function onWholeRely(id) {
        var message = messageData[id];
        $("#wholeModal p").html(message.reply);
        $("#wholeModal").modal("show");
    }
</script>
</body>
</html>
