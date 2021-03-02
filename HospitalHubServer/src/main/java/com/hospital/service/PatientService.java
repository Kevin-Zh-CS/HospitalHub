package com.hospital.service;

import com.hospital.service.model.UserModel;

public interface PatientService {
    void register(UserModel userModel, Integer doctorId);
}
