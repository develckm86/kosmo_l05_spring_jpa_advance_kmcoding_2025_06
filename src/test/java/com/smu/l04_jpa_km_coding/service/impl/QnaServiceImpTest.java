package com.smu.l04_jpa_km_coding.service.impl;

import com.smu.l04_jpa_km_coding.bean.QnaReactionBean;
import com.smu.l04_jpa_km_coding.entity.QnaPost;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Optional;

@SpringBootTest
class QnaServiceImpTest {
    @Autowired
    private QnaServiceImp qnaService;
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Test
    void getQnaPosts() {
        Pageable pageable = PageRequest.of(0, 10);
        String field = "title";
        String search = "jwt";
        Page qnaPostPage =qnaService.getQnaPosts(search, field, pageable);
        logger.info(qnaPostPage.getContent().toString());
    }
    @Transactional(readOnly = true)
    @Test
    void testGetQnaPosts() {
        Pageable pageable = PageRequest.of(0, 10);
        Page qnaPostPage =qnaService.getQnaPosts("","","km@",pageable);
        logger.info(qnaPostPage.getContent().toString());

    }

    @Test
    void testGetQnaPosts1() {
        String startStr="2025-11-24T00:00:00";
        String endStr="2025-11-26T00:00:00";
        Pageable pageable = PageRequest.of(0, 10);
        Page qnaPostPage =qnaService.getQnaPosts(
                "",
                "",
                "km@",
                LocalDateTime.parse(startStr),
                LocalDateTime.parse(endStr),
                pageable);
//        Page qnaPostPage =qnaService.getQnaPosts("","","km@", null,null,pageable);
        logger.info(qnaPostPage.getContent().toString());


    }
    @Test
    @Transactional(readOnly = true)
    void getQnaPostDetail() {
        Optional<QnaPost> qnaPostOpt=qnaService.getQnaPostDetail(42L);
        QnaPost qnaPost=qnaPostOpt.get();
        System.out.println(qnaPost);
        System.out.println(qnaPost.getQnaImages());


    }

    @Test
    void reaction() {
        //등록 테스트
        //없으면 등록
        //있으면 삭제
        //있는데 리액션 타입이 다르면 수정
        QnaReactionBean qnaReactionBean=new QnaReactionBean();
        qnaReactionBean.setQnaPostId(9L);
        qnaReactionBean.setMemberId(2L);
//        qnaReactionBean.setReaction(QnaReactionBean.Reaction.HELPFUL);
        qnaReactionBean.setReaction(QnaReactionBean.Reaction.INTERESTING);
        qnaService.reaction(qnaReactionBean);
    }
}