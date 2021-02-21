package com.hospital.dao.dataobject;

import java.util.List;

public class ProcessDO {

    private String registrationId;
    private Integer doctorId;
    private List<String> description;
    private String accessoryName;
    private String accessoryUrl;
    private Boolean state;

    public String getRegistrationId() {
        return registrationId;
    }

    public void setRegistrationId(String registrationId) {
        this.registrationId = registrationId == null ? null : registrationId.trim();
    }


    public Integer getDoctorId() {
        return doctorId;
    }


    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }


    public List<String> getDescription() {
        return description;
    }

    public void setDescription(List<String> description) {
        this.description = description;
    }


    public String getAccessoryName() {
        return accessoryName;
    }


    public void setAccessoryName(String accessoryName) {
        this.accessoryName = accessoryName == null ? null : accessoryName.trim();
    }


    public String getAccessoryUrl() {
        return accessoryUrl;
    }


    public void setAccessoryUrl(String accessoryUrl) {
        this.accessoryUrl = accessoryUrl == null ? null : accessoryUrl.trim();
    }


    public Boolean getState() {
        return state;
    }


    public void setState(Boolean state) {
        this.state = state;
    }
}