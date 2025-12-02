package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.InfoLike;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface InfoLikeRepository extends CrudRepository<InfoLike, Long> {
    //유저가 해당 게시글에 좋아요를 했나?
    Optional<InfoLike> findByMemberIdAndPostId(Long memberId, Long postId);
    //게시글에 좋아요
    InfoLike save(InfoLike infoLike);
    //좋아요 삭제
    void deleteByMemberIdAndPostId(Long memberId, Long postId);

    void deleteById(Long id);

    boolean existsByMemberIdAndPostId(Long memberId, Long postId);

    Long countByPostId(Long postId);
}
