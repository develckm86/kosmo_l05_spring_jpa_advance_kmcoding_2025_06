package com.smu.l04_jpa_km_coding.service;

import com.smu.l04_jpa_km_coding.entity.QnaReaction;

public interface QnaReactionService {
    /**
     * 질문글 리액션 등록(공감/어려움/흥미/도움됨)
     */
    QnaReaction reactToQnaPost(Long memberId, Long postId, String reactionType);

    /**
     * 질문글 리액션 취소
     */
    void cancelQnaReaction(Long reactionId);

}
