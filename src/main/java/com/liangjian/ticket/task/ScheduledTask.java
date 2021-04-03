package com.liangjian.ticket.task;

import com.liangjian.ticket.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

/**
 * 定时扫描数据库的订单 更新状态
 */
@Component
public class ScheduledTask {
    @Autowired
    private TicketService ticketService;

    /**
     * 1分钟扫一次过期未支付订单
     */
    @Scheduled(cron = "0 * * * * *")
    public void refreshFlightStatus() {
        Timestamp expireTime = new Timestamp(System.currentTimeMillis() - 60000 * 15);
        ticketService.updateExpireTicketsStatus(expireTime);
    }
}
