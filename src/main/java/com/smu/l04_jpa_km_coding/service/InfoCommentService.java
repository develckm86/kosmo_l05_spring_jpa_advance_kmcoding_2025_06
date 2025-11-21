package com.smu.l04_jpa_km_coding.service;

import com.smu.l04_jpa_km_coding.entity.InfoComment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface InfoCommentService {
    /**
     * 정보 댓글 리스트 조회 (Pageable 기반, 기본 page size=20)
     */
    Page<InfoComment> getInfoComments(Long postId, Pageable pageable);

    /**
     * 정보 댓글 작성(대댓글 parentId 허용) - 엔티티 기반 입력
     */
    InfoComment writeInfoComment(InfoComment infoComment);

    /**
     * 정보 댓글 삭제
     */
    void removeInfoComment(Long commentId);
    /**
     * 내 활동 - 내가 작성한 댓글 페이지 조회 (Pageable, 기본 page size=20)
     */
    Page<InfoComment> getMyWrittenInfoComments(Long memberId, Pageable pageable);

    /**
     * 내 활동 - 내가 좋아요한 댓글 페이지 조회 (Pageable, 기본 page size=20)
     */
    Page<InfoComment> getMyLikedInfoComments(Long memberId, Pageable pageable);

}
