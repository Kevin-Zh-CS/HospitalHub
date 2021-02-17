package com.hospital.dao.dataobject;

import java.util.Date;

public class CommentDO {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column comment.comment_id
     *
     * @mbg.generated Sun Feb 07 00:41:20 CST 2021
     */
    private Integer commentId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column comment.patient_id
     *
     * @mbg.generated Sun Feb 07 00:41:20 CST 2021
     */
    private Integer patientId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column comment.doctor_id
     *
     * @mbg.generated Sun Feb 07 00:41:20 CST 2021
     */
    private Integer doctorId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column comment.content
     *
     * @mbg.generated Sun Feb 07 00:41:20 CST 2021
     */
    private String content;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column comment.publish_time
     *
     * @mbg.generated Sun Feb 07 00:41:20 CST 2021
     */
    private Date publishTime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column comment.comment_id
     *
     * @return the value of comment.comment_id
     *
     * @mbg.generated Sun Feb 07 00:41:20 CST 2021
     */
    public Integer getCommentId() {
        return commentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column comment.comment_id
     *
     * @param commentId the value for comment.comment_id
     *
     * @mbg.generated Sun Feb 07 00:41:20 CST 2021
     */
    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column comment.patient_id
     *
     * @return the value of comment.patient_id
     *
     * @mbg.generated Sun Feb 07 00:41:20 CST 2021
     */
    public Integer getPatientId() {
        return patientId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column comment.patient_id
     *
     * @param patientId the value for comment.patient_id
     *
     * @mbg.generated Sun Feb 07 00:41:20 CST 2021
     */
    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column comment.doctor_id
     *
     * @return the value of comment.doctor_id
     *
     * @mbg.generated Sun Feb 07 00:41:20 CST 2021
     */
    public Integer getDoctorId() {
        return doctorId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column comment.doctor_id
     *
     * @param doctorId the value for comment.doctor_id
     *
     * @mbg.generated Sun Feb 07 00:41:20 CST 2021
     */
    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column comment.content
     *
     * @return the value of comment.content
     *
     * @mbg.generated Sun Feb 07 00:41:20 CST 2021
     */
    public String getContent() {
        return content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column comment.content
     *
     * @param content the value for comment.content
     *
     * @mbg.generated Sun Feb 07 00:41:20 CST 2021
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column comment.publish_time
     *
     * @return the value of comment.publish_time
     *
     * @mbg.generated Sun Feb 07 00:41:20 CST 2021
     */
    public Date getPublishTime() {
        return publishTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column comment.publish_time
     *
     * @param publishTime the value for comment.publish_time
     *
     * @mbg.generated Sun Feb 07 00:41:20 CST 2021
     */
    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }
}