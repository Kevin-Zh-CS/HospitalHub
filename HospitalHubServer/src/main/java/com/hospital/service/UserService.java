package com.hospital.service;

import com.hospital.error.BusinessException;
import com.hospital.service.model.UserModel;

public interface UserService {
    UserModel getUserById(Integer id);
    void register(UserModel userModel) throws BusinessException;
    UserModel validateLogin(String accountId, String encodedPassword) throws BusinessException;
}
