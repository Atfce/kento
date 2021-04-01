package com.liangjian.ticket.controller.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/backend/message")
@Controller
public class MessageController {
    @RequestMapping("")
    public String index() {
        return "/backend/message";
    }
}
