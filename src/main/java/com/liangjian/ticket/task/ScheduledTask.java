package com.liangjian.ticket.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * 定时扫描数据库的订单 更新状态
 */
@Component
public class ScheduledTask {

    /**
     * 1分钟扫一次
     */
    @Scheduled(cron = "0 * * * * *")
    public void refreshFlightStatus() {
        System.out.println(System.currentTimeMillis());
    }
}
