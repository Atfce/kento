package com.liangjian.ticket.controller.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/backend/home")
@Controller
public class HomeController {
    @RequestMapping("")
    public String index() {
        return "/backend/home";
    }
}
