package com.liangjian.ticket.controller.backend;

import com.liangjian.ticket.vo.Const;
import com.liangjian.ticket.vo.Result;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RequestMapping("/backend/index")
@Controller
public class BackendIndexController {
    @GetMapping("")
    public String loginJsp() {
        return "/backend/login";
    }

    @GetMapping("403")
    public String to403() {
        return "/backend/403";
    }

    @PostMapping("login")
    @ResponseBody
    public Result login(@RequestParam String username, @RequestParam String password, HttpSession session) {
        if (!StringUtils.hasText(username)) {
            return Result.failed("请输入用户名！");
        }
        if (!StringUtils.hasText(password)) {
            return Result.failed("请输入密码！");
        }
        if ("admin".equals(username) && "123".equals(password)) {
            session.setAttribute(Const.BACKEND_USER, "admin");
            return Result.ok();
        } else {
            return Result.failed("账号或密码错误！请重试！");
        }
    }
}
