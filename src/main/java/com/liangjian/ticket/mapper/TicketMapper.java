package com.liangjian.ticket.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.liangjian.ticket.entity.Ticket;
import org.apache.ibatis.annotations.Mapper;

import java.sql.Timestamp;
import java.util.List;

@Mapper
public interface TicketMapper extends BaseMapper<Ticket> {
    Ticket getTicketWithFlight(String id);

    void updateStatusAndPayTime(String id, Integer status, Timestamp payTime);

    List<Ticket> getExpireTickets(Timestamp expireTime);

    void updateStatus(String id, Integer status);
}
