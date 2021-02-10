package com.hospital.service.impl;

import com.hospital.dao.HospitalDOMapper;
import com.hospital.dao.dataobject.HospitalDO;
import com.hospital.service.HospitalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HospitalServiceImpl implements HospitalService {

    @Autowired
    private HospitalDOMapper hospitalDOMapper;

    @Override
    public List<HospitalDO> getHospitalList() {
        return hospitalDOMapper.getHospitalList();
    }
}
