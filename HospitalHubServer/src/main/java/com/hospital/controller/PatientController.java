package com.hospital.controller;

import com.hospital.response.CommonReturnType;
import com.hospital.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
                                     @RequestParam(name = "doctorId") Integer doctorId){

        //挂号业务：working+1, department_working+1,
        return CommonReturnType.create("patient", "挂号成功");
    }

}
