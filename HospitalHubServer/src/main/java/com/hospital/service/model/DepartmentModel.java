package com.hospital.service.model;

import java.util.List;

public class DepartmentModel {

    private Integer departmentId;
    //private Integer hospitalId;
    private String departmentName;
    private List<DoctorModel> doctorModelList;
    private List<Integer> workingIdList;
    private Integer capacity;
    private Integer remain;
    private Integer waiting;

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public List<DoctorModel> getDoctorModelList() {
        return doctorModelList;
    }

    public void setDoctorModelList(List<DoctorModel> doctorModelList) {
        this.doctorModelList = doctorModelList;
    }

    public List<Integer> getWorkingIdList() {
        return workingIdList;
    }

    public void setWorkingIdList(List<Integer> workingIdList) {
        this.workingIdList = workingIdList;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
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
