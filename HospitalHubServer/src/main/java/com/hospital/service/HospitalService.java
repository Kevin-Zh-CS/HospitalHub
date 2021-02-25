package com.hospital.service;

import com.hospital.dao.dataobject.HospitalDO;
import com.hospital.service.model.DepartmentModel;
import com.hospital.service.model.HospitalModel;
import com.hospital.service.model.UserModel;

import java.util.List;

public interface HospitalService {
    List<HospitalDO> getHospitalList();

    List<DepartmentModel> getDepartmentList(Integer hospitalId);

    List<HospitalModel> getHospitalModelList(UserModel userModel);
}
