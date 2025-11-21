package com.smu.l04_jpa_km_coding.service;

import com.smu.l04_jpa_km_coding.entity.QnaCommentLike;

public interface QnaCommentLikerService {
    /**
     * 질문 댓글 좋아요 등록
     */
    QnaCommentLike likeQnaComment(Long memberId, Long commentId);

    /**
     * 질문 댓글 좋아요 취소
     */
    void cancelQnaCommentLike(Long likeId);

}
