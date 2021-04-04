package com.liangjian.ticket.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FilterConfig {
    @Bean
    public FilterRegistrationBean backendLoginFilter() {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(new BackendLoginFilter());
        registration.addUrlPatterns("/*");
        registration.setName("backendLoginFilter");
        registration.setOrder(1);
        return registration;
    }
}
