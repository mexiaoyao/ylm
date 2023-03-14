package com.java.ylm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.java.ylm.mapper")
public class YlmApplication {

    public static void main(String[] args) {
        SpringApplication.run(YlmApplication.class, args);
    }

}
