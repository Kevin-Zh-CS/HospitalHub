package com.hospital.service.model;

import java.util.List;

public class DepartmentModel {

    private Integer departmentId;
    //private Integer hospitalId;
    private String departmentName;
    private List<DoctorModel> doctorModelList;
    private List<Integer> workingIdList;
    private Integer departmentCapacity;
    private Integer departmentRemain;
    private Integer departmentWaiting;

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
