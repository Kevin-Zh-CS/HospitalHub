package com.hospital.controller;

import com.alibaba.druid.util.StringUtils;
import com.hospital.dao.dataobject.PrescriptionDO;
import com.hospital.dao.dataobject.UserDO;
import com.hospital.error.BusinessError;
import com.hospital.error.BusinessException;
import com.hospital.response.CommonReturnType;
import com.hospital.service.UserService;
import com.hospital.service.model.PatientModel;
import com.hospital.service.model.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@CrossOrigin(allowCredentials = "true", allowedHeaders = "*")
@Controller
public class UserController {

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/test")
    @ResponseBody
    public CommonReturnType testConnection(){
        return CommonReturnType.create("doctor", "yes");
    }

    @PostMapping(value = "/login", consumes = CommonReturnType.CONTENT_TYPE_FROMED)
    @ResponseBody
    public CommonReturnType login(@RequestParam(name = "accountId") String accountId,
                                  @RequestParam(name = "encodedPassword") String encodedPassword) throws BusinessException, NoSuchAlgorithmException {
        if (StringUtils.isEmpty(encodedPassword) || StringUtils.isEmpty(accountId)) {
            throw new BusinessException(BusinessError.PARAMETER_VALIDATION_ERROR);
        }

        //用户登录服务，用来校验用户登录是否合法
        UserModel userModel = userService.validateLogin(accountId, encodedPassword);

        //将登录凭证加入到用户登录成功的session内,然后存入redis中
        //之后取出用户信息，从这里取
        //生成登录凭证token,UUID
        String uuidToken = UUID.randomUUID().toString().replaceAll("-","");

        //建立token和用户登陆状态之间的联系
        redisTemplate.opsForValue().set(uuidToken, userModel);
        redisTemplate.expire(uuidToken, 1, TimeUnit.HOURS);
        return CommonReturnType.create(userModel.getTag(), uuidToken);
    }


    //用户注册接口
    @PostMapping(value = "/register", consumes = {CommonReturnType.CONTENT_TYPE_FROMED})
    @ResponseBody
    public CommonReturnType register(@RequestParam(name = "telephone") String telephone,
                                     @RequestParam(name = "trueName") String trueName,
                                     @RequestParam(name = "gender") String gender,
                                     @RequestParam(name = "age") Integer age,
                                     @RequestParam(name = "email") String email,
                                     @RequestParam(name = "history") String history,
                                     @RequestParam(name = "patientAddress") String patientAddress,
                                     @RequestParam(name = "password") String password,
                                     @RequestParam(name = "repeatPassword") String repeatPassword) throws BusinessException {

        if(!password.equals(repeatPassword)){
            throw new BusinessException(BusinessError.USER_PASSWORD_NOT_CONSISTENT);
        }
    /*
    邮箱格式验证
     */
        if (!email.matches("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*")) {
            throw new BusinessException(BusinessError.USER_EMIAL_FORMAT_NOT_CORRECT);
        }

    /*
    三大运营商号码均可验证(不含卫星通信1349)
    中国电信号段
        133,149,153,173,177,180,181,189,199
    中国联通号段
        130,131,132,145,155,156,166,175,176,185,186
    中国移动号段
        134(0-8),135,136,137,138,139,147,150,151,152,157,158,159,178,182,183,184,187,188,198
    其他号段
        14号段以前为上网卡专属号段，如中国联通的是145，中国移动的是147等等。
        虚拟运营商
            电信：1700,1701,1702
            移动：1703,1705,1706
            联通：1704,1707,1708,1709,171
        卫星通信：148(移动) 1349
    */
        if(!telephone.matches("^[1](([3][0-9])|([4][5,7,9])|([5][^4,6,9])|([6][6])|([7][3,5,6,7,8])|([8][0-9])|([9][8,9]))[0-9]{8}$")){
            throw new BusinessException(BusinessError.USER_PHONE_FORMAT_NOT_CORRECT);
        }

        List<PrescriptionDO> orderList = new ArrayList<>();
        PatientModel patientModel = new PatientModel(telephone, password, email, 0.00, CommonReturnType.DEFAULT_PORTRAIT_URL, orderList, CommonReturnType.PATIENT, trueName, gender, age, history, patientAddress);
        userService.register(patientModel);
        return null;
    }





    @GetMapping("/get")
    @ResponseBody
    public CommonReturnType getUser(@RequestParam(name = "id") Integer id) throws BusinessException{
//        UserModel userModel = userService.getUserById(id);
//        return CommonReturnType.create(userModel.getTag(), userModel);
        UserDO userDO = userService.getUserById(id);
        return CommonReturnType.create(userDO.getTag(), userDO);
    }


//    @GetMapping("/getOrders")
//    @ResponseBody
//    public CommonReturnType getOrders(@RequestParam(name = "id") Integer id) throws BusinessException{
//        userService.UpdateOrderListById(id);
//        return CommonReturnType.create("233", 1);
//    }



}
