package com.upingwang.pojo;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import java.util.Date;

public class SystemSchool {

    //教育局名称

    private String bureauName;



    private Long id;

    @NotNull(message = "教育局为空")
    private Long bureauId;


    private String schoolCode;

    @NotBlank(message = "学校名称为空")
    private String schoolName;

    @NotBlank(message = "学校地址为空")
    private String schoolAddress;

    @NotBlank(message = "学校LOGO为空")
    private String schoolLogo;

    @NotBlank(message = "学校联系人为空")
    private String schoolLinkman;

    @NotBlank(message = "学校联系方式为空")
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

    public String getBureauName() {
        return bureauName;
    }

    public void setBureauName(String bureauName) {
        this.bureauName = bureauName;
    }
}