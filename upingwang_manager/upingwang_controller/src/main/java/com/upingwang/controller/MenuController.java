package com.upingwang.controller;

import com.upingwang.common.enums.DicParentEnum;
import com.upingwang.common.enums.OperateEnum;
import com.upingwang.common.result.JsonResult;
import com.upingwang.common.target.SystemControllerLog;
import com.upingwang.pojo.SystemDictionary;
import com.upingwang.pojo.SystemMenu;
import com.upingwang.service.SystemDicService;
import com.upingwang.service.SystemMenuService;
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
 * show
 *
 * @author Xushd
 * @since 2017/1/23 0023 上午 10:50
 */
@Controller
public class MenuController extends GlobalController {

    @Autowired
    private SystemMenuService menuService;

    @Autowired
    private SystemDicService dicService;

    /**
     * 跳转菜单列表     *
     * @return
     */
    @RequestMapping(value = "/menu",method = RequestMethod.GET)
    public String menu(Model model){

        model.addAttribute("baseUrl","/menu");
        model.addAttribute("listUrl","/menu/list");
        model.addAttribute("handleUrl","/menu/handle");
        model.addAttribute("deleteUrl","/menu/delete");

        return "system/menu";
    }

    /**
     * 获取菜单列表
     * @return
     */
    @SystemControllerLog(module = "菜单管理",methods = "菜单列表")
    @RequestMapping(value="/menu/list",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult menuList(){
        List<SystemMenu> list = menuService.getMenuList(false);
        return JsonResult.OK(list);
    }

    /**
     * 菜单新增修改跳转
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/menu/handle/{id}")
    public String handle(@PathVariable String id, Model model){
        String resultView = "system/menu_a_e";
        List<SystemMenu> list = menuService.getMenuList(true);
        model.addAttribute("list",list);
        List<SystemDictionary> dicList = dicService.getDicListByParent(DicParentEnum.FUNCTION.getState());
        model.addAttribute("dicList",dicList);
        model.addAttribute("baseUrl","/menu");
        if(StringUtils.equals("null",id)){
            //新增
            model.addAttribute("handle","菜单新增");
            model.addAttribute("saveUrl","/menu/save");
        }else {
            //修改
            SystemMenu menu = menuService.getMenuById(Long.valueOf(id));
            model.addAttribute("menu",menu);
            model.addAttribute("handle", "菜单修改");
            model.addAttribute("saveUrl","/menu/update");
        }
        return resultView;
    }

    /**
     * 菜单新增
     * @param menu
     * @param result
     * @return
     */
    @SystemControllerLog(module = "菜单管理",methods = "菜单新增")
    @RequestMapping(value = "/menu/save",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult menuSave(@Valid SystemMenu menu, BindingResult result){
        //验证有错误
        if(result.hasErrors()){
            String error = "";
            List<ObjectError> allErrors = result.getAllErrors();
            for (ObjectError allError : allErrors) {
                error+= allError.getDefaultMessage();
            }
            return JsonResult.Error(error);
        } else{
            menu.setCreateUser(super.getUserInfo().getUserName());
            menu.setCreateTime(new Date());
            OperateEnum res = menuService.insertMenu(menu);
            return JsonResult.build(res);
        }
    }

    /**
     * 菜单修改
     * @param menu
     * @param result
     * @return
     */
    @SystemControllerLog(module = "菜单管理",methods = "菜单修改")
    @RequestMapping(value = "/menu/update",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult menuUpdate(@Valid SystemMenu menu, BindingResult result){
        //验证有错误
        if(result.hasErrors()){
            String error = "";
            List<ObjectError> allErrors = result.getAllErrors();
            for (ObjectError allError : allErrors) {
                error+= allError.getDefaultMessage();
            }
            return JsonResult.Error(error);
        }else{
            OperateEnum res = menuService.updateMenu(menu);
            return JsonResult.build(res);
        }
    }


    /**
     * 菜单删除
     * @param id
     * @return
     */
    @SystemControllerLog(module = "菜单管理",methods = "菜单删除")
    @RequestMapping(value = "/menu/delete/{id}",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult menuDelete(@PathVariable String id){
        OperateEnum res = menuService.deleteMenu(Long.parseLong(id));
        return JsonResult.build(res);
    }


    /**
     * 前台菜单JSON数据获取
     * @param typeId
     * @return
     */
    @SystemControllerLog(module = "菜单管理",methods = "前台菜单获取")
    @RequestMapping(value = "/menu/json/{typeId}",method = RequestMethod.GET)
    @ResponseBody
    public JsonResult menuJson(@PathVariable String typeId){
        List<?> menuList = menuService.getMenuListForWeb(typeId);
        return JsonResult.OK(menuList);
    }

}
