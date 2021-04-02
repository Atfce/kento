package com.liangjian.ticket.controller.backend;

import java.sql.Timestamp;
import java.util.Objects;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.liangjian.ticket.dto.FlightDTO;
import com.liangjian.ticket.entity.Flight;
import com.liangjian.ticket.service.FlightService;
import com.liangjian.ticket.utils.CommonUtil;
import com.liangjian.ticket.vo.Const;
import com.liangjian.ticket.vo.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

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
    public Result saveFlight(@RequestBody @Validated FlightDTO flightDTO) {
        flightService.saveFlight(flightDTO);
        return Result.ok();
    }

    @GetMapping("get_list")
    @ResponseBody
    public Page<Flight> getList(@RequestParam(defaultValue = "1") Integer start, @RequestParam(defaultValue = "15") Integer length,
                                @RequestParam(defaultValue = "") String departureCity, @RequestParam(defaultValue = "") String arrivalCity,
                                @RequestParam(defaultValue = "") String scheduledTime) {
        Timestamp scheduledDeparture = null;
        Timestamp scheduledDepartureEnd = null;
        if (StringUtils.hasText(scheduledTime)) {
            scheduledTime += " 00:00:00";
            scheduledDeparture = CommonUtil.formatTimestamp(scheduledTime);
            assert scheduledDeparture != null;
            scheduledDepartureEnd = new Timestamp(scheduledDeparture.getTime() + 86400000);
        }
        return flightService.getFlightPage(start / length + 1, length, departureCity, arrivalCity, scheduledDeparture, scheduledDepartureEnd);
    }

    @PostMapping("delete")
    @ResponseBody
    public Result deleteFlight(@RequestParam(defaultValue = "") Integer id) {
        if (Objects.isNull(id)) {
            return Result.failed("无效的ID，请重试！");
        }
        flightService.removeById(id);
        return Result.ok();
    }
}
