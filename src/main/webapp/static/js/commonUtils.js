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
