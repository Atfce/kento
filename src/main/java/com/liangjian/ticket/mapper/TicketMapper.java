package com.liangjian.ticket.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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

    Page<Ticket> getTicketsByStatusAndUserId(Page<Ticket> page, Integer status, Integer userId);

    Page<Ticket> getTicketsByStatusAndIdAndTel(Page<Ticket> page, Integer status, String id, String tel);

    void updateTicket(String id, String travelerName, String tel, String idCard);
}
