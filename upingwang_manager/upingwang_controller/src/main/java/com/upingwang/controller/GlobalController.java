package com.upingwang.controller;

import com.upingwang.pojo.SystemUser;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

/**
 * show Controller 基类
 *
 * @author Xushd
 * @since 2017/1/22 0022 下午 7:15
 */
public class GlobalController {

    /**
     * shiro session 中获取用户信息
     * @return
     */
    protected SystemUser getUserInfo(){
        Subject subject = SecurityUtils.getSubject();
        String userPhone = (String) subject.getPrincipal();
        SystemUser user = (SystemUser) subject.getSession().getAttribute(userPhone);
        return user;
    }

}
