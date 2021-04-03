package com.liangjian.ticket.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.liangjian.ticket.dto.TicketDTO;
import com.liangjian.ticket.entity.Flight;
import com.liangjian.ticket.entity.Ticket;
import com.liangjian.ticket.entity.User;
import com.liangjian.ticket.mapper.TicketMapper;
import com.liangjian.ticket.vo.Result;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.Objects;

@Service
@Transactional
public class TicketService extends ServiceImpl<TicketMapper, Ticket> {
    public String submitTicket(TicketDTO ticketDTO, Flight flight, User user) {
        if (ticketDTO.getTravelerName().equals(user.getLastName() + user.getFirstName())
                && ticketDTO.getIdCard().equals(user.getIdCard())) {
            Ticket ticket = new Ticket();
            ticket.setUserId(user.getId());
            ticket.setCreateTime(new Timestamp(System.currentTimeMillis()));
            ticket.setStatus(0);
            ticket.setFlightId(flight.getId());
            ticket.setCost(flight.getAmount());
            ticket.setTravelerName(ticketDTO.getTravelerName());
            ticket.setIdCard(ticketDTO.getIdCard());
            ticket.setTel(ticketDTO.getTel());
            baseMapper.insert(ticket);
            return ticket.getId();
        } else {
            throw new RuntimeException("所填信息与用户信息不符！");
        }
    }

    public Ticket getTicketWithFlight(String id) {
        return baseMapper.getTicketWithFlight(id);
    }

    public Result payTicket(String id, User user) {
        Ticket ticket = baseMapper.getTicketWithFlight(id);
        if (Objects.isNull(ticket)) {
            return Result.failed("支付订单失败！找不到该订单 ！");
        }
        if (!ticket.getStatus().equals(0)) {
            return Result.failed("订单状态出错！");
        }
        if (!user.getId().equals(ticket.getUserId())) {
            return Result.failed("您无权支付该订单！");
        }
        long currentTime = System.currentTimeMillis() / 1000L;
        long expireTime = ticket.getCreateTime().getTime() / 1000L + 60 * 15;
        if (currentTime > expireTime) {
            return Result.failed("订单已失效！请重新预订！");
        }
        if (ticket.getFlight().getScheduledDeparture().getTime() / 1000L < currentTime) {
            return Result.failed("该航班已起飞！");
        }
        if (ticket.getFlight().getStatus() != 0) {
            return Result.failed("该航班不在售票状态内！");
        }

        ticket.setPayTime(new Timestamp(currentTime));
        baseMapper.updateStatus(id, 1);
        return Result.ok();
    }
}
