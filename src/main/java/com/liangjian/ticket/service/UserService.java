package com.liangjian.ticket.service;

import com.liangjian.ticket.dto.UserDTO;
import com.liangjian.ticket.entity.User;
import com.liangjian.ticket.mapper.UserMapper;
import com.liangjian.ticket.utils.CommonUtil;
import com.liangjian.ticket.vo.Const;
import com.liangjian.ticket.vo.Result;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Objects;

@Service
@Transactional
public class UserService {
    @Resource
    private UserMapper userMapper;

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

    public Result register(UserDTO userDTO, HttpSession session) {
        Long expireTime = (Long) session.getAttribute(Const.TEL_EXPIRE_CODE__KEY + userDTO.getTel());
        if (Objects.isNull(expireTime)) {
            return Result.failed("验证码错误！请重新输入！");
        } else if ((System.currentTimeMillis() / 1000L) > expireTime) {
            session.removeAttribute(Const.TEL_EXPIRE_CODE__KEY + userDTO.getTel());
            return Result.failed("验证码已过期！请重新获取！");
        }
        String telCode = (String) session.getAttribute(Const.TEL_CODE_KEY + userDTO.getTel());
        if (!userDTO.getValidCode().equals(telCode)) {
            return Result.failed("验证码错误！请重新输入！");
        }
        session.removeAttribute(Const.TEL_EXPIRE_CODE__KEY + userDTO.getTel());
        session.removeAttribute(Const.TEL_CODE_KEY + userDTO.getTel());

        String tel = userDTO.getTel();
        if (!Objects.isNull(userMapper.getUserByTel(tel))) {
            return Result.failed("该手机号已经注册账户！");
        }

        User user = new User();
        String salt = CommonUtil.getRandomStr(8);
        user.setSalt(salt);
        user.setPassword(DigestUtils.md5DigestAsHex((userDTO.getPassword() + salt).getBytes()));
        user.setTel(userDTO.getTel());
        user.setIdCard(userDTO.getIdCard());
        user.setLastName(userDTO.getLastName());
        user.setFirstName(userDTO.getFirstName());
        user.setGender(userDTO.getGender());
        userMapper.insert(user);
        return Result.ok();
    }
}
