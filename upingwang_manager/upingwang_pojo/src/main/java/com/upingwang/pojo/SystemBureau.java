package com.upingwang.pojo;

import org.hibernate.validator.constraints.NotBlank;

import java.util.Date;

public class SystemBureau {
    private Long id;

    @NotBlank(message = "教育局名称为空")
    private String bureauName;

    @NotBlank(message = "教育局区域为空")
    private String bureauArea;

    @NotBlank(message = "区域代码为空")
    private String bureauCode;

    private Integer status;

    private Integer delflag;

    private String createUser;

    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBureauName() {
        return bureauName;
    }

    public void setBureauName(String bureauName) {
        this.bureauName = bureauName == null ? null : bureauName.trim();
    }

    public String getBureauArea() {
        return bureauArea;
    }

    public void setBureauArea(String bureauArea) {
        this.bureauArea = bureauArea == null ? null : bureauArea.trim();
    }

    public String getBureauCode() {
        return bureauCode;
    }

    public void setBureauCode(String bureauCode) {
        this.bureauCode = bureauCode == null ? null : bureauCode.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getDelflag() {
        return delflag;
    }

    public void setDelflag(Integer delflag) {
        this.delflag = delflag;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser == null ? null : createUser.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}