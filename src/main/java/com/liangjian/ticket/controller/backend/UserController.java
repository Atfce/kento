package com.liangjian.ticket.controller.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/backend/user")
@Controller
public class UserController {
    @RequestMapping("")
    public String index() {
        return "/backend/user";
    }

}
