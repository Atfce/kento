package com.liangjian.ticket.controller.front;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.liangjian.ticket.entity.Message;
import com.liangjian.ticket.entity.Ticket;
import com.liangjian.ticket.entity.User;
import com.liangjian.ticket.service.MessageService;
import com.liangjian.ticket.service.TicketService;
import com.liangjian.ticket.service.UserService;
import com.liangjian.ticket.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Objects;

@RequestMapping("user")
@Controller
public class TravelUserController {
    @Autowired
    private TicketService ticketService;
    @Autowired
    private UserService userService;
    @Autowired
    private MessageService messageService;
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

    @PostMapping("create_new_message")
    @ResponseBody
    public Result createNewMessage(@RequestParam String content) {
        User user = (User) session.getAttribute("user");
        if (Objects.isNull(user)) {
            throw new RuntimeException("请先登录！");
        }
        if (!StringUtils.hasText(content)) {
            return Result.failed("请输入留言内容！");
        }
        Message message = new Message();
        message.setContent(content);
        message.setCreateTime(new Timestamp(System.currentTimeMillis()));
        message.setStatus(0);
        message.setUserId(user.getId());
        messageService.save(message);
        return Result.ok();
    }

    @GetMapping("get_messages")
    @ResponseBody
    public Page<Message> getMyMessages(@RequestParam(defaultValue = "1") Integer start, @RequestParam(defaultValue = "15") Integer length) {
        User user = (User) session.getAttribute("user");
        if (Objects.isNull(user)) {
            throw new RuntimeException("请先登录！");
        }
        Page<Message> page = new Page<>(start / length + 1, length);
        return messageService.getMessagesByUserId(page, user.getId());
    }

    @PostMapping("delete_message")
    @ResponseBody
    public Result deleteMessage(@RequestParam Integer messageId) {
        messageService.removeById(messageId);
        return Result.ok();
    }
}
