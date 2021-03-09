package com.hospital.service.impl;

import com.hospital.dao.*;
import com.hospital.dao.dataobject.*;
import com.hospital.error.BusinessError;
import com.hospital.error.BusinessException;
import com.hospital.service.PatientService;
import com.hospital.service.model.UserModel;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class PatientServiceImpl implements PatientService {
    @Autowired
    private UserDOMapper userDOMapper;

    @Autowired
    private DoctorDOMapper doctorDOMapper;

    @Autowired
    private PrescriptionDOMapper prescriptionDOMapper;

    @Autowired
    private RegistrationDOMapper registrationDOMapper;

    @Autowired
    private DepartmentDOMapper departmentDOMapper;

    @Override
    @Transactional
    public void register(UserModel userModel, Integer doctorId) throws ParseException {
        RegistrationDO registrationDO = new RegistrationDO();
        registrationDO.setPatientId(userModel.getUserId());
        registrationDO.setDoctorId(doctorId);
        DoctorDO doctorDO = doctorDOMapper.selectByPrimaryKey(doctorId);
        DepartmentDO departmentDO = departmentDOMapper.selectByPrimaryKey(doctorDO.getDepartmentId());
        doctorDO.setWaiting(doctorDO.getWaiting() + 1);
        departmentDO.setDepartmentWaiting(departmentDO.getDepartmentWaiting() + 1);
        registrationDO.setDepartmentId(doctorDO.getDepartmentId());
        registrationDO.setHospitalId(doctorDO.getHospitalId());
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        Date date = dateFormat.parse(dateFormat.format(new Date()));
        registrationDO.setRegistrationTime(date);// new Date()为获取当前系统时间

        //DONE: 挂号单单号的创建
        registrationDOMapper.insertSelective(registrationDO);
        doctorDOMapper.updateByPrimaryKeySelective(doctorDO);
        departmentDOMapper.updateByPrimaryKeySelective(departmentDO);


    }

    @Override
    @Transactional
    public void payOrder(UserModel userModel, Integer prescriptionId) throws BusinessException {
        PrescriptionDO prescriptionDO = prescriptionDOMapper.selectByPrimaryKey(prescriptionId);
        Double price = prescriptionDO.getTotalPrice();
        Double balance = userModel.getBalance();
        if(balance < price){
            throw new BusinessException(BusinessError.USER_NOT_ENOUGH_MONEY);
        }
        userModel.setBalance(balance - price);
        UserDO userDO = new UserDO();
        BeanUtils.copyProperties(userModel, userDO);
        userDOMapper.updateByPrimaryKeySelective(userDO);
        prescriptionDO.setStatus("paid");
        prescriptionDOMapper.updateByPrimaryKeySelective(prescriptionDO);
    }
}
