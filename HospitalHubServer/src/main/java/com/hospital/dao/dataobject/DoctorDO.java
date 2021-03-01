package com.hospital.dao.dataobject;

import java.math.BigDecimal;
import java.util.List;

public class DoctorDO {

    private Integer userId;
    private Integer departmentId;
    private String major;
    private Integer hospitalId;
    private String experience;
    private String education;
    private List<Boolean> arrangement;
    private BigDecimal score;
    private String type;
    private Integer capacity;
    private Integer finish;
    private Integer waiting;
    private Boolean onDuty;

    public Integer getWaiting() {
        return waiting;
    }

    public void setWaiting(Integer waiting) {
        this.waiting = waiting;
    }

    public Integer getUserId() {
        return userId;
    }


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
        this.major = major == null ? null : major.trim();
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
        this.experience = experience == null ? null : experience.trim();
    }


    public String getEducation() {
        return education;
    }


    public void setEducation(String education) {
        this.education = education == null ? null : education.trim();
    }


    public List<Boolean> getArrangement() {
        return arrangement;
    }


    public void setArrangement(List<Boolean> arrangement) {
        this.arrangement = arrangement;
    }


    public BigDecimal getScore() {
        return score;
    }


    public void setScore(BigDecimal score) {
        this.score = score;
    }


    public String getType() {
        return type;
    }


    public void setType(String type) {
        this.type = type == null ? null : type.trim();
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


    public Boolean getOnDuty() {
        return onDuty;
    }


    public void setOnDuty(Boolean onDuty) {
        this.onDuty = onDuty;
    }
}