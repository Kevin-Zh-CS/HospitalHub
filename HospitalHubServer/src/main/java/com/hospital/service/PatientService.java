package com.hospital.service;

import com.hospital.error.BusinessException;
import com.hospital.service.model.UserModel;

import java.text.ParseException;

public interface PatientService {
    void register(UserModel userModel, Integer doctorId) throws ParseException;

    void payOrder(UserModel userModel, Integer prescriptionId) throws BusinessException;
}
