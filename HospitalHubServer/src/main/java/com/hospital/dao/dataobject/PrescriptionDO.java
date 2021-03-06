package com.hospital.dao.dataobject;

import java.util.Date;
import java.util.List;

public class PrescriptionDO {

    private Integer prescriptionId;
    private String registrationId;
    private Integer patientId;
    private Integer doctorId;
    private Date prescriptionTime;
    private String prescriptionDetail;
    private String status;
    private List<Integer> medicineList;
    private Double totalPrice;

    public List<Integer> getMedicineList() {
        return medicineList;
    }

    public void setMedicineList(List<Integer> medicineList) {
        this.medicineList = medicineList;
    }

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
        this.registrationId = registrationId == null ? null : registrationId.trim();
    }

    public Integer getPatientId() {
        return patientId;
    }


    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    public Integer getDoctorId() {
        return doctorId;
    }


    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
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
        this.prescriptionDetail = prescriptionDetail == null ? null : prescriptionDetail.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }


    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }
}