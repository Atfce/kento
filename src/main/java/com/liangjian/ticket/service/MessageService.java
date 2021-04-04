package com.liangjian.ticket.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.liangjian.ticket.entity.Message;
import com.liangjian.ticket.mapper.MessageMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MessageService extends ServiceImpl<MessageMapper, Message> {
    public Page<Message> getMessagesByUserId(Page<Message> page, Integer userId) {
        return baseMapper.getMessagesByUserId(page, userId);
    }

    public Page<Message> getMessageWithUser(Page<Message> page, Integer status, String content) {
        return baseMapper.getMessagesWithUser(page, status, content);
    }
}
