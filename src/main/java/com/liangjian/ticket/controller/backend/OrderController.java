package com.liangjian.ticket.controller.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/backend/order")
@Controller
public class OrderController {
    @RequestMapping("")
    public String index() {
        return "/backend/order";
    }
}
