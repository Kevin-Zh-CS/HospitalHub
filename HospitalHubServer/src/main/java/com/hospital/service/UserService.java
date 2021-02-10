package com.hospital.service;

import com.hospital.dao.dataobject.UserDO;
import com.hospital.error.BusinessException;
import com.hospital.service.model.UserModel;


public interface UserService {
    UserDO getUserById(Integer id) throws BusinessException;
//    void UpdateOrderListById(Integer id) throws BusinessException;
    void register(UserModel userModel) throws BusinessException;
    UserModel validateLogin(String accountId, String encodedPassword) throws BusinessException;
}
