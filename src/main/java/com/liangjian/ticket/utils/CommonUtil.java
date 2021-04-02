package com.liangjian.ticket.utils;

import com.liangjian.ticket.vo.Const;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;
import java.util.regex.Pattern;

public class CommonUtil {
    public static final String TEL_PATTERN = "^1[3-9]\\d{9}$";

    public static boolean validateTel(String tel) {
        return Pattern.matches(TEL_PATTERN, tel);
    }

    public static String getRandomNum(int bit) {
        Random r = new Random();
        StringBuilder rs = new StringBuilder();
        for (int i = 0; i < bit; i++) {
            rs.append(r.nextInt(10));
        }
        return rs.toString();
    }

    public static String getRandomStr(int bit) {
        String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < bit; i++) {
            int number = random.nextInt(62);
            sb.append(str.charAt(number));
        }
        return sb.toString();
    }

    public static Timestamp formatTimestamp(String time) {
        try {
            return new Timestamp(new SimpleDateFormat(Const.CONFIG_DATE_FORMAT).parse(time).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

}
