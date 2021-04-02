package com.liangjian.ticket.dto;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.liangjian.ticket.entity.Flight;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.sql.Timestamp;

@Data
public class FlightDTO {
    @TableId(type = IdType.AUTO)
    private Integer id;
    @NotBlank(message = "请输入航班编号")
    private String flightNo;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    @NotNull(message = "请输入出发时间")
    private Timestamp scheduledDeparture;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    @NotNull(message = "请输入到达时间")
    private Timestamp scheduledArrival;
    @NotBlank(message = "请输入出发城市")
    private String departureCity;
    @NotBlank(message = "请输入到达城市")
    private String arrivalCity;
    @NotNull(message = "请选择航班状态")
    private Integer status;
    @NotBlank(message = "请输入飞机型号")
    private String aircraft;
    @NotNull(message = "请输入座位数量")
    private Integer seatTotal;
    private Integer seatEmpty;
    @NotNull(message = "请输入价格")
    private BigDecimal amount;
    private Boolean add30Days;


    public Flight convertToFlight() {
        Flight flight = new Flight();
        flight.setId(this.id);
        flight.setFlightNo(this.flightNo);
        flight.setScheduledDeparture(this.scheduledDeparture);
        flight.setScheduledArrival(this.scheduledArrival);
        flight.setDepartureCity(this.departureCity);
        flight.setArrivalCity(this.arrivalCity);
        flight.setStatus(this.status);
        flight.setAircraft(this.aircraft);
        flight.setSeatTotal(this.seatTotal);
        flight.setSeatEmpty(this.seatEmpty);
        flight.setAmount(this.amount);
        return flight;
    }
}
