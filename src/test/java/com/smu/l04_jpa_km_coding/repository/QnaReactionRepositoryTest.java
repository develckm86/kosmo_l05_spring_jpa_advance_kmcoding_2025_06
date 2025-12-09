package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.QnaReaction;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Rollback(false)
class QnaReactionRepositoryTest {

    @Autowired
    private QnaReactionRepository qnaReactionRepository;

    @Test
    void findByPostIdAndMemberId() {
        Optional<QnaReaction> qnaReactionOpt=
                qnaReactionRepository.findByPostIdAndMemberId(10L,1L);
        if(qnaReactionOpt.isPresent()){
            System.out.println(qnaReactionOpt.get());
        }
    }

    @Test
    void deleteById() {
        qnaReactionRepository.deleteById(1L);
    }

    @Test
    void save() {
        //id 가 없으면 등록
        //id 가 있으면 (조회 후) 수정
        QnaReaction qnaReaction=new QnaReaction();
        qnaReaction.setPostId(10L);
        qnaReaction.setMemberId(1L);
//        qnaReaction.setReactionType("INTERESTING");
        qnaReaction.setId(1L);
        qnaReaction.setReactionType("CONFUSING");
        qnaReaction=qnaReactionRepository.save(qnaReaction);
        System.out.println(qnaReaction);

    }
}