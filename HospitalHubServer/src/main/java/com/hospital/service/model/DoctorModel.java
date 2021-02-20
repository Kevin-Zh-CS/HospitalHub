package com.hospital.service.model;

import com.hospital.dao.dataobject.CommentDO;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class DoctorModel extends UserModel {

    //private Integer departmentId;
    private String departmentName;
    private String major;
    //private Integer hospitalId;
    private String hospitalName;
    private String experience;
    private String education;
    private List<Date> arrangement;
    private BigDecimal score;
    //private List<Integer> commentId;
    private List<CommentDO> commentDOList;
    private Boolean onDuty;
    private String type;

    private Integer capacity;//此医生当天最多有多少个号

    //left = waiting - finish
    private Integer waiting;//此医生现在排了多少号，当天挂号则+1
    private Integer finish;//此医生当天看完了多少个号，当天订单完成则-1
    private Integer left;//此医生当天剩下多少个号

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
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

    public List<CommentDO> getCommentDOList() {
        return commentDOList;
    }

    public void setCommentDOList(List<CommentDO> commentDOList) {
        this.commentDOList = commentDOList;
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

    public Integer getWaiting() {
        return waiting;
    }

    public void setWaiting(Integer waiting) {
        this.waiting = waiting;
    }

    public Integer getFinish() {
        return finish;
    }

    public void setFinish(Integer finish) {
        this.finish = finish;
    }

    public Integer getLeft() {
        return left;
    }

    public void setLeft(Integer left) {
        this.left = left;
    }
}
