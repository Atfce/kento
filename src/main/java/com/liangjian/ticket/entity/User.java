package com.liangjian.ticket.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("user")
public class User {
    private Integer id;
    private String tel;
    private String name;
    private String password;
}
