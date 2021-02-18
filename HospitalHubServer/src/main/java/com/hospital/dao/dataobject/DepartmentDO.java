package com.hospital.dao.dataobject;

import java.util.List;

public class DepartmentDO {

    private Integer departmentId;
    private Integer hospitalId;
    private String departmentName;
    private List<Integer> doctorIdList;

    private Integer remain;
    private Integer waiting;

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public Integer getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(Integer hospitalId) {
        this.hospitalId = hospitalId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName == null ? null : departmentName.trim();
    }

    public List<Integer> getDoctorIdList() {
        return doctorIdList;
    }

    public void setDoctorIdList(List<Integer> doctorIdList) {
        this.doctorIdList = doctorIdList;
    }

    public Integer getRemain() {
        return remain;
    }

    public void setRemain(Integer remain) {
        this.remain = remain;
    }

    public Integer getWaiting() {
        return waiting;
    }

    public void setWaiting(Integer waiting) {
        this.waiting = waiting;
    }
}