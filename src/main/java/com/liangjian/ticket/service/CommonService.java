package com.liangjian.ticket.service;

import javax.servlet.http.HttpSession;

import com.liangjian.ticket.utils.CommonUtil;
import com.liangjian.ticket.vo.Const;

import org.springframework.stereotype.Service;

@Service
public class CommonService {
    public boolean sendTelCode(HttpSession session, String tel) {
        String code = CommonUtil.getRandom(6);
        //这里可以接入一些短信云服务发送验证码


        System.out.println("手机号：" + tel + "；验证码：" + code);
        session.setAttribute(Const.TEL_CODE_KEY + tel, code);
        //验证码有效时间5分钟
        session.setAttribute(Const.TEL_EXPIRE_CODE__KEY + tel, System.currentTimeMillis() / 1000L + 300);
        return true;
    }
}
