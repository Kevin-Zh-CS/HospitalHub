package com.hospital.service.impl;

import com.hospital.config.UploadFileConfig;
import com.hospital.dao.*;
import com.hospital.dao.dataobject.*;
import com.hospital.error.BusinessError;
import com.hospital.error.BusinessException;
import com.hospital.service.UserService;
import com.hospital.service.model.PatientModel;
import com.hospital.service.model.PrescriptionModel;
import com.hospital.service.model.RegistrationModel;
import com.hospital.service.model.UserModel;
import com.hospital.validator.ValidationResult;
import com.hospital.validator.ValidatorImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDOMapper userDOMapper;

    @Autowired
    private PatientDOMapper patientDOMapper;

    @Autowired
    private PrescriptionDOMapper prescriptionDOMapper;

    @Autowired
    private MedicineDOMapper medicineDOMapper;

    @Autowired
    private RegistrationDOMapper registrationDOMapper;

    @Autowired
    private DepartmentDOMapper departmentDOMapper;

    @Autowired
    private HospitalDOMapper hospitalDOMapper;

    @Autowired
    private ValidatorImpl validator;

    @Autowired
    private UploadFileConfig fileConfig;

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
    public List<PrescriptionModel> getPrescriptionList(Integer userId) {
        List<PrescriptionDO> prescriptionDOList = prescriptionDOMapper.selectByUserId(userId);
        List<PrescriptionModel> prescriptionModelList = prescriptionDOList.stream().map(prescriptionDO -> {
            PrescriptionModel prescriptionModel = new PrescriptionModel();
            BeanUtils.copyProperties(prescriptionDO, prescriptionModel);
            prescriptionModel.setDoctorName(userDOMapper.selectByPrimaryKey(prescriptionDO.getDoctorId()).getTrueName());
            prescriptionModel.setPatientName(userDOMapper.selectByPrimaryKey(prescriptionDO.getPatientId()).getTrueName());
            List<MedicineDO> medicineDOList = prescriptionDO.getMedicineList().stream().map(medicineId -> medicineDOMapper.selectByPrimaryKey(medicineId)).collect(Collectors.toList());
            prescriptionModel.setMedicineDOList(medicineDOList);
            return prescriptionModel;
        }).collect(Collectors.toList());
        return prescriptionModelList;
    }

    @Override
    public List<RegistrationModel> getRegistrationModelList(Integer userId) {
        List<RegistrationDO> registrationDOList = registrationDOMapper.selectByUserId(userId);
        List<RegistrationModel> registrationModelList = registrationDOList.stream().map(registrationDO -> {
            RegistrationModel registrationModel = new RegistrationModel();
            BeanUtils.copyProperties(registrationDO, registrationModel);
            UserDO userDO = userDOMapper.selectByPrimaryKey(registrationDO.getPatientId());
            registrationModel.setTrueName(userDO.getTrueName());
            registrationModel.setAge(userDO.getAge());
            registrationModel.setGender(userDO.getGender());
            registrationModel.setDoctorName(userDOMapper.selectByPrimaryKey(registrationDO.getDoctorId()).getTrueName());
            registrationModel.setDepartmentName(departmentDOMapper.selectByPrimaryKey(registrationDO.getDepartmentId()).getDepartmentName());
            registrationModel.setHospitalName(hospitalDOMapper.selectByPrimaryKey(registrationDO.getHospitalId()).getHospitalName());
            return registrationModel;
        }).collect(Collectors.toList());
        return registrationModelList;
    }

    @Override
    public void uploadImg(MultipartFile file, Integer id, HttpServletRequest request) {
        //获取绝对路径
        String realPath = fileConfig.getFilePath();
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
//        String format = sdf.format(new Date());
        //文件存放的目录
        File folder = new File(realPath);
        if (!folder.isDirectory()) {
            folder.mkdirs();
        }
        String oldName = file.getOriginalFilename();
        //文件后缀
        assert oldName != null;
        String suffix = oldName.substring(oldName.lastIndexOf("."));
        //文件新名字
        String newName = UUID.randomUUID().toString().replaceAll("-","") + suffix;
        try {
            File targetFile = new File(folder, newName);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            } else {
                targetFile.delete();
            }
            file.transferTo(targetFile);
            //String filePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/uploadFile/" + newName;
            //把这个路径放进数据库里
            String filePath = "/usr/uploadFile/" + newName;
            UserDO userDO = userDOMapper.selectByPrimaryKey(id);
            userDO.setPortraitUrl(filePath);
            userDOMapper.updateByPrimaryKeySelective(userDO);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public UserDO getUserById(Integer id) throws BusinessException {
        return userDOMapper.selectByPrimaryKey(id);

    }

    @Override
    @Transactional
    public void register(PatientModel patientModel) throws BusinessException {
        ValidationResult result = validator.validate(patientModel);
        if (result.isHasErrors()) {
            throw new BusinessException(BusinessError.PARAMETER_VALIDATION_ERROR, result.getErrorMsg());
        }
        UserDO userDO = new UserDO();
        BeanUtils.copyProperties(patientModel, userDO);
        try {
            userDOMapper.insertSelective(userDO);
        } catch (DuplicateKeyException e) {
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
        if (userDO == null) {
            throw new BusinessException(BusinessError.USER_NOT_EXIST);
        }
        //比对密码
        if (!StringUtils.equals(encodedPassword, userDO.getPassword())) {
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
