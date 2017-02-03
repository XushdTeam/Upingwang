package com.upingwang.common.enums;

/**
 * 前台交互结果枚举
 * Created by Administrator on 2017/1/29 0029.
 */
public enum OperateEnum {
    SUCCESS(200,"操作成功"),
    FAILE(500,"操作失败"),
    ROLE_IS_USED(500,"角色下有用户存在"),
    USER_PHONE_EXIST(500,"该手机号已经注册"),
    FILE_SIZE(500,"文件太大"),
    FILE_EMPTY(500,"文件为空"),
    PASS_NOT_EQUAIL(500,"两次密码不一致"),
    PASS_ERROR(500,"原密码错误"),
    SB(500,"你是东方不败么？");

    private int state;

    private String stateInfo;

    OperateEnum(int state, String stateInfo) {
        this.state = state;
        this.stateInfo = stateInfo;
    }

    public int getState() {
        return state;
    }

    public String getStateInfo() {
        return stateInfo;
    }
}
