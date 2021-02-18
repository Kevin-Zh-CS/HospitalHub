package com.hospital.service.impl;

import com.hospital.dao.HospitalDOMapper;
import com.hospital.dao.dataobject.HospitalDO;
import com.hospital.service.HospitalService;
import com.hospital.service.model.DepartmentModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class HospitalServiceImpl implements HospitalService {

    @Autowired
    private HospitalDOMapper hospitalDOMapper;

    @Override
    public List<HospitalDO> getHospitalList() {
        return hospitalDOMapper.getHospitalList();
    }

    @Override
    public List<Integer> getDepartmentIdList(Integer hospitalId) {
        return hospitalDOMapper.getDepartmentIdList(hospitalId);
    }

    @Override
    public List<DepartmentModel> getDepartmentList(List<Integer> departmentIdList) {
        List<DepartmentModel> departmentModelList = departmentIdList.stream().map(departmentId->{
            DepartmentModel departmentModel = new DepartmentModel();


            return departmentModel;
        }).collect(Collectors.toList());
        return departmentModelList;
    }
}
