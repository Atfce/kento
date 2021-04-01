package com.liangjian.ticket.controller.front;

import javax.servlet.http.HttpSession;

import com.liangjian.ticket.service.CommonService;
import com.liangjian.ticket.utils.CommonUtil;
import com.liangjian.ticket.vo.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("common")
public class CommonController {
    @Autowired
    private CommonService commonService;

    @PostMapping("send_tel_code")
    public Result sendTelCode(HttpSession session, @RequestParam(required = false) String tel) {
        if (!CommonUtil.validateTel(tel)) {
            return Result.failed("请输入正确的手机号");
        }
        if (commonService.sendTelCode(session, tel)) {
            return Result.ok();
        } else {
            return Result.failed("未知错误！发送短信验证码失败！请稍后再试！");
        }
    }
}
