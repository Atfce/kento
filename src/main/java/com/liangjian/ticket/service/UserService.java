package com.liangjian.ticket.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.liangjian.ticket.entity.User;
import com.liangjian.ticket.mapper.UserMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class UserService {
    @Resource
    private UserMapper userMapper;

    public List<User> getUsers(Integer current, Integer size) {
        Page<User> page = new Page<>(current, size);
        return userMapper.getUsers(page);
    }
}
