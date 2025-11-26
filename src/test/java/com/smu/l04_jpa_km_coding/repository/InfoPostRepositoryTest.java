package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.InfoPost;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;


import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@SpringBootTest
class InfoPostRepositoryTest {
    @Autowired
    private InfoPostRepository infoPostRepository;
    @Transactional
    @Test
    void findAll() {
        Pageable pageable = PageRequest.of(0, 10);
        Page infoPage = infoPostRepository.findAll(pageable);
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
        InfoPost save = infoPostRepository.save(infoPost);
        System.out.println(save);
    }

    @Test
    void findByTitleContainingAndContentContaining() {
        Pageable pageable = PageRequest.of(0, 10);
        Page infoPage = infoPostRepository.findByTitleContainingAndContentContaining("test", "", pageable);
        List<InfoPost> content = infoPage.getContent();
        System.out.println(content);
    }

    @Test
    @Transactional
    void search() {
        Pageable pageable = PageRequest.of(0, 10);
        Page infoPage = infoPostRepository.search("","실전","", LocalDateTime.parse("2025-10-01T00:00:00"),LocalDateTime.parse("2025-12-31T00:00:00"), pageable);
        List<InfoPost> content = infoPage.getContent();
        System.out.println(infoPage.getTotalElements());
        System.out.println(content);

    }
//    @Test
//    @Transactional
//    void searchTag() {
//        Pageable pageable = PageRequest.of(0, 10);
//        Page infoPage = infoPostRepository.search("","","","java", pageable);
//        List<InfoPost> content = infoPage.getContent();
//        for(InfoPost infoPost : content){
//            System.out.println(infoPost);
//            System.out.println(infoPost.getInfoPostTags());
//        }
////        System.out.println(content);
//    }

    @Test
    void findByCategoryId() {
        Pageable pageable = PageRequest.of(0, 10);
        Page infoPage = infoPostRepository.findByCategoryId("backend_springboot", pageable);
        List<InfoPost> content = infoPage.getContent();
        System.out.println(content);
    }
    @Test
    void findByCategoryIdContaining() {
        Pageable pageable = PageRequest.of(0, 10);
        Page infoPage = infoPostRepository.findByCategoryIdContaining("backend", pageable);
        List<InfoPost> content = infoPage.getContent();
        System.out.println(content);

    }
    @Test
    void searchDynamic() {
        String s= """
                라인개행  문자열
                """;//java 15+
        Pageable pageable = PageRequest.of(0, 10);
//        Page infoPage = infoPostRepository.searchDynamic("title","Java", pageable);
        Page infoPage = infoPostRepository.searchDynamic("nickname","경민", "spring",pageable);
        //info_post i join member m where m.nickname='경민'
        List<InfoPost> content = infoPage.getContent();
        System.out.println(content);
    }
}