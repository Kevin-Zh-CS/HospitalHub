package com.hospital.service.model;

import java.util.Date;

public class CommentModel {
    private Integer commentId;
    //private Integer patientId;
    private String patientName;
    private String patientPortraitUrl;
    //private Integer doctorId;
    private String content;
    private Date publishTime;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getPatientPortraitUrl() {
        return patientPortraitUrl;
    }

    public void setPatientPortraitUrl(String patientPortraitUrl) {
        this.patientPortraitUrl = patientPortraitUrl;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }
}
