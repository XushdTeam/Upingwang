package com.upingwang.controller;

import com.upingwang.common.dto.PageResult;
import com.upingwang.common.dto.PageSearchParam;
import com.upingwang.common.dto.PermissionResult;
import com.upingwang.common.enums.OperateEnum;
import com.upingwang.common.result.JsonResult;
import com.upingwang.common.target.SystemControllerLog;
import com.upingwang.pojo.SystemRole;
import com.upingwang.service.SystemPermissionService;
import com.upingwang.service.SystemRoleService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Date;
import java.util.List;

/**
 * 角色控制器
 * Created by Xushd on 2017/1/26 0026.
 */
@Controller
public class RoleController extends GlobalController{

    @Autowired
    private SystemRoleService roleService;

    @Autowired
    private SystemPermissionService permissionService;



    @RequiresPermissions("/role")
    @RequestMapping(value = "/role",method = RequestMethod.GET)
    public String role(Model model){

        model.addAttribute("baseUrl","/role");
        model.addAttribute("listUrl","/role/list");
        model.addAttribute("handleUrl","/role/handle");
        model.addAttribute("deleteUrl","/role/delete");
        model.addAttribute("permissionUrl","/role/permission");


        return "/system/role";
    }

    @SystemControllerLog(module = "角色管理",methods = "角色列表")
    @RequestMapping(value = "/role/list",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult roleList(PageSearchParam param){
        PageResult result = roleService.roleList(param);
        return JsonResult.OK(result);
    }


    @SystemControllerLog(module = "角色管理",methods = "角色权限获取")
    @RequestMapping(value = "/role/permission/{id}",method = RequestMethod.GET)
    public String rolePermission(@PathVariable String id, Model model){

        //角色分配
        model.addAttribute("handle","角色管理/权限分配");
        model.addAttribute("saveUrl","/role/permission/save");
        model.addAttribute("baseUrl","/role");
        model.addAttribute("roleId",id);
        List<PermissionResult> roleList = permissionService.getRolePermission(Long.valueOf(id));
        model.addAttribute("list",roleList);
        return "/system/role_p";
    }

    @RequiresPermissions("/role/permission")
    @SystemControllerLog(module = "角色管理",methods = "角色权限分配")
    @RequestMapping(value = "/role/permission/save",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult rolePermission(@RequestParam(value = "permission[]",required = false)List permission, long roleId){
        OperateEnum result = roleService.updateRolePermission(permission,roleId);
        return JsonResult.build(result);
    }

    /**
     * 菜单新增修改跳转
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/role/handle/{id}")
    public String handle(@PathVariable String id, Model model){
        String resultView = "system/role_a_e";

        model.addAttribute("baseUrl","/role");
        if(StringUtils.equals("null",id)){
            //新增
            model.addAttribute("handle","角色管理/角色新增");
            model.addAttribute("saveUrl","/role/save");
        }else {
            //修改
            SystemRole role = roleService.getRoleById(Long.valueOf(id));
            model.addAttribute("role",role);
            model.addAttribute("handle", "角色管理/角色修改");
            model.addAttribute("saveUrl","/role/update");
        }
        return resultView;
    }

    @RequiresPermissions("/role/save")
    @SystemControllerLog(module = "角色管理",methods = "角色新增")
    @RequestMapping(value = "/role/save",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult save(@Valid SystemRole role, BindingResult result){

        if (result.hasErrors()){
            String error = "";
            List<ObjectError> allErrors = result.getAllErrors();
            for (ObjectError allError : allErrors) {
                error+= allError.getDefaultMessage();
            }
            return JsonResult.Error(error);
        }else {
            role.setCreateUser(super.getUserInfo().getUserName());
            role.setCreateTime(new Date());
            OperateEnum res = roleService.insertRole(role);
            return JsonResult.build(res);
        }
    }

    @RequiresPermissions("/role/update")
    @SystemControllerLog(module = "角色管理",methods = "角色修改")
    @RequestMapping(value = "/role/update",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult update(@Valid SystemRole role, BindingResult result){
        if (result.hasErrors()){
            String error = "";
            List<ObjectError> allErrors = result.getAllErrors();
            for (ObjectError allError : allErrors) {
                error+= allError.getDefaultMessage();
            }
            return JsonResult.Error(error);
        }else {
            OperateEnum res = roleService.update(role);
            return JsonResult.build(res);
        }
    }

    @RequiresPermissions("/role/delete")
    @SystemControllerLog(module = "角色管理",methods = "角色删除")
    @RequestMapping(value = "/role/delete/{id}",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult delete(@PathVariable String id){

        OperateEnum result = roleService.deleteRoleById(Long.valueOf(id));
        return JsonResult.build(result);
    }



}
