package com.hospital.service;

import com.hospital.dao.dataobject.HospitalDO;
import com.hospital.service.model.DepartmentModel;

import java.util.List;

public interface HospitalService {
    List<HospitalDO> getHospitalList();

    List<Integer> getDepartmentIdList(Integer hospitalId);

    List<DepartmentModel> getDepartmentList(List<Integer> departmentIdList);
}
