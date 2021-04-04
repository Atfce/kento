package com.liangjian.ticket.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.liangjian.ticket.entity.Message;
import com.liangjian.ticket.service.MessageService;
import com.liangjian.ticket.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.Objects;

@RequestMapping("/backend/message")
@Controller
public class MessageController {
    @Autowired
    private MessageService messageService;

    @RequestMapping("")
    public String index() {
        return "/backend/message";
    }

    @GetMapping("get_list")
    @ResponseBody
    public Page<Message> getMessages(@RequestParam(defaultValue = "1") Integer start, @RequestParam(defaultValue = "15") Integer length,
                                     @RequestParam(defaultValue = "") String content, @RequestParam String statusStr) {
        Integer status = null;
        if (!"all".equals(statusStr)) {
            status = Integer.valueOf(statusStr);
        }
        Page<Message> page = new Page<>(start / length + 1, length);

        return messageService.getMessageWithUser(page, status, content);
    }

    @PostMapping("reply")
    @ResponseBody
    public Result replay(@RequestParam Integer id, @RequestParam String reply) {
        if (!StringUtils.hasText(reply)) {
            return Result.failed("请输入回复内容！");
        }
        Message message = messageService.getById(id);
        if (Objects.isNull(message)) {
            return Result.failed("找不到该条留言！请刷新重试！");
        }
        message.setReply(reply);
        message.setReplyTime(new Timestamp(System.currentTimeMillis()));
        message.setStatus(1);
        messageService.saveOrUpdate(message);
        return Result.ok();
    }
}
