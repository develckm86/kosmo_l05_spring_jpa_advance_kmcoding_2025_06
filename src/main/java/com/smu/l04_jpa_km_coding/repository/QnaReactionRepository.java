package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.QnaReaction;
import com.smu.l04_jpa_km_coding.bean.QnaReactionCountBean;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface QnaReactionRepository extends CrudRepository<QnaReaction, Long> {
//    Optional<QnaReaction> findByPost_IdAndMember_Id(Long qnaId, Long memberId);
    Optional<QnaReaction> findByPostIdAndMemberId(Long qnaId, Long memberId);

    @Override
    <S extends QnaReaction> S save(S entity);

    @Query(
"""

SELECT 
    new com.smu.l04_jpa_km_coding.bean.QnaReactionCountBean(
        r.postId
        ,SUM( CASE WHEN r.reactionType='HELPFUL' THEN 1L ELSE 0L END )
        ,SUM( CASE WHEN r.reactionType='INTERESTING' THEN 1L ELSE 0L END )
        ,SUM( CASE WHEN r.reactionType='CONFUSING' THEN 1L ELSE 0L END )
        ,SUM( CASE WHEN r.reactionType='EMPATHY' THEN 1L ELSE 0L END )
    )
    
    FROM QnaReaction r
    WHERE r.postId=:postId
    GROUP BY r.post 
"""
    )
    QnaReactionCountBean getReactionCount(Long postId);
@Query(
"""
SELECT 
    new com.smu.l04_jpa_km_coding.bean.QnaReactionCountBean(
        r.postId
        ,SUM( CASE WHEN r.reactionType='HELPFUL' THEN 1L ELSE 0L END )
        ,SUM( CASE WHEN r.reactionType='INTERESTING' THEN 1L ELSE 0L END )
        ,SUM( CASE WHEN r.reactionType='CONFUSING' THEN 1L ELSE 0L END )
        ,SUM( CASE WHEN r.reactionType='EMPATHY' THEN 1L ELSE 0L END )
        ,SUM(case when r.reactionType = 'HELPFUL'     and r.member.id = :memberId then 1 else 0 end)
        ,SUM(case when r.reactionType = 'INTERESTING' and r.member.id = :memberId then 1 else 0 end)
        ,SUM(case when r.reactionType = 'CONFUSING'   and r.member.id = :memberId then 1 else 0 end) 
        ,SUM(case when r.reactionType = 'EMPATHY'     and r.member.id = :memberId then 1 else 0 end)
    )
    FROM QnaReaction r  
    WHERE r.postId=:postId
    GROUP BY r.post 
"""
    )
    QnaReactionCountBean getReactionCount(Long postId, Long memberId);
}
