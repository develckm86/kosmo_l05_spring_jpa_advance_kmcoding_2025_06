package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.InfoPost;
import com.smu.l04_jpa_km_coding.entity.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;


import java.time.LocalDateTime;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class InfoRepositoryTest {
    @Autowired
    private InfoRepository infoRepository;
    @Transactional
    @Test
    void findAll() {
        Pageable pageable = PageRequest.of(0, 10);
        Page infoPage = infoRepository.findAll(pageable);
        List<InfoPost> content = infoPage.getContent();
        System.out.println(content);
    }
    @Test
    void save(){
        InfoPost infoPost=new InfoPost();
        infoPost.setTitle("test");
        infoPost.setContent("test");
//        Member member=new Member();
//        member.setId(1L);
//        infoPost.setMember(member);'
        infoPost.setMemberId(1L);
        //infoPost.setCreatedAt(LocalDateTime.now());
        //infoPost.setUpdatedAt(LocalDateTime.now());
        infoPost.setCategoryId("backend_springboot");
        InfoPost save =infoRepository.save(infoPost);
        System.out.println(save);
    }

    @Test
    void findByTitleContainingAndContentContaining() {
        Pageable pageable = PageRequest.of(0, 10);
        Page infoPage = infoRepository.findByTitleContainingAndContentContaining("test", "", pageable);
        List<InfoPost> content = infoPage.getContent();
        System.out.println(content);
    }

    @Test
    @Transactional
    void search() {
        Pageable pageable = PageRequest.of(0, 10);
        Page infoPage = infoRepository.search("","spring","2025-11", pageable);
        List<InfoPost> content = infoPage.getContent();
        System.out.println(content);
    }
}