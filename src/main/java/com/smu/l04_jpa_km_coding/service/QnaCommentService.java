package com.smu.l04_jpa_km_coding.service;

import com.smu.l04_jpa_km_coding.entity.QnaComment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface QnaCommentService {

    /**
     * 질문 댓글 리스트 조회 (Pageable 기반, 기본 page size=20)
     */
    Page<QnaComment> getQnaComments(Long postId, Pageable pageable);

    /**
     * 질문 댓글 작성(대댓글 parentId 허용) - 엔티티 기반 입력
     */
    QnaComment writeQnaComment(QnaComment qnaComment);

    /**
     * 질문 댓글 삭제
     */
    void removeQnaComment(Long commentId);

    /**
     * 내 활동 - 내가 작성 질문 댓글 페이지 조회 (Pageable, 기본 page size=20)
     */
    Page<QnaComment> getMyWrittenQnaComments(Long memberId, Pageable pageable);
    /**
     * 내 활동 - 내가 작성한 질문 댓글이 채택된 페이지 조회 (Pageable, 기본 page size=20)
     */
    Page<QnaComment> getMyAdoptedQnaComments(Long memberId, Pageable pageable);
    /**
     * 내 활동 - 내가 좋아요한 질문 댓글 페이지 조회 (Pageable, 기본 page size=20)
     */
    Page<QnaComment> getMyLikedQnaComments(Long memberId, Pageable pageable);

}
