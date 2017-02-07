package com.upingwang.rest.service;

import com.upingwang.common.result.JsonResult;

/**
 * show
 *
 * @author Xushd
 * @since 2017/2/7 0007 下午 4:43
 */
public interface IndexService {

    JsonResult login(String username, String password);

}
