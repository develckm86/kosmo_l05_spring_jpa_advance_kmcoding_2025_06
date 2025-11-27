package com.smu.l04_jpa_km_coding.service.impl;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class QnaServiceImpTest {
    @Autowired
    private QnaServiceImp qnaService;
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Test
    void getQanPosts() {
        Pageable pageable = PageRequest.of(0, 10);
        String field = "title";
        String search = "jwt";
        Page qnaPostPage =qnaService.getQanPosts(search, field, pageable);
        logger.info(qnaPostPage.getContent().toString());
    }
}