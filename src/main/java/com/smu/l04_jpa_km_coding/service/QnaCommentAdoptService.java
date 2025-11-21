package com.smu.l04_jpa_km_coding.service;

import com.smu.l04_jpa_km_coding.entity.QnaAdopt;

public interface QnaCommentAdoptService {
    /**
     * 질문 댓글 채택
     */
    QnaAdopt adoptAnswer(Long postId, Long commentId);

    /**
     * 질문 댓글 채택 취소
     */
    void cancelAdopt(Long adoptId);

}
