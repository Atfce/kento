package com.liangjian.ticket.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.liangjian.ticket.entity.Flight;

import org.apache.ibatis.annotations.Mapper;

import java.sql.Timestamp;


@Mapper
public interface FlightMapper extends BaseMapper<Flight> {
    Page<Flight> getFlights(Page<Flight> page, String departureCity, String arrivalCity, Timestamp scheduledDeparture, Timestamp scheduledDepartureEnd);
}
