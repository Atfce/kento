package com.liangjian.ticket.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.liangjian.ticket.entity.Flight;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FlightMapper extends BaseMapper<Flight> {
}
