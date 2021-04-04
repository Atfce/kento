package com.liangjian.ticket.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.liangjian.ticket.entity.User;
import com.liangjian.ticket.service.UserService;
import com.liangjian.ticket.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

@RequestMapping("/backend/user")
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("")
    public String index() {
        return "/backend/user";
    }

    @GetMapping("query")
    @ResponseBody
    public Page<User> queryUsers(@RequestParam(defaultValue = "1") Integer start, @RequestParam(defaultValue = "15") Integer length,
                                 @RequestParam(defaultValue = "") String tel, @RequestParam(defaultValue = "") String lastName,
                                 @RequestParam(defaultValue = "") String firstName, @RequestParam(defaultValue = "") String idCard) {
        Page<User> page = new Page<>(start / length + 1, length);
        return userService.getUsersByCondition(page, tel, lastName, firstName, idCard);
    }

    @PostMapping("update")
    @ResponseBody
    public Result changeUserInfo(@RequestParam Integer userId, @RequestParam String lastName,
                                 @RequestParam String firstName, @RequestParam String idCard,
                                 @RequestParam Byte gender, @RequestParam String password) {
        if (Objects.isNull(userId)) {
            return Result.failed("请选择用户！");
        }
        if (!StringUtils.hasText(lastName)) {
            return Result.failed("请输入姓氏！");
        }
        if (!StringUtils.hasText(firstName)) {
            return Result.failed("请输入名字！");
        }
        if (!StringUtils.hasText(idCard)) {
            return Result.failed("请输入身份证号码！");
        }
        if (Objects.isNull(gender)) {
            return Result.failed("请选择性别！");
        }
        userService.changeUserInfo(userId, lastName, firstName, idCard, gender, password);
        return Result.ok();
    }

    @PostMapping("delete")
    @ResponseBody
    public Result deleteUser(@RequestParam Integer id) {
        userService.removeById(id);
        return Result.ok();
    }
}
