package com.hospital.service.impl;

import com.hospital.dao.*;
import com.hospital.dao.dataobject.*;
import com.hospital.error.BusinessError;
import com.hospital.error.BusinessException;
import com.hospital.service.DoctorService;
import com.hospital.service.model.CommentModel;
import com.hospital.service.model.DoctorModel;
import com.hospital.service.model.RegistrationModel;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class DoctorServiceImpl implements DoctorService {

    @Autowired
    private UserDOMapper userDOMapper;

    @Autowired
    private DoctorDOMapper doctorDOMapper;

    @Autowired
    private DepartmentDOMapper departmentDOMapper;

    @Autowired
    private HospitalDOMapper hospitalDOMapper;

    @Autowired
    private CommentDOMapper commentDOMapper;

    @Autowired
    private PrescriptionDOMapper prescriptionDOMapper;

    @Autowired
    private RegistrationDOMapper registrationDOMapper;


    @Override
    public DoctorModel getDoctorDetail(Integer doctorId) throws BusinessException {
        DoctorModel doctorModel = new DoctorModel();
        UserDO userDO = userDOMapper.selectByPrimaryKey(doctorId);
        if(userDO == null){
            throw new BusinessException(BusinessError.USER_NOT_EXIST);
        }
        BeanUtils.copyProperties(userDO, doctorModel);
        DoctorDO doctorDO = doctorDOMapper.selectByPrimaryKey(doctorId);
        if(doctorDO == null){
            throw new BusinessException(BusinessError.USER_NOT_EXIST);
        }
        BeanUtils.copyProperties(doctorDO, doctorModel);

        doctorModel.setDepartmentName(departmentDOMapper.selectByPrimaryKey(doctorDO.getDepartmentId()).getDepartmentName());
        doctorModel.setHospitalName(hospitalDOMapper.selectByPrimaryKey(doctorDO.getHospitalId()).getHospitalName());
        List<CommentDO> commentDOList = commentDOMapper.selectByDoctorId(doctorId);
        List<CommentModel> commentModelList = commentDOList.stream().map(commentDO -> {
            CommentModel commentModel = new CommentModel();
            BeanUtils.copyProperties(commentDO, commentModel);
            UserDO patient = userDOMapper.selectByPrimaryKey(commentDO.getPatientId());
            commentModel.setPatientName(patient.getTrueName());
            commentModel.setPatientPortraitUrl(patient.getPortraitUrl());
            return commentModel;
        }).collect(Collectors.toList());
        doctorModel.setCommentDOList(commentModelList);
        doctorModel.setLeft(doctorDO.getWaiting() - doctorDO.getFinish());

        return doctorModel;
    }

    @Override
    public List<RegistrationModel> getRegistrationList(Integer doctorId, Date time) {
        List<RegistrationDO> registrationDOList = registrationDOMapper.selectByIdAndTime(doctorId, time);
        List<RegistrationModel> registrationModelList = registrationDOList.stream().map(registrationDO -> {
            RegistrationModel registrationModel = new RegistrationModel();
            UserDO userDO = userDOMapper.selectByPrimaryKey(registrationDO.getPatientId());

            registrationModel.setTrueName(userDO.getTrueName());
            registrationModel.setGender(userDO.getGender());
            registrationModel.setAge(userDO.getAge());

            registrationModel.setRegistrationId(registrationDO.getRegistrationId());
            registrationModel.setRegistrationTime(registrationDO.getRegistrationTime());
            registrationModel.setPatientId(registrationDO.getPatientId());

            registrationModel.setHospitalName(hospitalDOMapper.selectByPrimaryKey(registrationDO.getHospitalId()).getHospitalName());
            registrationModel.setDepartmentName(departmentDOMapper.selectByPrimaryKey(registrationDO.getDepartmentId()).getDepartmentName());
            registrationModel.setDoctorName(userDOMapper.selectByPrimaryKey(registrationDO.getDoctorId()).getTrueName());
            return registrationModel;
        }).collect(Collectors.toList());
        return registrationModelList;
    }


}
