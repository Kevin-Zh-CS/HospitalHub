package com.hospital.service.model;

import com.hospital.dao.dataobject.PrescriptionDO;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

public class UserModel implements Serializable {
    private Integer userId;

    @NotBlank(message = "手机号不能为空")
    private String username;

    @NotBlank(message = "密码不能为空")
    private String password;

    @NotBlank(message = "邮箱不能为空")
    private String email;

    private Double balance;
    private String portraitUrl;
    private String tag;

    @NotBlank(message = "请填写真实姓名")
    private String trueName;

    @NotNull(message = "性别不能为空")
    private String gender;

    @NotNull(message = "年龄不能为空")
    @Min(value = 0, message = "年龄必须大于0")
    @Max(value = 120, message = "年龄必须小于120")
    private Integer age;

    public UserModel() {
    }

    public UserModel(String username, String password, String email, Double balance, String portraitUrl, String tag, String trueName, String gender, Integer age) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.balance = balance;
        this.portraitUrl = portraitUrl;
        this.tag = tag;
        this.trueName = trueName;
        this.gender = gender;
        this.age = age;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public String getPortraitUrl() {
        return portraitUrl;
    }

    public void setPortraitUrl(String portraitUrl) {
        this.portraitUrl = portraitUrl;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}
