package com.upingwang.common.enums;

/**
 * show
 *
 * @author Xushd
 * @since 2017/1/23 0023 下午 3:55
 */
public enum DicParentEnum {
    FUNCTION(1,"系统功能");

    private int state;

    private String stateInfo;

    DicParentEnum(int state, String stateInfo) {
        this.state = state;
        this.stateInfo = stateInfo;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateInfo() {
        return stateInfo;
    }


    public static String stateOf(int index){
        for (DicParentEnum state : values()) {
            if(state.getState()==index){
                return state.getStateInfo();
            }
        }
        return null;
    }


    public void setStateInfo(String stateInfo) {
        this.stateInfo = stateInfo;
    }
    @Override
    public String toString() {
        return "DicParentEnum{" +
                "stateInfo='" + stateInfo + '\'' +
                ", state=" + state +
                '}';
    }
}
