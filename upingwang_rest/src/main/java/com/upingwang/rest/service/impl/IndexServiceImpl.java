package com.upingwang.rest.service.impl;

import com.upingwang.common.enums.AuthEnum;
import com.upingwang.common.result.JsonResult;
import com.upingwang.rest.service.IndexService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * show
 *
 * @author Xushd
 * @since 2017/2/7 0007 下午 4:44
 */
@Service
public class IndexServiceImpl implements IndexService {

    @Value("${USER}")
    private String USERNAME;

    @Value("${PASSWORD}")
    private String PASSWORD;

    @Override
    public JsonResult login(String username, String password) {
        if(!StringUtils.equals(USERNAME,username)){
            return JsonResult.build(AuthEnum.USER_NO_EXIT);
        }else if(!StringUtils.equals(PASSWORD,password)){
            return JsonResult.build(AuthEnum.USER_ERROR_PASSWORD);
        }else{
            return JsonResult.build(200,AuthEnum.SUCCESS.getStateInfo(),"/rest/index/interface");
        }
    }
}
