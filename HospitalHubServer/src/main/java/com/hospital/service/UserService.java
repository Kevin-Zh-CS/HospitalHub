package com.hospital.service;

import com.hospital.dao.dataobject.UserDO;
import com.hospital.error.BusinessException;
import com.hospital.service.model.PatientModel;
import com.hospital.service.model.PrescriptionModel;
import com.hospital.service.model.RegistrationModel;
import com.hospital.service.model.UserModel;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface UserService {

    void uploadImg(MultipartFile file, Integer id, HttpServletRequest request);
    UserDO getUserById(Integer id) throws BusinessException;
//    void UpdateOrderListById(Integer id) throws BusinessException;
    void register(PatientModel patientModel) throws BusinessException;
    UserModel validateLogin(String accountId, String encodedPassword) throws BusinessException;
    UserDO getUserByAccountId(String accountId);
    void changePassword(UserModel userModel);
    List<PrescriptionModel> getPrescriptionList(Integer userId);
    List<RegistrationModel> getRegistrationModelList(Integer userId);
}
