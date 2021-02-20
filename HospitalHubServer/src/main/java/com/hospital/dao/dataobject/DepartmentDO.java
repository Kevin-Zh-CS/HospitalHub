package com.hospital.dao.dataobject;

import java.util.List;

public class DepartmentDO {

    private Integer departmentId;
    private Integer hospitalId;
    private String departmentName;
    private List<Integer> doctorIdList;
    private Integer departmentCapacity;
    private Integer departmentRemain;
    private Integer departmentWaiting;

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
        this.departmentName = departmentName;
    }

    public List<Integer> getDoctorIdList() {
        return doctorIdList;
    }

    public void setDoctorIdList(List<Integer> doctorIdList) {
        this.doctorIdList = doctorIdList;
    }

    public Integer getDepartmentCapacity() {
        return departmentCapacity;
    }

    public void setDepartmentCapacity(Integer departmentCapacity) {
        this.departmentCapacity = departmentCapacity;
    }

    public Integer getDepartmentRemain() {
        return departmentRemain;
    }

    public void setDepartmentRemain(Integer departmentRemain) {
        this.departmentRemain = departmentRemain;
    }

    public Integer getDepartmentWaiting() {
        return departmentWaiting;
    }

    public void setDepartmentWaiting(Integer departmentWaiting) {
        this.departmentWaiting = departmentWaiting;
    }
}