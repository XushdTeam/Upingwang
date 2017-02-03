package com.upingwang.common.exception;

/**
 * show 自定义运行错误
 *
 * @author Xushd
 * @since 2017/1/19 0019 下午 9:02
 */
public class RunException extends RuntimeException {
    public RunException(String message) {
        super(message);
    }

    public RunException(String message, Throwable cause) {
        super(message, cause);
    }
}
