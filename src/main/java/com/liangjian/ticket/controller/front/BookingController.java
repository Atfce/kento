package com.liangjian.ticket.controller.front;

import com.liangjian.ticket.dto.TicketDTO;
import com.liangjian.ticket.entity.Flight;
import com.liangjian.ticket.entity.Ticket;
import com.liangjian.ticket.entity.User;
import com.liangjian.ticket.service.FlightService;
import com.liangjian.ticket.service.TicketService;
import com.liangjian.ticket.service.UserService;
import com.liangjian.ticket.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Objects;

@RequestMapping("booking")
@Controller
public class BookingController {
    @Autowired
    private FlightService flightService;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private HttpSession session;

    @GetMapping("")
    public String bookingJsp() {
        return "/front/booking";
    }

    @GetMapping("pay")
    public ModelAndView payJsp(@RequestParam String ticketId) {
        ModelAndView modelAndView = new ModelAndView("/front/pay");
        Ticket ticket = ticketService.getTicketWithFlight(ticketId);
        modelAndView.addObject("ticket", ticket);
        return modelAndView;
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

    @PostMapping("submit_ticket")
    @ResponseBody
    public Result submitTicket(@RequestBody @Validated TicketDTO ticketDTO, HttpSession session) {
        Integer flightId = ticketDTO.getFlightId();
        Flight flight = flightService.getById(flightId);
        if (Objects.isNull(flight)) {
            return Result.failed("找不到该航班信息！请返回航班查询页面重试！");
        }
        if (flight.getSeatEmpty() < 1) {
            return Result.failed("抱歉，该航班已无空座！请预订其它航班！");
        }
        User user = (User) session.getAttribute("user");
        if (Objects.isNull(user)) {
            return Result.failed("清先登录！");
        }

        String ticketId = ticketService.submitTicket(ticketDTO, flight, user);
        flightService.decrease(flightId, 1);
        return Result.ok().data("ticketId", ticketId);
    }

    @GetMapping("get_ticket")
    @ResponseBody
    public Result getTicket(@RequestParam String ticketId) {
        Ticket ticket = ticketService.getTicketWithFlight(ticketId);
        if (Objects.isNull(ticket)) {
            return Result.failed("找不到该订单！请重试！");
        } else {
            return Result.ok(ticket);
        }
    }

    @PostMapping("pay")
    @ResponseBody
    public Result payTicket(@RequestParam String ticketId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (Objects.isNull(user)) {
            return Result.failed("清先登录！");
        }
        return ticketService.payTicket(ticketId, user);
    }
}
