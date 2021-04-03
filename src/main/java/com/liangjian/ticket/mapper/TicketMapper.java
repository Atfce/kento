package com.liangjian.ticket.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.liangjian.ticket.entity.Ticket;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TicketMapper extends BaseMapper<Ticket> {
    Ticket getTicketWithFlight(String id);

    void updateStatus(String id, Integer status);
}
