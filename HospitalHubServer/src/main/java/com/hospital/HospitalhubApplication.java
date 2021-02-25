package com.hospital;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication(scanBasePackages = {"com.hospital"})
@MapperScan("com.hospital.dao")
public class HospitalhubApplication {

    public static void main(String[] args) {
        SpringApplication.run(HospitalhubApplication.class, args);
    }

}
