package com.upingwang.common.target;

import java.lang.annotation.*;

/**
 * show 自定义日志注解 拦截Action
 *
 * @author Xushd
 * @since 2017/1/17 0017 下午 9:07
 */
@Target({ElementType.PARAMETER,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SystemControllerLog {

    String module()  default "";
    String methods()  default "";
}
