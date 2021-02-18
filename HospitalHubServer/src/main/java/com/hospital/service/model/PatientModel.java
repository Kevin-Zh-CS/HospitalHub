package com.hospital.service.model;

import com.hospital.dao.dataobject.PrescriptionDO;

import java.util.List;

public class PatientModel extends UserModel {
    private String history;
    private String patientAddress;

    public PatientModel(){}

    public PatientModel(String username, String password, String email, Double balance, String portraitUrl, List<PrescriptionDO> orderList, String tag, String trueName, String gender, Integer age, String history, String patientAddress) {
        super(username, password, email, balance, portraitUrl, orderList, tag, trueName, gender, age);
        this.history = history;
        this.patientAddress = patientAddress;
    }


    public String getHistory() {
        return history;
    }

    public void setHistory(String history) {
        this.history = history;
    }

    public String getPatientAddress() {
        return patientAddress;
    }

    public void setPatientAddress(String patientAddress) {
        this.patientAddress = patientAddress;
    }
}
