package com.upingwang.common.exception;

/**
 * show
 *
 * @author Xushd
 * @since 2017/1/18 0018 下午 2:16
 */
public class LoginAuthException extends RuntimeException {

    public LoginAuthException(String message) {
        super(message);
    }

    public LoginAuthException(String message, Throwable cause) {
        super(message, cause);
    }
}
