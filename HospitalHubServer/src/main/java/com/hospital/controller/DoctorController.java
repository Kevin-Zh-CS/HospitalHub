package com.hospital.controller;

import com.hospital.controller.view.DoctorView;
import com.hospital.error.BusinessError;
import com.hospital.error.BusinessException;
import com.hospital.response.CommonReturnType;
import com.hospital.service.DoctorService;
import com.hospital.service.model.DoctorModel;
import com.hospital.service.model.RegistrationModel;
import com.hospital.service.model.UserModel;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@CrossOrigin(allowCredentials = "true", allowedHeaders = "*")
@RequestMapping("/doctor")
@Controller
public class DoctorController {

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private RedisTemplate redisTemplate;

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

    @PostMapping(value = "/update", consumes = {CommonReturnType.CONTENT_TYPE_FROMED})
    @ResponseBody
    public CommonReturnType updateDoctorDetail(@RequestParam(name = "token") String token,
                                               @RequestParam(name = "username", required = false) String username,
                                               @RequestParam(name = "email", required = false) String email,
                                               @RequestParam(name = "age", required = false) Integer  age,
                                               @RequestParam(name = "major", required = false) String major,
                                               @RequestParam(name = "experience", required = false) String experience,
                                               @RequestParam(name = "education", required = false) String education,
                                               @RequestParam(name = "capacity", required = false) Integer capacity,
                                               HttpServletRequest httpServletRequest) throws BusinessException {
        if(org.apache.commons.lang3.StringUtils.isEmpty(token)){
            throw new BusinessException(BusinessError.USER_NOT_LOGIN);
        }
        UserModel userModel = (UserModel) redisTemplate.opsForValue().get(token);
        if(userModel == null){
            throw new BusinessException(BusinessError.USER_NOT_LOGIN);
        }
        List<Boolean> arrangement = new ArrayList<>();
        for (int i = 0; i < 6; i++) {
            Boolean bool = Boolean.parseBoolean(httpServletRequest.getParameter("arrangement[" + i + "]"));
            arrangement.add(bool);
        }
        doctorService.updateDoctorDetail(userModel, username, email, age, major, experience, education, capacity, arrangement);
        return CommonReturnType.create("doctor", "医生信息更新成功");
    }
}
