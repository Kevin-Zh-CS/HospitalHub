package com.hospital.controller;

import com.hospital.controller.view.DoctorView;
import com.hospital.error.BusinessException;
import com.hospital.response.CommonReturnType;
import com.hospital.service.DoctorService;
import com.hospital.service.model.DoctorModel;
import com.hospital.service.model.RegistrationModel;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@CrossOrigin(allowCredentials = "true", allowedHeaders = "*")
@RequestMapping("/doctor")
@Controller
public class DoctorController {

    @Autowired
    private DoctorService doctorService;

    @GetMapping("/detail")
    @ResponseBody
    public CommonReturnType getDetail(@RequestParam(name = "id") Integer id) throws BusinessException {
        DoctorView doctorView = new DoctorView();
        DoctorModel doctorModel = doctorService.getDoctorDetail(id);
        BeanUtils.copyProperties(doctorModel, doctorView);
        return CommonReturnType.create("doctor", doctorView);
    }

    @GetMapping("/registration/list")
    @ResponseBody
    public CommonReturnType getRegistrationList(@RequestParam(name = "doctorId") Integer doctorId,
                                                @RequestParam(name = "date")
                                                @DateTimeFormat(pattern = "yyyy-MM-dd") Date time){
        List<RegistrationModel> registrationModelList = doctorService.getRegistrationList(doctorId, time);
        return CommonReturnType.create("doctor", registrationModelList);
    }
}
