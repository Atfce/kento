package com.liangjian.ticket.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.liangjian.ticket.dto.FlightDTO;
import com.liangjian.ticket.entity.Flight;
import com.liangjian.ticket.mapper.FlightMapper;

import com.liangjian.ticket.vo.Const;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.Objects;

@Service
@Transactional
public class FlightService extends ServiceImpl<FlightMapper, Flight> {
    public void saveFlight(FlightDTO flightDTO) {
        if (Objects.isNull(flightDTO.getId())) {
            flightDTO.setStatus(Const.FLIGHT_STATUS_ONSALE);
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
            this.save(flightDTO.convertToFlight());
        }
    }

    public Page<Flight> getFlightPage(Integer current, Integer size, String departureCity, String arrivalCity, Timestamp scheduledDeparture, Timestamp scheduledDepartureEnd) {
        Page<Flight> page = new Page<>(current, size);
        return baseMapper.getFlights(page, departureCity, arrivalCity, scheduledDeparture, scheduledDepartureEnd);
    }
}
