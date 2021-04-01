package com.liangjian.ticket.dto;

import com.liangjian.ticket.utils.CommonUtil;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
public class UserDTO {
    @NotBlank(message = "请填写姓氏")
    private String lastName;
    @NotBlank(message = "请填写名字")
    private String firstName;
    @NotBlank(message = "请填写身份证号码")
    private String idCard;
    private byte gender;
    @NotBlank(message = "请填写手机号码")
    @Pattern(regexp = CommonUtil.TEL_PATTERN, message = "请输入正确的手机号")
    private String tel;
    @NotBlank(message = "请填写密码")
    private String password;
    @NotBlank(message = "请填写手机验证码")
    private String validCode;
}
