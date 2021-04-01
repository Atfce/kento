package com.liangjian.ticket.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.liangjian.ticket.entity.User;
import com.liangjian.ticket.mapper.UserMapper;
import com.liangjian.ticket.vo.Result;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;

@Service
@Transactional
public class UserService {
    @Resource
    private UserMapper userMapper;

    public List<User> getUsers(Integer current, Integer size) {
        Page<User> page = new Page<>(current, size);
        return userMapper.getUsers(page);
    }

    public Result login(HttpSession session, String tel, String password) {
        User user = userMapper.getUserByTel(tel);
        if (Objects.isNull(user)) {
            return Result.failed("该账号不存在！");
        }

        password = DigestUtils.md5DigestAsHex((password + user.getSalt()).getBytes());
        if (password.equals(user.getPassword())) {
            session.setAttribute("user", user);
            return Result.ok();
        } else {
            return Result.failed("账号或密码错误！");
        }
    }
}
