package com.hospital.dao.dataobject;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class DoctorDO {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column doctor.user_id
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    private Integer userId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column doctor.department_id
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    private Integer departmentId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column doctor.major
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    private String major;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column doctor.hospital_id
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    private Integer hospitalId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column doctor.experience
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    private String experience;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column doctor.education
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    private String education;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column doctor.arrangement
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    private List<Date> arrangement;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column doctor.score
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    private BigDecimal score;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column doctor.comment_id
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    private List<Integer> commentId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column doctor.on_duty
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    private Boolean onDuty;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column doctor.type
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    private String type;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column doctor.capacity
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    private Integer capacity;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column doctor.finish
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    private Integer finish;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column doctor.user_id
     *
     * @return the value of doctor.user_id
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column doctor.user_id
     *
     * @param userId the value for doctor.user_id
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column doctor.department_id
     *
     * @return the value of doctor.department_id
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public Integer getDepartmentId() {
        return departmentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column doctor.department_id
     *
     * @param departmentId the value for doctor.department_id
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column doctor.major
     *
     * @return the value of doctor.major
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public String getMajor() {
        return major;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column doctor.major
     *
     * @param major the value for doctor.major
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public void setMajor(String major) {
        this.major = major == null ? null : major.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column doctor.hospital_id
     *
     * @return the value of doctor.hospital_id
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public Integer getHospitalId() {
        return hospitalId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column doctor.hospital_id
     *
     * @param hospitalId the value for doctor.hospital_id
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public void setHospitalId(Integer hospitalId) {
        this.hospitalId = hospitalId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column doctor.experience
     *
     * @return the value of doctor.experience
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public String getExperience() {
        return experience;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column doctor.experience
     *
     * @param experience the value for doctor.experience
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public void setExperience(String experience) {
        this.experience = experience == null ? null : experience.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column doctor.education
     *
     * @return the value of doctor.education
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public String getEducation() {
        return education;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column doctor.education
     *
     * @param education the value for doctor.education
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public void setEducation(String education) {
        this.education = education == null ? null : education.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column doctor.arrangement
     *
     * @return the value of doctor.arrangement
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public List<Date> getArrangement() {
        return arrangement;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column doctor.arrangement
     *
     * @param arrangement the value for doctor.arrangement
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public void setArrangement(List<Date> arrangement) {
        this.arrangement = arrangement;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column doctor.score
     *
     * @return the value of doctor.score
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public BigDecimal getScore() {
        return score;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column doctor.score
     *
     * @param score the value for doctor.score
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public void setScore(BigDecimal score) {
        this.score = score;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column doctor.comment_id
     *
     * @return the value of doctor.comment_id
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public List<Integer> getCommentId() {
        return commentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column doctor.comment_id
     *
     * @param commentId the value for doctor.comment_id
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public void setCommentId(List<Integer> commentId) {
        this.commentId = commentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column doctor.on_duty
     *
     * @return the value of doctor.on_duty
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public Boolean getOnDuty() {
        return onDuty;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column doctor.on_duty
     *
     * @param onDuty the value for doctor.on_duty
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public void setOnDuty(Boolean onDuty) {
        this.onDuty = onDuty;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column doctor.type
     *
     * @return the value of doctor.type
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public String getType() {
        return type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column doctor.type
     *
     * @param type the value for doctor.type
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column doctor.capacity
     *
     * @return the value of doctor.capacity
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public Integer getCapacity() {
        return capacity;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column doctor.capacity
     *
     * @param capacity the value for doctor.capacity
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column doctor.finish
     *
     * @return the value of doctor.finish
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public Integer getFinish() {
        return finish;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column doctor.finish
     *
     * @param finish the value for doctor.finish
     *
     * @mbg.generated Wed Feb 10 16:22:23 CST 2021
     */
    public void setFinish(Integer finish) {
        this.finish = finish;
    }
}