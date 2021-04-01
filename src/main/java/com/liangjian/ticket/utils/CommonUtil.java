package com.liangjian.ticket.utils;

import java.util.Random;
import java.util.regex.Pattern;

public class CommonUtil {
    private static final String TEL_PATTERN = "^1[3-9]\\d{9}$";

    public static boolean validateTel(String tel) {
        return Pattern.matches(TEL_PATTERN, tel);
    }

    public static String getRandom(int bit) {
        Random r = new Random();
        StringBuilder rs = new StringBuilder();
        for (int i = 0; i < bit; i++) {
            rs.append(r.nextInt(10));
        }
        return rs.toString();
    }
}
