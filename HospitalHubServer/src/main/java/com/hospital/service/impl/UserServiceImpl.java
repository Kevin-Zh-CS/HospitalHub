package com.hospital.service.impl;

import com.hospital.dao.PatientDOMapper;
import com.hospital.dao.UserDOMapper;
import com.hospital.dao.dataobject.PatientDO;
import com.hospital.dao.dataobject.UserDO;
import com.hospital.error.BusinessError;
import com.hospital.error.BusinessException;
import com.hospital.service.UserService;
import com.hospital.service.model.PatientModel;
import com.hospital.service.model.UserModel;
import com.hospital.validator.ValidationResult;
import com.hospital.validator.ValidatorImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDOMapper userDOMapper;

    @Autowired
    private PatientDOMapper patientDOMapper;

    @Autowired
    private ValidatorImpl validator;

//    @Override
//    public UserModel getUserById(Integer id) throws BusinessException {
//        UserDO userDO = userDOMapper.selectByPrimaryKey(id);
//        if(userDO == null){
//            throw new BusinessException(BusinessError.USER_NOT_EXIST);
//        }
//        return convertFromDOToModel(userDO);
//
//    }

    @Override
    public UserDO getUserById(Integer id) throws BusinessException {
        return userDOMapper.selectByPrimaryKey(id);

    }

    @Override
    @Transactional
    public void register(PatientModel patientModel) throws BusinessException {
        ValidationResult result = validator.validate(patientModel);
        if(result.isHasErrors()){
            throw new BusinessException(BusinessError.PARAMETER_VALIDATION_ERROR,result.getErrorMsg());
        }
        UserDO userDO = new UserDO();
        BeanUtils.copyProperties(patientModel, userDO);
        try {
            userDOMapper.insertSelective(userDO);
        }catch (DuplicateKeyException e){
            throw new BusinessException(BusinessError.PARAMETER_VALIDATION_ERROR, "手机号已重复注册");
        }
        patientModel.setUserId(userDO.getUserId());
        PatientDO patientDO = new PatientDO();
        BeanUtils.copyProperties(patientModel, patientDO);
        patientDOMapper.insertSelective(patientDO);
    }

    @Override
    public UserModel validateLogin(String accountId, String encodedPassword) throws BusinessException {
        UserDO userDO = userDOMapper.selectByAccountId(accountId);
        if(userDO == null){
            throw new BusinessException(BusinessError.USER_NOT_EXIST);
        }
        //比对密码
        if(!StringUtils.equals(encodedPassword, userDO.getPassword())){
            throw new BusinessException(BusinessError.USER_LOGIN_FAIL);
        }
        return convertFromDOToModel(userDO);
    }

    @Override
    public UserDO getUserByAccountId(String accountId) {
        return userDOMapper.selectByAccountId(accountId);
    }

    @Override
    public void changePassword(UserModel userModel) {
        UserDO userDO = convertFromModelToDO(userModel);
        userDOMapper.updateByPrimaryKeySelective(userDO);
    }

    private UserModel convertFromDOToModel(UserDO userDO) {
        if (userDO == null) {
            return null;
        }
        UserModel userModel = new UserModel();
        BeanUtils.copyProperties(userDO, userModel);
        return userModel;
    }

    private UserDO convertFromModelToDO(UserModel userModel) {
        if (userModel == null) {
            return null;
        }
        UserDO userDO = new UserDO();
        BeanUtils.copyProperties(userModel, userDO);
        return userDO;
    }

}