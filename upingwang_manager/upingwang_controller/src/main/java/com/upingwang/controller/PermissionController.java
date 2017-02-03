package com.upingwang.controller;

import com.upingwang.common.enums.OperateEnum;
import com.upingwang.common.result.JsonResult;
import com.upingwang.common.target.SystemControllerLog;
import com.upingwang.pojo.SystemPermission;
import com.upingwang.service.SystemPermissionService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.Date;
import java.util.List;

/**
 * show 权限控制器
 *
 * @author Xushd
 * @since 2017/1/20 0020 上午 10:12
 */
@Controller
public class PermissionController extends GlobalController{

    @Autowired
    private SystemPermissionService systemPermissionService;

    /**
     * 跳转
     * @return
     */
    @RequestMapping(value = "/permission",method = RequestMethod.GET)
    public String permission(Model model){

        model.addAttribute("baseUrl","/permission");
        model.addAttribute("listUrl","/permission/list");
        model.addAttribute("handleUrl","/permission/handle");
        model.addAttribute("deleteUrl","/permission/delete");

        return "system/permission";
    }


    /**
     * ajax 获取权限LIST
     * @return
     */
    @SystemControllerLog(module = "权限管理",methods = "权限列表")
    @RequestMapping(value = "/permission/list",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult permissionList(){

        //PageResult pageResult = systemPermissionService.getPermissionList(pageSearchParam);
        List<SystemPermission> list = systemPermissionService.getPermissionList(false);
        return JsonResult.OK(list);
    }

    /**
     * 新增修改跳转 id=null 新增 id!=null 修改
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/permission/handle/{id}")
    public String handle(@PathVariable String id, Model model){
        String resultView = "system/permission_a_e";

        if(StringUtils.equals("null",id)){
            //新增
            model.addAttribute("handle","新增权限");
            model.addAttribute("saveUrl","/permission/save");
        }else{
            //修改
            SystemPermission permission = systemPermissionService.getPermissionById(Long.parseLong(id));
            model.addAttribute("handle","修改权限");
            model.addAttribute("permission",permission);
            model.addAttribute("saveUrl","/permission/update");
        }
        //获取父级
        List<SystemPermission> permissionList = systemPermissionService.getPermissionList(true);
        model.addAttribute("list",permissionList);
        model.addAttribute("baseUrl","/permission");
        return resultView;
    }

    /**
     * 权限新增
     * @param permission
     * @param result
     * @return
     */
    @SystemControllerLog(module = "权限管理",methods = "权限新增")
    @RequestMapping(value = "/permission/save",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult permissionSave(@Valid SystemPermission permission, BindingResult result){
        //验证有错误
        if(result.hasErrors()){
            String error = "";
            List<ObjectError> allErrors = result.getAllErrors();
            for (ObjectError allError : allErrors) {
                error+= allError.getDefaultMessage();
            }
            return JsonResult.Error(error);
        } else{
            permission.setCreateUser(super.getUserInfo().getUserName());
            permission.setCreateTime(new Date());
            OperateEnum res = systemPermissionService.insertPermission(permission);
            return JsonResult.build(res);
        }
    }

    /**
     * 权限修改
     * @param permission
     * @param result
     * @return
     */
    @SystemControllerLog(module = "权限管理",methods = "权限修改")
    @RequestMapping(value = "/permission/update",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult permissionUpdate(@Valid SystemPermission permission, BindingResult result){
        //验证有错误
        if(result.hasErrors()){
            String error = "";
            List<ObjectError> allErrors = result.getAllErrors();
            for (ObjectError allError : allErrors) {
                error+= allError.getDefaultMessage();
            }
            return JsonResult.Error(error);
        }else{
            OperateEnum res = systemPermissionService.updatePermission(permission);
            return JsonResult.build(res);
        }

    }

    @SystemControllerLog(module = "权限管理",methods = "权限删除")
    @RequestMapping(value = "/permission/delete/{id}",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult permissionDelete(@PathVariable String id){
        OperateEnum res = systemPermissionService.deletePermission(Long.parseLong(id));
        return JsonResult.build(res);

    }
}
