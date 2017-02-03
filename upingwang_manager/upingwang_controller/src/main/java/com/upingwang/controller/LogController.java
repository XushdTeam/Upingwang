package com.upingwang.controller;

import com.upingwang.common.dto.PageResult;
import com.upingwang.common.dto.PageSearchParam;
import com.upingwang.common.enums.OperateEnum;
import com.upingwang.common.result.JsonResult;
import com.upingwang.common.target.SystemControllerLog;
import com.upingwang.pojo.SystemLog;
import com.upingwang.service.SystemLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * show
 *
 * @author Xushd
 * @since 2017/1/24 0024 下午 2:16
 */
@Controller
public class LogController {

    @Autowired
    private SystemLogService logService;

    /**
     * 运行日志跳转
     * @param model
     * @return
     */
    @RequestMapping(value = "/log/run",method = RequestMethod.GET)
    public String runLog(Model model){

        model.addAttribute("baseUrl","/log/run");
        model.addAttribute("listUrl","/log/run/list");
        model.addAttribute("deleteUrl","/log/run/delete");

        return "/system/logrunning";
    }

    /**
     * 错误日志跳转
     * @param model
     * @return
     */
    @RequestMapping(value = "/log/error",method = RequestMethod.GET)
    public String errorLog(Model model){

        model.addAttribute("baseUrl","/log/error");
        model.addAttribute("listUrl","/log/error/list");
        model.addAttribute("deleteUrl","/log/error/delete");
        model.addAttribute("handleUrl","/log/error/detail");

        return "/system/logerror";
    }


    /**
     * 获取运行日志LIST
     * @param param
     * @return
     */
    @RequestMapping(value = "/log/run/list",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult logRunList(PageSearchParam param){

        PageResult result = logService.getLogRunList(param,0);

        return JsonResult.OK(result);
    }

    /**
     * 获取错误日志LIST
     * @param param
     * @return
     */
    @RequestMapping(value = "/log/error/list",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult logErrorList(PageSearchParam param){

        PageResult result = logService.getLogRunList(param,1);

        return JsonResult.OK(result);
    }

    @SystemControllerLog(module = "日志管理",methods = "删除7天之前运行日志")
    @RequestMapping(value = "/log/run/delete",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult logRunDelete(){
        if (logService.logRunDel(0)){
            return JsonResult.build(OperateEnum.SUCCESS);
        }else {
            return JsonResult.build(OperateEnum.FAILE);
        }

    }

    @SystemControllerLog(module = "日志管理",methods = "删除7天之前错误日志")
    @RequestMapping(value = "/log/error/delete",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult logErrorDelete(){

        if (logService.logRunDel(1)){
            return JsonResult.build(OperateEnum.SUCCESS);
        }else {
            return JsonResult.build(OperateEnum.FAILE);
        }

    }
    @SystemControllerLog(module = "日志管理",methods = "异常日志详情")
    @RequestMapping(value = "/log/error/detail/{id}")
    public String logErrorDetail(@PathVariable int id, Model model){
        SystemLog log = logService.getLogById(id);
        model.addAttribute("log",log);
        model.addAttribute("baseUrl","/log/error");
        return "system/logerror_d";
    }

}
