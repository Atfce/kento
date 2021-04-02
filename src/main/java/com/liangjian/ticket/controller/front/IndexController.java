package com.liangjian.ticket.controller.front;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.liangjian.ticket.dto.UserDTO;
import com.liangjian.ticket.entity.Flight;
import com.liangjian.ticket.service.FlightService;
import com.liangjian.ticket.service.UserService;
import com.liangjian.ticket.vo.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RequestMapping("")
@Controller
public class IndexController {
    @Autowired
    private FlightService flightService;
    @Autowired
    private UserService userService;

    @RequestMapping("index")
    public String index() {
        return "/front/index";
    }

    @GetMapping("login")
    public String loginJsp() {
        return "/front/login";
    }

    @GetMapping("register")
    public String registerJsp() {
        return "/front/register";
    }

    @PostMapping("register")
    @ResponseBody
    public Result register(@RequestBody @Validated UserDTO userDTO, HttpSession session) {
        return userService.register(userDTO, session);
    }

    @PostMapping("login")
    @ResponseBody
    public Result login(@RequestParam(required = false) String tel, @RequestParam(required = false) String password,
                        HttpSession session) {
        return userService.login(session, tel, password);
    }

    @RequestMapping("logout")
    @ResponseBody
    public Result logout(HttpSession session) {
        session.invalidate();
        return Result.ok();
    }

    @GetMapping("get_flight_list")
    @ResponseBody
    public Page<Flight> getList(@RequestParam(defaultValue = "1") Integer start, @RequestParam(defaultValue = "15") Integer length,
                                @RequestParam(defaultValue = " ") String departureCity, @RequestParam(defaultValue = " ") String arrivalCity,
                                @RequestParam(defaultValue = " ") String scheduledTime) {
        if (" ".equals(departureCity) && " ".equals(arrivalCity) && " ".equals(scheduledTime)) {
            return new Page<>();
        }
        if (!StringUtils.hasText(departureCity)) {
            throw new RuntimeException("请输入出发城市");
        }
        if (!StringUtils.hasText(arrivalCity)) {
            throw new RuntimeException("请输入到达城市");
        }
        if (!StringUtils.hasText(scheduledTime)) {
            throw new RuntimeException("请输入出发时间");
        }
        return flightService.getFlightPage(start / length + 1, length, departureCity, arrivalCity, scheduledTime);
    }
}
