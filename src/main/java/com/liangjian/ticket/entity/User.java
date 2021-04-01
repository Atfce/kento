package com.liangjian.ticket.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("user")
public class User {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String tel;
    private String password;
    private String salt;
    private String idCard;
    private String lastName;
    private String firstName;
    private byte gender;
}
