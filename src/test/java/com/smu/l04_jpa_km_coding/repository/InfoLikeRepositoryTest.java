package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.InfoLike;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Rollback(false)
class InfoLikeRepositoryTest {
    @Autowired
    private InfoLikeRepository infoLikeRepository;

    @Test
    void findByMemberIdAndPostId() {
        System.out.println(infoLikeRepository.findByMemberIdAndPostId(1L,2L).get());
    }

    @Test
    void save() {
        InfoLike infoLike=new InfoLike();
        infoLike.setMemberId(1L);
        infoLike.setPostId(1L);
        InfoLike saveInfoLike=infoLikeRepository.save(infoLike);
        System.out.println(saveInfoLike);
    }
    @Transactional
    @Test
    void deleteByMemberIdAndPostId() {
        infoLikeRepository.deleteByMemberIdAndPostId(1L,1L);

    }

    @Test
    void deleteById() {
        InfoLike infoLike=new InfoLike();
        infoLike.setMemberId(1L);
        infoLike.setPostId(1L);
        InfoLike saveInfoLike=infoLikeRepository.save(infoLike);
        infoLikeRepository.deleteById(saveInfoLike.getId());
    }

    @Test
    void existsByMemberIdAndPostId() {
        System.out.println(infoLikeRepository.existsByMemberIdAndPostId(1L,1L));
        System.out.println(infoLikeRepository.existsByMemberIdAndPostId(1L,2L));
    }
}