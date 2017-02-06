package com.upingwang.common.utils;

import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by Xushd on 2017/2/6.
 */
public class IDUtilsTest {


    @Test
    public void testGenItemId() throws Exception {

        long lsh = 5;
        String code = String.format("S%04d", lsh);
        System.out.println(code);
    }
}