package com.hospital.controller;

import com.hospital.response.CommonReturnType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@CrossOrigin(allowCredentials = "true", allowedHeaders = "*")
@Controller("user")
@RequestMapping("/user")
public class UserController {

    @RequestMapping(value = "/test")
    @ResponseBody
    public CommonReturnType testConnection(){
        return CommonReturnType.create("fuck you");
    }
}
