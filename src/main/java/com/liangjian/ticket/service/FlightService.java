package com.liangjian.ticket.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.liangjian.ticket.dto.FlightDTO;
import com.liangjian.ticket.entity.Flight;
import com.liangjian.ticket.mapper.FlightMapper;

import com.liangjian.ticket.utils.CommonUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.sql.Timestamp;
import java.util.Objects;

@Service
@Transactional
public class FlightService extends ServiceImpl<FlightMapper, Flight> {
    public void saveFlight(FlightDTO flightDTO) {
        if (Objects.isNull(flightDTO.getId())) {
            flightDTO.setSeatEmpty(flightDTO.getSeatTotal());
            baseMapper.insert(flightDTO.convertToFlight());
            if (flightDTO.getAdd30Days()) {
                for (int i = 1; i < 31; i++) {
                    Flight flight = flightDTO.convertToFlight();
                    flight.setScheduledDeparture(new Timestamp(flight.getScheduledDeparture().getTime() + i * 86400000));
                    flight.setScheduledArrival(new Timestamp(flight.getScheduledArrival().getTime() + i * 86400000));
                    baseMapper.insert(flight);
                }
            }
        } else {
            this.saveOrUpdate(flightDTO.convertToFlight());
        }
    }

    public Page<Flight> getFlightPage(Integer current, Integer size, String departureCity, String arrivalCity, String scheduledTime) {
        Timestamp scheduledDeparture = null;
        Timestamp scheduledDepartureEnd = null;
        if (StringUtils.hasText(scheduledTime)) {
            scheduledTime += " 00:00:00";
            scheduledDeparture = CommonUtil.formatTimestamp(scheduledTime);
            assert scheduledDeparture != null;
            scheduledDepartureEnd = new Timestamp(scheduledDeparture.getTime() + 86400000);
        } else {
            scheduledDeparture = new Timestamp(System.currentTimeMillis());
        }
        Page<Flight> page = new Page<>(current, size);
        return baseMapper.getFlights(page, departureCity, arrivalCity, scheduledDeparture, scheduledDepartureEnd);
    }
}
