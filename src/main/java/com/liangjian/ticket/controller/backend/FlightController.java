package com.liangjian.ticket.controller.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/backend/flight")
@Controller
public class FlightController {
    @RequestMapping("")
    public String index() {
        return "/backend/flight";
    }
}
