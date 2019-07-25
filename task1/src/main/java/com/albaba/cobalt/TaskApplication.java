package com.albaba.cobalt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = { "com.albaba.cobalt"})
public class TaskApplication
{
    public static void main(String[] args) {
        SpringApplication.run(UtilApplication.class, args);
    }
}
