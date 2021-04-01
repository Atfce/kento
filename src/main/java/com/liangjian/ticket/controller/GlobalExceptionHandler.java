package com.liangjian.ticket.controller;

import com.liangjian.ticket.vo.Result;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import java.util.List;

@RestControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 全局异常拦截
     */
    @ExceptionHandler(Exception.class)
    public Result handler(Exception exception) {
        if (exception instanceof MethodArgumentNotValidException) {
            BindingResult exceptions = ((MethodArgumentNotValidException) exception).getBindingResult();
            // 判断异常中是否有错误信息，如果存在就使用异常中的消息，否则使用默认消息
            if (exceptions.hasErrors()) {
                List<ObjectError> errors = exceptions.getAllErrors();
                if (!errors.isEmpty()) {
                    // 这里列出了全部错误参数，按正常逻辑，只需要第一条错误即可
                    FieldError fieldError = (FieldError) errors.get(0);
                    return Result.failed(fieldError.getDefaultMessage());
                }
            }
            return Result.failed("请求参数错误");
        }
        exception.printStackTrace();
        return Result.failed(exception.toString());
    }
}
