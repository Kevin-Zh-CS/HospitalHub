package com.hospital.controller;

import com.alibaba.druid.util.StringUtils;
import com.hospital.error.BusinessError;
import com.hospital.error.BusinessException;
import com.hospital.response.CommonReturnType;
import com.hospital.service.UserService;
import com.hospital.service.model.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@CrossOrigin(allowCredentials = "true", allowedHeaders = "*")
@Controller("user")
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



}
