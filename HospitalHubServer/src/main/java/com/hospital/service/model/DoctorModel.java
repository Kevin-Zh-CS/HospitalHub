package com.hospital.service.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class DoctorModel extends UserModel {

    private Integer userId;
    private Integer departmentId;
    private String major;
    private Integer hospitalId;
    private String experience;
    private String education;
    private List<Date> arrangement;
    private BigDecimal score;
    private List<Integer> commentId;
    private Boolean onDuty;
    private String type;
    private Integer capacity;
    private Integer finish;

    @Override
    public Integer getUserId() {
        return userId;
    }

    @Override
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public Integer getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(Integer hospitalId) {
        this.hospitalId = hospitalId;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public List<Date> getArrangement() {
        return arrangement;
    }

    public void setArrangement(List<Date> arrangement) {
        this.arrangement = arrangement;
    }

    public BigDecimal getScore() {
        return score;
    }

    public void setScore(BigDecimal score) {
        this.score = score;
    }

    public List<Integer> getCommentId() {
        return commentId;
    }

    public void setCommentId(List<Integer> commentId) {
        this.commentId = commentId;
    }

    public Boolean getOnDuty() {
        return onDuty;
    }

    public void setOnDuty(Boolean onDuty) {
        this.onDuty = onDuty;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public Integer getFinish() {
        return finish;
    }

    public void setFinish(Integer finish) {
        this.finish = finish;
    }
}
