package com.smu.l04_jpa_km_coding;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@EnableCaching //캐시사용
@SpringBootApplication
public class L04JpaKmCodingApplication {

    public static void main(String[] args) {
        SpringApplication.run(L04JpaKmCodingApplication.class, args);
    }

}
