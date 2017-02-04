package com.upingwang.common.utils;

import com.alibaba.fastjson.JSON;

import java.util.List;

/**
 * show FastJson 工具类
 *
 * @author Xushd
 * @since 2017/1/17 0017 下午 10:18
 */
public class JsonUtils {

    /**
     * 对象转化成json字符串
     * @param object
     * @return
     */
    public static String objectToJson(Object object) {
        return JSON.toJSONString(object);
    }

    /**
     * json字符串转LIST
     * @param jsonStr
     * @param beanType
     * @param <T>
     * @return
     */
    public static <T>List<T> jsonToList(String jsonStr,Class<T> beanType){
        return JSON.parseArray(jsonStr,beanType);
    }




}
