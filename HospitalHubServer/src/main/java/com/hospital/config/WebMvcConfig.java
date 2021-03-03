package com.hospital.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Resource
    UploadFileConfig uploadFileConfig;
    /*
    指定静态资源的映射。下面的意思是当我们访问/uploadFile/**的请求时，
    系统会把该请求映射到指定的文件目录。
    比如访问http://localhost:8080/uploadFile/**时，
    系统会到/usr/uploadFile/下去找相应的文件。
     */

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/uploadFile/**")
                .addResourceLocations("file:" +uploadFileConfig.getFilePath());
    }

}
