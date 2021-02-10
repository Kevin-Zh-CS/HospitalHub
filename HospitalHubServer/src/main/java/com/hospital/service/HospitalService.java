package com.hospital.service;

import com.hospital.dao.dataobject.HospitalDO;

import java.util.List;

public interface HospitalService {
    List<HospitalDO> getHospitalList();

}
