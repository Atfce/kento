function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == variable) {
            return pair[1];
        }
    }
    return (false);
}

function checkPhone(tel){
    if(!(/^1[3-9]\d{9}$/.test(tel))){
        alert("请输入正确的手机号");
        return false;
    }
    return true;
}

var HIDE_HANDLING_DIALOG_TIME = 1000;
$.getWithCallback = function (url, callback) {
    $.ajax({
        type: 'GET',
        url: url,
        success: GlobalCallbackWrapper(callback),
        error: GlobalAjaxErrorFunction
    });
}

$.postWithDialog = function (url, data, callback) {
    $.ajax({
               type: 'POST',
               url: url,
               data: data,
               dataType: "json",
               success: GlobalCallbackWrapper(callback),
               error: GlobalAjaxErrorFunction
           });
}

$.postJsonWithDialog = function (url, data, callback) {
    $.ajax({
        type: 'POST',
        url: url,
        data: data,
        contentType: "application/json",
        dataType: "json",
        success: GlobalCallbackWrapper(callback),
        error: GlobalAjaxErrorFunction
    });
}

function GlobalCallbackWrapper(callback) {
    return function (data) {
        setTimeout(function () {
            if (data.hasOwnProperty("code") && data.hasOwnProperty("msg") && data.hasOwnProperty("success")) {
                // 处理AjaxResult返回类型
                if (data.code == 0) {
                    callback(data);
                } else {
                    if (data.msg == null) {
                        alert("未知错误")
                    } else {
                        alert(data.msg)
                    }
                }
            } else {
                if ($.isFunction(callback)) {
                    callback(data);
                }
            }
        }, HIDE_HANDLING_DIALOG_TIME);
    }
}

function GlobalAjaxErrorFunction(jqXHR) {

    setTimeout(function () {
        switch (jqXHR.status) {
            case(500):
                alert("服务器错误！");
                break;
            case(401):
                alert("authentication failed!");
                break;
            case(403):
                alert("no permission!");
                break;
            case(404):
                alert("404 error!");
                break;
            case(408):
                alert("request timeout!");
                break;
            default:
                alert("unknown error!");
        }
    }, HIDE_HANDLING_DIALOG_TIME);
}

//设置datatable button的默认样式
// $.fn.dataTable.Buttons.defaults.dom.button.className = "btn btn-primary btn-sm";
// $.fn.dataTable.Buttons.defaults.dom.container.className = "dt-buttons";
$.fn.dataTableWithDefault = function (settings) {

    var defaultSettings = {
        'dom': '<"row"<"col-sm-6"><"col-sm-6">>' + '<"row"<"col-sm-12"tr>>' + '<"row"<"col-sm-5"l><"col-sm-7"p>>',
        'stateSave': true,
        "pageLength": 15,
        "lengthMenu": [[15, 25, 50], [15, 25, 50]],
        'language': {
            'emptyTable': 'No data',
            'lengthMenu': '_MENU_',
            'paginate': {
                'next': ' > ',
                'previous': ' < '
            }
        }
    };

    $.fn.dataTable.ext.errMode = 'none';
    this.on('error.dt', function (e, settings, techNote, message) {
        alert("获取数据失败！")
    });

    return this.dataTable($.extend(defaultSettings, settings));
};
