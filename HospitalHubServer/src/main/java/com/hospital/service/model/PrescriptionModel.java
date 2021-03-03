package com.hospital.service.model;

import com.hospital.dao.dataobject.MedicineDO;

import java.util.Date;
import java.util.List;

public class PrescriptionModel {
    private Integer prescriptionId;
    private String registrationId;
    //private Integer patientId;
    private String patientName;
    //private Integer doctorId;
    private String doctorName;

    private Date prescriptionTime;
    private String prescriptionDetail;
    private String status;

    //private List<Integer> medicineList;
    private List<MedicineDO> medicineDOList;
    private Double totalPrice;

    public Integer getPrescriptionId() {
        return prescriptionId;
    }

    public void setPrescriptionId(Integer prescriptionId) {
        this.prescriptionId = prescriptionId;
    }

    public String getRegistrationId() {
        return registrationId;
    }

    public void setRegistrationId(String registrationId) {
        this.registrationId = registrationId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public Date getPrescriptionTime() {
        return prescriptionTime;
    }

    public void setPrescriptionTime(Date prescriptionTime) {
        this.prescriptionTime = prescriptionTime;
    }

    public String getPrescriptionDetail() {
        return prescriptionDetail;
    }

    public void setPrescriptionDetail(String prescriptionDetail) {
        this.prescriptionDetail = prescriptionDetail;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<MedicineDO> getMedicineDOList() {
        return medicineDOList;
    }

    public void setMedicineDOList(List<MedicineDO> medicineDOList) {
        this.medicineDOList = medicineDOList;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
