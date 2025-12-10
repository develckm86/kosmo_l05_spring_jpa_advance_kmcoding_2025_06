package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.bean.QnaReactionCountBean;
import com.smu.l04_jpa_km_coding.entity.QnaReaction;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface QnaReactionRepository extends CrudRepository<QnaReaction, Long> {
//    Optional<QnaReaction> findByPost_IdAndMember_Id(Long qnaId, Long memberId);
    Optional<QnaReaction> findByPostIdAndMemberId(Long qnaId, Long memberId);

    @Override
    <S extends QnaReaction> S save(S entity);

    @Query("""
SELECT 
new com.smu.l04_jpa_km_coding.bean.QnaReactionCountBean(
    SUM(CASE WHEN r.reactionType='HELPFUL' THEN 1L ELSE 0L END ),
    SUM(CASE WHEN r.reactionType='INTERESTING' THEN 1L ELSE 0L END ) ,
    SUM(CASE WHEN r.reactionType='CONFUSING' THEN 1L ELSE 0L END ),
    SUM(CASE WHEN r.reactionType='EMPATHY' THEN 1L ELSE 0L END )
)
FROM QnaReaction  r
WHERE r.postId=:postId
GROUP BY r.postId
""")
    QnaReactionCountBean getReaction(Long postId);

}
