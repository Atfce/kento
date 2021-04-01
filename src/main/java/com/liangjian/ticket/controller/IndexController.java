package com.liangjian.ticket.controller;

import com.liangjian.ticket.service.UserService;
import com.liangjian.ticket.vo.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RequestMapping("index")
@Controller
public class IndexController {
    @Autowired
    private UserService userService;

    @RequestMapping("")
    public String index() {
        return "/front/index";
    }

    @GetMapping("login")
    public String loginJsp() {
        return "/front/login";
    }

    @PostMapping("login")
    @ResponseBody
    public Result login(@RequestParam(required = false) String tel, @RequestParam(required = false) String password,
            HttpSession session) {
        return userService.login(session, tel, password);
    }

    @RequestMapping("logout")
    @ResponseBody
    public Result logout(HttpSession session) {
        session.invalidate();
        return Result.ok();
    }
}
