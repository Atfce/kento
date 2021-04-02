package com.liangjian.ticket.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;

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
    @NotBlank(message = "请输入航班编号")
    private String flightNo;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    @NotBlank(message = "请输入出发时间")
    private Timestamp scheduledDeparture;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    @NotBlank(message = "请输入到达时间")
    private Timestamp scheduledArrival;
    @NotBlank(message = "请输入出发城市")
    private String departureCity;
    @NotBlank(message = "请输入到达城市")
    private String arrivalCity;
    private String status;
    @NotBlank(message = "请输入飞机型号")
    private String aircraft;
    @NotBlank(message = "请输入座位数量")
    private Integer seatTotal;
    private Integer seatEmpty;
    @NotBlank(message = "请输入价格")
    private BigDecimal amount;
}
