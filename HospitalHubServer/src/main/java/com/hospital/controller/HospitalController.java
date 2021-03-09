package com.hospital.controller;

import com.hospital.dao.dataobject.HospitalDO;
import com.hospital.error.BusinessError;
import com.hospital.error.BusinessException;
import com.hospital.response.CommonReturnType;
import com.hospital.service.HospitalService;
import com.hospital.service.model.DepartmentModel;
import com.hospital.service.model.HospitalModel;
import com.hospital.service.model.UserModel;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@CrossOrigin(allowCredentials = "true", allowedHeaders = "*")
@RequestMapping("/hospital")
@Controller
public class HospitalController {

    @Autowired
    private HospitalService hospitalService;

    @Autowired
    private RedisTemplate redisTemplate;

    @PostMapping(value = "/list", consumes = {CommonReturnType.CONTENT_TYPE_FROMED})
    @ResponseBody
    public CommonReturnType getHospitalList(@RequestParam(name = "token") String token) throws BusinessException {
        System.out.println(token);
        if(StringUtils.isEmpty(token)){
            List<HospitalDO> hospitalList = hospitalService.getHospitalList();
            List<HospitalModel> hospitalModelList = hospitalList.stream().map(hospitalDO -> {
                HospitalModel hospitalModel = new HospitalModel();
                BeanUtils.copyProperties(hospitalDO, hospitalModel);
                hospitalModel.setDistance(0.00);
                return hospitalModel;
            }).collect(Collectors.toList());
            return CommonReturnType.create("hospital", hospitalModelList);
        }
        UserModel userModel = (UserModel) redisTemplate.opsForValue().get(token);
        if(userModel == null){
            throw new BusinessException(BusinessError.USER_NOT_LOGIN);
        }
        List<HospitalModel> hospitalModelList = hospitalService.getHospitalModelList(userModel);
        //按照距离远近排起来
        Collections.sort(hospitalModelList);
        return CommonReturnType.create("hospital", hospitalModelList);
    }




    @GetMapping("/detail")
    @ResponseBody
    public CommonReturnType getHospitalDetail(@RequestParam(name = "hospitalId") Integer hospitalId){
        //List<Integer> departmentIdList = hospitalService.getDepartmentIdList(hospitalId);
        List<DepartmentModel> departmentModelList = hospitalService.getDepartmentList(hospitalId);
        return CommonReturnType.create("hospital", departmentModelList);
    }


}
