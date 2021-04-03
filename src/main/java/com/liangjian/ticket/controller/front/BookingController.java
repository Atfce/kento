package com.liangjian.ticket.controller.front;

import com.liangjian.ticket.entity.Flight;
import com.liangjian.ticket.service.FlightService;
import com.liangjian.ticket.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Objects;

@RequestMapping("booking")
@Controller
public class BookingController {
    @Autowired
    private FlightService flightService;

    @GetMapping("")
    public String bookingJsp() {
        return "/front/booking";
    }

    @GetMapping("get_flight")
    @ResponseBody
    public Result getFlightData(@RequestParam Integer flightId) {
        Flight flight = flightService.getById(flightId);
        if (Objects.isNull(flight)) {
            return Result.failed("找不到该航班！请重试！");
        } else {
            return Result.ok(flight);
        }
    }
}
