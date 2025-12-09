package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.Member;
import com.smu.l04_jpa_km_coding.entity.QnaPost;
import org.junit.jupiter.api.Test;
import org.junit.platform.commons.logging.Logger;
import org.junit.platform.commons.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class QnaPostRepositoryTest {
    @Autowired
    private QnaPostRepository qnaPostRepository;
    @Autowired
    private MemberRepository memberRepository;
    @Test
    @Transactional(readOnly = true)
    void findAll() {
        System.out.println(qnaPostRepository.findAll());
    }

    @Test
    @Transactional(readOnly = true)
    void testFindAll() {
        Pageable pageable = PageRequest.of(0, 3, Sort.by("createdAt").ascending());
        Page<QnaPost> qnaPostPage = qnaPostRepository.findAll(pageable);
        System.out.println(qnaPostPage.getNumber()); //현재페이지 (0페이지부터 시작)
        System.out.println(qnaPostPage.getSize()); //3
        System.out.println(qnaPostPage.getTotalPages()); //사이즈가 3일때 총 페이지수
        System.out.println(qnaPostPage.getTotalElements()); //row의 총 수
        System.out.println(qnaPostPage.getContent().size()); //List<QnaPost>
        for(QnaPost qnaPost : qnaPostPage.getContent()){
            System.out.println(qnaPost);

        }
    }
    @Test
    @Transactional(readOnly = true)
    void findById(){
        Optional<QnaPost> qnaPostOpt=qnaPostRepository.findById(1L);
        if(qnaPostOpt.isPresent()){
            QnaPost qnaPost=qnaPostOpt.get();
            System.out.println(qnaPost);
            System.out.println(qnaPost.getQnaImages());
        }
    }

    @Test
    void save() {
        QnaPost qnaPost=new QnaPost();
        qnaPost.setTitle("test");
        qnaPost.setContent("test");
        qnaPost.setMemberId(1L);
        qnaPost.setCategoryId("backend");
        //qnaPost.setCreatedAt(LocalDateTime.now());
//        Member member=memberRepository.findById(1L).get();
//        qnaPost.setMember(member);
        qnaPost=qnaPostRepository.save(qnaPost);
        System.out.println(qnaPost);
    }
}