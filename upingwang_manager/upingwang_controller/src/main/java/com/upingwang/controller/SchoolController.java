package com.upingwang.controller;

import com.upingwang.common.result.JsonResult;
import com.upingwang.common.target.SystemControllerLog;
import com.upingwang.pojo.SystemBureau;
import com.upingwang.pojo.SystemSchool;
import com.upingwang.service.SystemBureauService;
import com.upingwang.service.SystemLshService;
import com.upingwang.service.SystemSchoolService;
import com.upingwang.service.UploadService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.Date;
import java.util.List;

/**
 * show 学校控制器
 *
 * @author Xushd
 * @since 2017/2/6 0006 上午 11:06
 */
@Controller
public class SchoolController extends GlobalController {

    @Autowired
    private SystemBureauService bureauService;

    @Autowired
    private UploadService uploadService;

    @Autowired
    private SystemSchoolService schoolService;

    @Autowired
    private SystemLshService lshService;

    /**
     * 跳转到学校管理
     * @param model
     * @return
     */
    @RequiresPermissions("/school")
    @RequestMapping(value = "/school",method = RequestMethod.GET)
    public String school(Model model){

        model.addAttribute("baseUrl", "/school");
        model.addAttribute("listUrl", "/school/list");
        model.addAttribute("handleUrl", "/school/handle");
        model.addAttribute("deleteUrl", "/school/delete");

        return "school/school";
    }

    /**
     * 跳转到学校新增页
     * @return
     */
    @RequiresPermissions("/school/input")
    @RequestMapping(value = "/school/input",method = RequestMethod.GET)
    public String schoolInput(Model model){

        List<SystemBureau> bureauList = bureauService.selectBureauListAll();

        model.addAttribute("bureauList",bureauList);
        model.addAttribute("saveUrl","/school/save");
        model.addAttribute("uploadUrl","/school/logo/upload");
        model.addAttribute("baseUrl","/school/input");

        return "school/school_input";
    }

    @SystemControllerLog(module = "学校管理",methods = "学校logo上传")
    @RequestMapping(value = "/school/logo/upload",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult schoolLogoUpload(@RequestParam(value = "schoolLogo", required = false) MultipartFile filedata){
        JsonResult result = uploadService.uploadImg(filedata,"schoolLogo/");
        return result;
    }

    @RequiresPermissions("/school/save")
    @SystemControllerLog(module = "学校管理",methods = "学校新增")
    @RequestMapping(value = "/school/save",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult schoolSave(@Valid SystemSchool school, BindingResult result){

        if (result.hasErrors()){
            String error = "";
            List<ObjectError> allErrors = result.getAllErrors();
            for (ObjectError allError : allErrors) {
                error+= allError.getDefaultMessage();
            }
            return JsonResult.Error(error);
        }else {
            //获取学校code方法不可以放在service 会导致事务嵌套
            String schoolCode = lshService.getSchoolCode();
            school.setSchoolCode(schoolCode);
            school.setStatus(0);
            school.setCreateUser(super.getUserInfo().getUserName());
            school.setCreateTime(new Date());
            JsonResult res = schoolService.insertSchool(school);
            return res;
        }

    }
}
