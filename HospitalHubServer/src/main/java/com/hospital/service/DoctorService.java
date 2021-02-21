package com.hospital.service;

import com.hospital.error.BusinessException;
import com.hospital.service.model.DoctorModel;
import com.hospital.service.model.RegistrationModel;

import java.util.Date;
import java.util.List;

public interface DoctorService {
    DoctorModel getDoctorDetail(Integer doctorId) throws BusinessException;

    List<RegistrationModel> getRegistrationList(Integer doctorId, Date time);
}
