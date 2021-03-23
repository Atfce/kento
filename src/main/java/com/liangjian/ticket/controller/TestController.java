package com.liangjian.ticket.controller;

import com.liangjian.ticket.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/test")
@Controller
public class TestController {
    @Autowired
    private UserService userService;

    @RequestMapping("")
    public String test(Model model, @RequestParam(defaultValue = "1") Integer current, @RequestParam(defaultValue = "10") Integer size) {
        model.addAttribute("data", userService.getUsers(current, size));
        return "/test/test";
    }
}
