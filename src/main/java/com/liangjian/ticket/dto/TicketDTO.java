package com.liangjian.ticket.dto;

import com.liangjian.ticket.utils.CommonUtil;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Data
public class TicketDTO {
    @NotNull(message = "无法获取航班ID！请重试！")
    private Integer flightId;
    @NotBlank(message = "请填写旅客姓名！")
    private String travelerName;
    @NotBlank(message = "请填写身份证号码！")
    private String idCard;
    @NotBlank(message = "请填写手机号码")
    @Pattern(regexp = CommonUtil.TEL_PATTERN, message = "请输入正确的手机号")
    private String tel;
}
