package com.liangjian.ticket.controller.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/backend/ticket")
@Controller
public class TicketController {
    @RequestMapping("")
    public String index() {
        return "/backend/ticket";
    }
}
