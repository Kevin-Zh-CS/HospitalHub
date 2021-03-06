package com.hospital.service;

import com.hospital.error.BusinessException;
import com.hospital.service.model.DoctorModel;
import com.hospital.service.model.RegistrationModel;
import com.hospital.service.model.UserModel;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

public interface DoctorService {
    DoctorModel getDoctorDetail(Integer doctorId) throws BusinessException;

    List<RegistrationModel> getRegistrationList(Integer doctorId, Date time);

    void updateDoctorDetail(UserModel userModel, String username, String email, Integer age, String major, String experience, String education, Integer capacity, List<Boolean> arrangement);

    List<DoctorModel> getDoctorDetailList(Integer departmentId);


    void generateOrder(String prescriptionDetail, String registrationId, Integer[] medicineIdArray) throws ParseException;
}
