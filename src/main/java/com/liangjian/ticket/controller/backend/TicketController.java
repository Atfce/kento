package com.liangjian.ticket.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.liangjian.ticket.entity.Ticket;
import com.liangjian.ticket.service.TicketService;
import com.liangjian.ticket.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/backend/ticket")
@Controller
public class TicketController {
    @Autowired
    private TicketService ticketService;

    @RequestMapping("")
    public String index() {
        return "/backend/ticket";
    }

    @RequestMapping("get_list")
    @ResponseBody
    public Page<Ticket> getTickets(@RequestParam(defaultValue = "1") Integer start, @RequestParam(defaultValue = "15") Integer length,
                                   @RequestParam(defaultValue = "") String ticketId, @RequestParam(defaultValue = "") String tel,
                                   @RequestParam(defaultValue = "") String statusStr) {
        Integer status = null;
        if (!"all".equals(statusStr)) {
            status = Integer.valueOf(statusStr);
        }
        return ticketService.getTicketsByStatusAndUserIdAndTel(start / length + 1, length,
                status, ticketId, tel);
    }

    @RequestMapping("edit_ticket")
    @ResponseBody
    public Result editTicket(@RequestParam String id, @RequestParam String travelerName,
                             @RequestParam String tel, @RequestParam String idCard) {
        if (!StringUtils.hasText(id) || !StringUtils.hasText(travelerName)
                || !StringUtils.hasText(tel) || !StringUtils.hasText(idCard)) {
            return Result.failed("请把信息填写完整！");
        }

        ticketService.updateTicket(id, travelerName, tel, idCard);
        return Result.ok();
    }
}
