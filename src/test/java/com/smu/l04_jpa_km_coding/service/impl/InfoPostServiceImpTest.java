package com.smu.l04_jpa_km_coding.service.impl;

import com.smu.l04_jpa_km_coding.bean.InfoPostSearchBean;
import com.smu.l04_jpa_km_coding.entity.InfoPost;
import com.smu.l04_jpa_km_coding.service.InfoPostService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class InfoPostServiceImpTest {
    @Autowired
    private InfoPostServiceImp infoPostService;
    @Test
    void searchSpec2() {
        InfoPostSearchBean infoPostSearchBean=new InfoPostSearchBean();
        infoPostSearchBean.setCategoryId("backend_jpa");
//        infoPostSearchBean.setEmail("km@");

        Page<InfoPost> infoPostPage =infoPostService.searchSpec2(infoPostSearchBean, PageRequest.of(0, 10));
        System.out.println(infoPostPage.getContent());
    }
}