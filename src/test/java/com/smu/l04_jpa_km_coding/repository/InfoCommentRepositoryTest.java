package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.InfoComment;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class InfoCommentRepositoryTest {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private InfoCommentRepository infoCommentRepository;
    @Test
    @Transactional(readOnly = true)
    void findByPostIdAndParentIdIsNull() {
        //1+N fetch join 의 페이징은 최상위만 가능
        Pageable pageable = PageRequest.of(0, 4);
        Page<InfoComment> infoCommentPage = infoCommentRepository.findByPostIdAndParentIdIsNull(1L,pageable);
        System.out.println(infoCommentPage.getContent());
        for(InfoComment infoComment : infoCommentPage.getContent()){
            System.out.println("최상위 댓글");
            System.out.println(infoComment);
            for (InfoComment infoComment1 : infoComment.getInfoComments()){
                System.out.println("대댓글");
                System.out.println(infoComment1);
                System.out.println("대대댓글");
                System.out.println(infoComment1.getInfoComments());
            }
        }
    }
}