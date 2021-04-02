package com.liangjian.ticket.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@TableName("flight")
public class Flight {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String flightNo;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Timestamp scheduledDeparture;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Timestamp scheduledArrival;
    private String departureCity;
    private String arrivalCity;
    private Integer status;
    private String aircraft;
    private Integer seatTotal;
    private Integer seatEmpty;
    private BigDecimal amount;
}
