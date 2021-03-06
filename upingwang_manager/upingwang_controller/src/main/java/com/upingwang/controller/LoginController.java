package com.upingwang.controller;

import com.upingwang.common.enums.AuthEnum;
import com.upingwang.common.enums.SessionKey;
import com.upingwang.common.result.JsonResult;
import com.upingwang.common.target.SystemControllerLog;
import com.upingwang.common.utils.VerifyCodeUtils;
import com.upingwang.pojo.SystemUser;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;


/**
 * show
 *
 * @author Xushd
 * @since 2017/1/17 0017 下午 4:54
 */
@Controller
public class LoginController extends GlobalController{

    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

    /**
     * 登录页跳转
     * @return
     */
    @RequestMapping(value = "/login")
    public String login(){
        return "login";
    }


    /**
     * 登录验证 shiro验证
     * @param systemUser
     * @param bindingResult pojo字段验证结果
     * @return
     */
    @RequestMapping("/loginCheck")
    @ResponseBody
    public JsonResult loginCheck(@Valid SystemUser systemUser,
                                 BindingResult bindingResult,
                                 HttpServletRequest request){
        //已经登陆 直接跳转到首页
        Subject subject = SecurityUtils.getSubject();
        if(subject.isAuthenticated()){
            return JsonResult.OK("/index");
        }
        String verifyCode = (String) request.getSession().getAttribute(String.valueOf(SessionKey.VERIFYCODE_KEY));
        if(!StringUtils.equals(systemUser.getVerifyCode(),verifyCode)){
            return JsonResult.Error(AuthEnum.VERIFYCODE_ERROR.getStateInfo());
        }

        //Form 提交字段非空验证
        if (bindingResult.hasErrors()){
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            String error = "";
            for (ObjectError allError : allErrors) {
                error+= allError.getDefaultMessage();
            }
            // String error =  JsonUtils.objectToJson(allError);
            LOGGER.error("error:{}", error);
            return JsonResult.Error(error);
        }
        try {
            //shiro 用户登录验证 成功不抛错误 否则抛出错误
            UsernamePasswordToken token = new UsernamePasswordToken(systemUser.getUserPhone(),systemUser.getPassword());
            String rememberMe = String.valueOf(request.getParameter("remember"));
            if(rememberMe.equals("on")){
                token.setRememberMe(true);
            }
            subject.login(token);
            return JsonResult.build(200,AuthEnum.SUCCESS.getStateInfo(),"/index");
        }catch (AuthenticationException e){
            LOGGER.error("error:{}",e.getMessage());
            return JsonResult.Error(e.getMessage());
        }
    }


    @SystemControllerLog(module = "登录模块",methods = "用户退出")
    @RequestMapping(value = "/logOut",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult logOut(){
        Subject currentSubject = SecurityUtils.getSubject();
        currentSubject.logout();
        return JsonResult.OK("/login");
    }

    @RequestMapping(value = "/lock/{un}/{pwd}",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult lock(@PathVariable String un, @PathVariable String pwd){
        Subject subject = SecurityUtils.getSubject();
        Session session = subject.getSession();
        String userPhone = (String) subject.getPrincipal();
        SystemUser user = (SystemUser)subject.getSession().getAttribute(userPhone);
        if(StringUtils.equals(un,user.getUserName())&&
                StringUtils.equals(pwd,user.getPassword())){
            return JsonResult.OK();
        }else{
            return JsonResult.Error(AuthEnum.USER_ERROR_PASSWORD.getStateInfo());
        }
    }

    /**
     * 生成验证码
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping(value = "/verifyCode",method = RequestMethod.GET)
    public void verifyCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");

        //生成随机字串
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
        //存入会话session
        HttpSession session = request.getSession(true);
        session.setAttribute(String.valueOf(SessionKey.VERIFYCODE_KEY), verifyCode.toLowerCase());
        //生成图片
        int w = 200, h = 80;
        VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);
    }

}
