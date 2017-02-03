package com.upingwang.aspect;

import com.upingwang.common.target.SystemControllerLog;
import com.upingwang.common.target.SystemServiceLog;
import com.upingwang.common.utils.JsonUtils;
import com.upingwang.pojo.SystemLog;
import com.upingwang.pojo.SystemUser;
import com.upingwang.service.SystemLogService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * show
 *
 * @author Xushd
 * @since 2017/1/17 0017 下午 9:13
 */
@Aspect
@Component
public class SystemLogAspect implements Ordered {

    @Autowired
    private SystemLogService systemLogService;

    private static final Logger LOGGER = LoggerFactory.getLogger(SystemLogAspect.class);

    @Pointcut("@annotation(com.upingwang.common.target.SystemServiceLog)")
    public void serviceAspect(){

    }

    /**
     * Controller层切点
     */
    @Pointcut("@annotation(com.upingwang.common.target.SystemControllerLog)")
    public void ControllerAspect(){

    }

    @Before("ControllerAspect()")
    public void doBefore(JoinPoint joinPoint){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Subject subject = SecurityUtils.getSubject();
        String userPhone = (String) subject.getPrincipal();
        Session session = subject.getSession();
        SystemUser systemUser = (SystemUser) session.getAttribute(userPhone);
        if (systemUser==null)return;
        //请求的IP
        String ip = request.getRemoteAddr();
        try {
            Map<String,String> controllerDescription = getControllerDescription(joinPoint);
            //*========控制台输出=========*//
            System.out.println("=====前置通知开始=====");
            System.out.println("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
            System.out.println("模块名称:" + controllerDescription.get("module"));
            System.out.println("方法名称:" + controllerDescription.get("method"));
            System.out.println("请求人:" + systemUser.getUserName());
            System.out.println("请求IP:" + ip);
            //*========数据库日志=========*//
            SystemLog systemLog = new SystemLog();
            systemLog.setMethodName(controllerDescription.get("method"));
            systemLog.setModuleName(controllerDescription.get("module"));
            systemLog.setLogMethod(joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()");
            systemLog.setLogType(0);
            systemLog.setRequestIp(ip);
            systemLog.setExceptionCode(null);
            systemLog.setExceptionDetail( null);
            systemLog.setParams(null);
            systemLog.setUserName(systemUser.getUserName());
            systemLog.setLogTime(new Date());
            //保存数据库
            systemLogService.writeLog(systemLog);
            System.out.println("=====前置通知结束=====");
        }  catch (Exception e) {
            //记录本地异常日志
            LOGGER.error("==前置通知异常==");
            LOGGER.error("异常信息:{}", e.getMessage());
        }

    }

    @AfterThrowing(pointcut = "serviceAspect()", throwing = "e")
    public void  doAfterThrowing(JoinPoint joinPoint, Throwable e){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        Subject subject = SecurityUtils.getSubject();
        String userPhone = (String) subject.getPrincipal();
        Session session = subject.getSession();
        SystemUser systemUser = (SystemUser) session.getAttribute(userPhone);
        if (systemUser==null)return;
        //请求的IP
        String ip = request.getRemoteAddr();
        //获取用户请求方法的参数并序列化为JSON格式字符串
        Object[] arguments = joinPoint.getArgs();
        String params = JsonUtils.objectToJson(arguments);
        try {

            Map<String,String> serviceDescription = getServiceDescription(joinPoint);
              /*========控制台输出=========*/
            System.out.println("=====异常通知开始=====");
            System.out.println("异常代码:" + e.getClass().getName());
            System.out.println("异常信息:" + e.getMessage());
            System.out.println("异常方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
            System.out.println("模块名称:" + serviceDescription.get("module"));
            System.out.println("方法名称:" + serviceDescription.get("method"));
            System.out.println("请求人:" + systemUser.getUserName());
            System.out.println("请求IP:" + ip);
            System.out.println("请求参数:" + params);
               /*==========数据库日志=========*/
            SystemLog systemLog = new SystemLog();
            systemLog.setMethodName(serviceDescription.get("method"));
            systemLog.setModuleName(serviceDescription.get("module"));
            systemLog.setExceptionCode(e.getClass().getName());
            systemLog.setLogType(1);
            systemLog.setExceptionDetail(e.getMessage());
            systemLog.setLogMethod((joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
            systemLog.setParams(params);
            systemLog.setUserName(systemUser.getUserName());
            systemLog.setLogTime(new Date());
            systemLog.setRequestIp(ip);
            //保存数据库
            systemLogService.writeLog(systemLog);
            System.out.println("=====异常通知结束=====");
        }  catch (Exception ex) {
            //记录本地异常日志
            LOGGER.error("==异常通知异常==");
            LOGGER.error("异常信息:{}", ex.getMessage());
        }
         /*==========记录本地异常日志==========*/
        Object[] object = {joinPoint.getTarget().getClass().getName() + joinPoint.getSignature().getName(),e.getClass().getName(), e.getMessage(), params};
        LOGGER.error("异常方法:{}异常代码:{}异常信息:{}参数:{}",object);
    }

    /**
     * 获取注解中对方法的描述信息 用于Service层注解
     * @param joinPoint
     * @return
     */
    private Map<String, String> getServiceDescription(JoinPoint joinPoint) throws ClassNotFoundException {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = Class.forName(targetName);
        Method[] methods = targetClass.getMethods();
        Map<String,String> map = new HashMap<>();
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    map.put("method",method.getAnnotation(SystemServiceLog. class).methods());
                    map.put("module",method.getAnnotation(SystemServiceLog. class).module());
                    break;
                }
            }
        }
        return map;
    }

    /**
     * 获取注解中对方法的描述信息 用于Controller层注解
     * @param joinPoint
     * @return
     * @throws ClassNotFoundException
     */
    private Map<String, String> getControllerDescription(JoinPoint joinPoint) throws ClassNotFoundException {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = Class.forName(targetName);
        Method[] methods = targetClass.getMethods();
        Map<String,String> map = new HashMap<>();
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    map.put("method",method.getAnnotation(SystemControllerLog. class).methods());
                    map.put("module",method.getAnnotation(SystemControllerLog. class).module());
                    break;
                }
            }
        }
        return map;
    }


    @Override
    public int getOrder() {
        return 1;
    }
}

