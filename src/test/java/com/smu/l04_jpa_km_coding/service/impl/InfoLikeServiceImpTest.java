package com.smu.l04_jpa_km_coding.service.impl;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class InfoLikeServiceImpTest {
    @Autowired
    private InfoLikeServiceImp infoLikeService;
    @Test

    void toggleInfoPost() {
        System.out.println(infoLikeService.toggleInfoPost(1L,1L));
        System.out.println(infoLikeService.toggleInfoPost(1L,1L));

    }
}