package com.hospital.controller;

import com.hospital.dao.dataobject.HospitalDO;
import com.hospital.response.CommonReturnType;
import com.hospital.service.HospitalService;
import com.hospital.service.model.DepartmentModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(allowCredentials = "true", allowedHeaders = "*")
@RequestMapping("/hospital")
@Controller
public class HospitalController {

    @Autowired
    private HospitalService hospitalService;

    @GetMapping("/list")
    @ResponseBody
    public CommonReturnType getHospitalList(){
        List<HospitalDO> hospitalList = hospitalService.getHospitalList();
        return CommonReturnType.create("hospital", hospitalList);
    }

    @GetMapping("/detail")
    @ResponseBody
    public CommonReturnType getHospitalDetail(@RequestParam(name = "hospitalId") Integer hospitalId){
        List<Integer> departmentIdList = hospitalService.getDepartmentIdList(hospitalId);
        List<DepartmentModel> departmentModelList = hospitalService.getDepartmentList(departmentIdList);
        return CommonReturnType.create("hospital", departmentIdList);
    }



}
