package com.liangjian.ticket.controller.backend;

import java.util.Objects;

import com.liangjian.ticket.entity.Flight;
import com.liangjian.ticket.service.FlightService;
import com.liangjian.ticket.vo.Const;
import com.liangjian.ticket.vo.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/backend/flight")
@Controller
public class FlightController {
    @Autowired
    private FlightService flightService;
    @RequestMapping("")
    public String index() {
        return "/backend/flight";
    }

    @PostMapping("save")
    @ResponseBody
    public Result saveFlight(@RequestBody Flight flight) {
        if (Objects.isNull(flight.getStatus())) {
            flight.setStatus(Const.FLIGHT_STATUS_ONSALE);
        }
        flightService.saveOrUpdate(flight);
        return Result.ok();
    }
}
