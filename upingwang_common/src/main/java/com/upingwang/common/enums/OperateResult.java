package com.upingwang.common.enums;

/**
 * show 操作结果枚举
 *
 * @author Xushd
 * @since 2017/1/22 0022 下午 6:55
 */
public enum OperateResult {
    OPERATE_SUCCESS(200,"操作成功"),
    OPERATE_FAILE(500,"操作失败");

    private String stateInfo;

    private int state;

    OperateResult(int state,String stateInfo) {
        this.stateInfo = stateInfo;
        this.state = state;
    }

    public int getState() {
        return state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    @Override
    public String toString() {
        return stateInfo;
    }
}
