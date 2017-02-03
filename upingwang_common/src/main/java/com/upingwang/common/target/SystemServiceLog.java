package com.upingwang.common.target;

import java.lang.annotation.*;

/**
 * show
 *
 * @author Xushd
 * @since 2017/1/17 0017 下午 9:08
 */
@Target({ElementType.PARAMETER,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SystemServiceLog {

    String module()  default "";
    String methods()  default "";
}
