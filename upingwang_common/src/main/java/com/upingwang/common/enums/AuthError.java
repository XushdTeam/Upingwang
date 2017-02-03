package com.upingwang.common.enums;

/**
 * show
 *
 * @author Xushd
 * @since 2017/1/19 0019 下午 1:47
 */
public enum AuthError {
    VERIFYCODE_ERROR("验证码错误"),
    USER_NO_EXIT("用户不存在"),
    USER_ERROR_PASSWORD("密码错误"),
    USER_STOP("帐号已停用");

    private String stateInfo;

    AuthError(String stateInfo) {
        this.stateInfo = stateInfo;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public void setStateInfo(String stateInfo) {
        this.stateInfo = stateInfo;
    }

    @Override
    public String toString() {
        return this.stateInfo;
    }
}
