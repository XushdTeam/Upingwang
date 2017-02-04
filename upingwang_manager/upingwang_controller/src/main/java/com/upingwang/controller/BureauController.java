package com.upingwang.controller;

import com.upingwang.common.dto.PageResult;
import com.upingwang.common.dto.PageSearchParam;
import com.upingwang.common.enums.OperateEnum;
import com.upingwang.common.result.JsonResult;
import com.upingwang.common.target.SystemControllerLog;
import com.upingwang.pojo.SystemBureau;
import com.upingwang.service.SystemBureauService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
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
 * show 教育局controller
 *
 * @author Xushd
 * @since 2017/2/4 0004 下午 3:42
 */
@Controller
public class BureauController extends GlobalController {

    @Autowired
    private SystemBureauService bureauService;


    /**
     * 跳转到教育局页面
     *
     * @param model
     * @return
     */
    @RequiresPermissions("/bureau")
    @RequestMapping(value = "/bureau", method = RequestMethod.GET)
    public String bureau(Model model) {
        model.addAttribute("baseUrl", "/bureau");
        model.addAttribute("listUrl", "/bureau/list");
        model.addAttribute("handleUrl", "/bureau/handle");
        model.addAttribute("deleteUrl", "/bureau/delete");
        return "school/bureau";
    }

    @SystemControllerLog(module = "教育局管理", methods = "教育局列表")
    @RequestMapping(value = "/bureau/list", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult userList(PageSearchParam param) {
        PageResult result = bureauService.getBureauList(param);
        return JsonResult.OK(result);
    }

    @RequestMapping(value = "/bureau/handle/{id}")
    public String handle(@PathVariable String id, Model model) {
        String modeView = "school/bureau_a_e";
        model.addAttribute("baseUrl", "/user");
        if (StringUtils.equals("new", id)) {
            //新增
            model.addAttribute("handle", "教育局管理/教育局新增");
            model.addAttribute("saveUrl", "/bureau/save");
        } else {
            //修改
            SystemBureau bureau = bureauService.getBureauById(Long.valueOf(id));
            model.addAttribute("bureau", bureau);
            model.addAttribute("handle", "教育局管理/教育局修改");
            model.addAttribute("saveUrl", "/bureau/" + bureau.getId() + "/update");
        }
        return modeView;
    }

    @RequiresPermissions("/bureau/save")
    @SystemControllerLog(module = "教育局管理", methods = "教育局新增")
    @RequestMapping(value = "/bureau/save", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult bureauSave(@Valid SystemBureau bureau, BindingResult result) {
        if (result.hasErrors()) {
            String error = "";
            List<ObjectError> allErrors = result.getAllErrors();
            for (ObjectError allError : allErrors) {
                error += allError.getDefaultMessage();
            }
            return JsonResult.Error(error);
        } else {
            bureau.setCreateUser(super.getUserInfo().getUserName());
            bureau.setCreateTime(new Date());
            OperateEnum res = bureauService.insertBureau(bureau);
            return JsonResult.build(res);
        }
    }

    @RequiresPermissions("/bureau/update")
    @SystemControllerLog(module = "教育局管理", methods = "教育局修改")
    @RequestMapping(value = "/bureau/{id}/update", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult bureauUpdate(@Valid SystemBureau bureau, BindingResult result,@PathVariable long id) {
        if (result.hasErrors()) {
            String error = "";
            List<ObjectError> allErrors = result.getAllErrors();
            for (ObjectError allError : allErrors) {
                error += allError.getDefaultMessage();
            }
            return JsonResult.Error(error);
        } else {
            bureau.setId(id);
            OperateEnum res = bureauService.updateBureau(bureau);
            return JsonResult.build(res);
        }
    }

    @RequiresPermissions("/bureau/delete")
    @SystemControllerLog(module = "教育局管理", methods = "教育局删除")
    @RequestMapping(value = "/bureau/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult bureauDelete(@PathVariable long id){

        OperateEnum res = bureauService.deleteBureauById(id);
        return JsonResult.build(res);
    }


}
