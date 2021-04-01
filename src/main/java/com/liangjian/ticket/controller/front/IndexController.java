package com.liangjian.ticket.controller.front;

import com.liangjian.ticket.dto.UserDTO;
import com.liangjian.ticket.service.UserService;
import com.liangjian.ticket.vo.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RequestMapping("")
@Controller
public class IndexController {
    @Autowired
    private UserService userService;

    @RequestMapping("index")
    public String index() {
        return "/front/index";
    }

    @GetMapping("login")
    public String loginJsp() {
        return "/front/login";
    }

    @GetMapping("register")
    public String registerJsp() {
        return "/front/register";
    }

    @PostMapping("register")
    @ResponseBody
    public Result register(@RequestBody @Validated UserDTO userDTO, HttpSession session) {
        return userService.register(userDTO, session);
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
