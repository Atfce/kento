package com.liangjian.ticket.controller.front;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.liangjian.ticket.entity.Ticket;
import com.liangjian.ticket.entity.User;
import com.liangjian.ticket.service.TicketService;
import com.liangjian.ticket.service.UserService;
import com.liangjian.ticket.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Objects;

@RequestMapping("user")
@Controller
public class TravelUserController {
    @Autowired
    private TicketService ticketService;
    @Autowired
    private UserService userService;
    @Autowired
    private HttpSession session;

    @GetMapping("info")
    public String info() {
        return "/front/user";
    }

    @PostMapping("change_user_info")
    @ResponseBody
    public Result changeUserInfo(@RequestParam String lastName, @RequestParam String firstName, @RequestParam String idCard,
                                 @RequestParam Byte gender, @RequestParam String password) {
        if (!StringUtils.hasText(lastName)) {
            return Result.failed("请输入姓氏！");
        }
        if (!StringUtils.hasText(firstName)) {
            return Result.failed("请输入名字！");
        }
        if (!StringUtils.hasText(idCard)) {
            return Result.failed("请输入身份证号码！");
        }
        if (Objects.isNull(gender)) {
            return Result.failed("请选择性别！");
        }
        User user = (User) session.getAttribute("user");
        if (Objects.isNull(user)) {
            return Result.failed("请先登录！");
        }
        userService.changeUserInfo(user.getId(), lastName, firstName, idCard, gender, password);
        session.setAttribute("user", userService.getById(user.getId()));
        return Result.ok();
    }

    @GetMapping("get_tickets")
    @ResponseBody
    public Page<Ticket> getTickets(@RequestParam(defaultValue = "1") Integer start, @RequestParam(defaultValue = "15") Integer length,
                                   @RequestParam Integer status) {
        User user = (User) session.getAttribute("user");
        if (Objects.isNull(user)) {
            throw new RuntimeException("请先登录！");
        }
        return ticketService.getTicketsByStatusAndUserId(start / length + 1, length, status, user.getId());
    }
}
