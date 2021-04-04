package com.liangjian.ticket.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.liangjian.ticket.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper extends BaseMapper<User> {
    Page<User> getUsers(Page<User> page);

    User getUserByTel(String tel);

    Page<User> getUsersByCondition(Page<User> page, String tel, String lastName, String firstName, String idCard);
}
