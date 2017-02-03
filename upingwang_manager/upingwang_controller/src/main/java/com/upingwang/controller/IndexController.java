package com.upingwang.controller;

import com.upingwang.pojo.SystemUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * show
 *
 * @author Xushd
 * @since 2017/1/19 0019 下午 3:15
 */
@Controller
public class IndexController extends GlobalController {
    /**
     * 首页跳转
     * @return
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(Model model){

        SystemUser user = super.getUserInfo();

        model.addAttribute("userName",user.getUserName());
        model.addAttribute("userAdvert",user.getUserAdvert());

        return "index";
    }
}
