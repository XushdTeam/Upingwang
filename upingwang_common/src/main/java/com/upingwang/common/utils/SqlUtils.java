package com.upingwang.common.utils;

/**
 * sql 工具
 * Created by Administrator on 2017/1/27 0027.
 */
public class SqlUtils {

    public static String getLikeSql(String filed){
        return "%"+filed+"%";
    }
}
