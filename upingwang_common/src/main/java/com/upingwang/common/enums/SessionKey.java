package com.upingwang.common.enums;

/**
 * show
 *
 * @author Xushd
 * @since 2017/1/19 0019 下午 6:09
 */
public enum SessionKey {
    VERIFYCODE_KEY("verifyCode"),
    USER_KEY("userInfo"),
    LOCK_KEY("isLock");



    private String stateInfo;

    SessionKey(String stateInfo) {
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
