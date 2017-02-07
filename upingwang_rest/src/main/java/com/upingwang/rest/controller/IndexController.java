package com.upingwang.rest.controller;

import com.upingwang.common.result.JsonResult;
import com.upingwang.rest.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * show
 *
 * @author Xushd
 * @since 2017/2/7 0007 下午 2:24
 */
@Controller
public class IndexController {

    @Autowired
    private IndexService indexService;

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(){
        return "index";
    }
    @RequestMapping(value = "/index/login",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult login(String username,String password){
        JsonResult result = indexService.login(username,password);
        return result;
    }
    @RequestMapping(value = "/index/interface",method = RequestMethod.GET)
    public String interfacePage(){
        return "interface";
    }

}
