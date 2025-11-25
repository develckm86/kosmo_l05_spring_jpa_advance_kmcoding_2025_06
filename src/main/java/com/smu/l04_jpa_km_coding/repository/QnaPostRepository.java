package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.QnaPost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface QnaPostRepository extends JpaRepository<QnaPost, Long> {
    @EntityGraph(attributePaths = {"qnaAdopt"})
    List<QnaPost> findAll();
    @EntityGraph(attributePaths = {"qnaAdopt"})
    Page<QnaPost> findAll(Pageable pageable);




//    //메소드쿼리
//    List<QnaPost> findByCreatedAt(LocalDateTime createdAt);
//    Page<QnaPost> findByCreatedAt(LocalDateTime createdAt,Pageable pageable);


}
