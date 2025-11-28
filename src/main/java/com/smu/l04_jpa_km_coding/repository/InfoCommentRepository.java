package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.InfoComment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface InfoCommentRepository extends JpaRepository<InfoComment, Long> {

    /**엔티티 그래프로 1:N 조인 후 1:N 불가능
     * @EntityGraph(attributePaths = {"infoComments","infoComments.infoComments"})
     * Page<InfoComment> findByInfoPost_idAndParent_id(Pageable pageable);
     * */
    /**
     * 게시글에 작성된 댓글 조회
     * 1+N fetch join 의 페이징은 최상위만 가능
     */
    @Query(
            """
            SELECT a FROM InfoComment a 
                    JOIN FETCH a.member
                    JOIN FETCH a.infoComments b 
                    JOIN FETCH b.member
                    JOIN FETCH b.infoComments c
                    JOIN FETCH c.member 
                        WHERE a.parentId IS NULL
            """
    )
    Page<InfoComment> findByPostIdAndParentIdIsNull(long postId, Pageable pageable);
}
