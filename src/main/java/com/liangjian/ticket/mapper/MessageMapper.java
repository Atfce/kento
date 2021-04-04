package com.liangjian.ticket.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.liangjian.ticket.entity.Message;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageMapper extends BaseMapper<Message> {
    Page<Message> getMessagesByUserId(Page<Message> page, Integer userId);

    Page<Message> getMessagesWithUser(Page<Message> page, Integer status, String content);
}
