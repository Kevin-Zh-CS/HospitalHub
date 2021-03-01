package com.hospital.controller;

import com.hospital.error.BusinessError;
import com.hospital.error.BusinessException;
import com.hospital.response.CommonReturnType;
import com.hospital.service.PatientService;
import com.hospital.service.model.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

@CrossOrigin(allowCredentials = "true", allowedHeaders = "*")
@RequestMapping("/patient")
@Controller
public class PatientController {

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private PatientService patientService;


    @PostMapping(value = "/register", consumes = {CommonReturnType.CONTENT_TYPE_FROMED})
    @ResponseBody
    public CommonReturnType register(@RequestParam(name = "token") String token,
                                     @RequestParam(name = "doctorId") Integer doctorId) throws BusinessException {

        //挂号业务：working+1, department_working+1
        UserModel userModel = (UserModel) redisTemplate.opsForValue().get(token);
        if(userModel == null){
            throw new BusinessException(BusinessError.USER_NOT_LOGIN);
        }
        patientService.register(userModel, doctorId);


        return CommonReturnType.create("patient", "挂号成功");
    }



}
