package com.upingwang.pojo;

import java.util.Date;

public class SystemSchool {
    private Long id;

    private Long bureauId;

    private String schoolCode;

    private String schoolName;

    private String schoolAddress;

    private String schoolLogo;

    private String schoolLinkman;

    private String schoolLinkphone;

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

    public Long getBureauId() {
        return bureauId;
    }

    public void setBureauId(Long bureauId) {
        this.bureauId = bureauId;
    }

    public String getSchoolCode() {
        return schoolCode;
    }

    public void setSchoolCode(String schoolCode) {
        this.schoolCode = schoolCode == null ? null : schoolCode.trim();
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName == null ? null : schoolName.trim();
    }

    public String getSchoolAddress() {
        return schoolAddress;
    }

    public void setSchoolAddress(String schoolAddress) {
        this.schoolAddress = schoolAddress == null ? null : schoolAddress.trim();
    }

    public String getSchoolLogo() {
        return schoolLogo;
    }

    public void setSchoolLogo(String schoolLogo) {
        this.schoolLogo = schoolLogo == null ? null : schoolLogo.trim();
    }

    public String getSchoolLinkman() {
        return schoolLinkman;
    }

    public void setSchoolLinkman(String schoolLinkman) {
        this.schoolLinkman = schoolLinkman == null ? null : schoolLinkman.trim();
    }

    public String getSchoolLinkphone() {
        return schoolLinkphone;
    }

    public void setSchoolLinkphone(String schoolLinkphone) {
        this.schoolLinkphone = schoolLinkphone == null ? null : schoolLinkphone.trim();
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