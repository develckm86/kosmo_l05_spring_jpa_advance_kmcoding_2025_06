package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.QnaReaction;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface QnaReactionRepository extends CrudRepository<QnaReaction, Long> {
//    Optional<QnaReaction> findByPost_IdAndMember_Id(Long qnaId, Long memberId);
    Optional<QnaReaction> findByPostIdAndMemberId(Long qnaId, Long memberId);

    @Override
    <S extends QnaReaction> S save(S entity);
}
