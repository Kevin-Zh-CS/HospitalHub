package com.hospital.dao.dataobject;

import java.util.List;

public class HospitalDO {

    private Integer hospitalId;
    private String hospitalUrl;
    private String hospitalName;
    private String hospitalAddress;
    private List<Integer> departmentIdList;

    public String getHospitalUrl() {
        return hospitalUrl;
    }

    public void setHospitalUrl(String hospitalUrl) {
        this.hospitalUrl = hospitalUrl;
    }

    public Integer getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(Integer hospitalId) {
        this.hospitalId = hospitalId;
    }

    public String getHospitalName() {
        return hospitalName;
    }


    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName == null ? null : hospitalName.trim();
    }


    public String getHospitalAddress() {
        return hospitalAddress;
    }


    public void setHospitalAddress(String hospitalAddress) {
        this.hospitalAddress = hospitalAddress == null ? null : hospitalAddress.trim();
    }

    public List<Integer> getDepartmentIdList() {
        return departmentIdList;
    }


    public void setDepartmentIdList(List<Integer> departmentIdList) {
        this.departmentIdList = departmentIdList;
    }
}