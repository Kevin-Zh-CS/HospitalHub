package com.hospital.service.impl;

import com.hospital.dao.UserDOMapper;
import com.hospital.dao.dataobject.UserDO;
import com.hospital.error.BusinessError;
import com.hospital.error.BusinessException;
import com.hospital.service.UserService;
import com.hospital.service.model.UserModel;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDOMapper userDOMapper;

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

//    @Override
//    public void UpdateOrderListById(Integer id) throws BusinessException {
//        UserDO userDO = userDOMapper.selectByPrimaryKey(id);
//        List<Integer> orderIdList = new ArrayList<>(userDO.getOrderIdList());
//        orderIdList.add(9);
//        System.out.println(orderIdList);
//        userDO.setOrderIdList(orderIdList);
//        userDOMapper.updateByPrimaryKey(userDO);
//    }

//    @Override
//    public List<Integer> getOrdersById(Integer userId) {
//        return userDOMapper.getOrdersById(userId);
//    }

    @Override
    public void register(UserModel userModel) throws BusinessException {

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

    private UserModel convertFromDOToModel(UserDO userDO) {
        if (userDO == null) {
            return null;
        }
        UserModel userModel = new UserModel();
        BeanUtils.copyProperties(userDO, userModel);
        return userModel;
    }

}
