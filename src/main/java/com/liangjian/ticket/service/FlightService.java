package com.liangjian.ticket.service;

import javax.annotation.Resource;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.liangjian.ticket.entity.Flight;
import com.liangjian.ticket.mapper.FlightMapper;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FlightService extends ServiceImpl<FlightMapper, Flight> {
    @Resource
    private FlightMapper flightMapper;

    public void saveFlight(Flight flight) {
        this.saveOrUpdate(flight);
    }
}
