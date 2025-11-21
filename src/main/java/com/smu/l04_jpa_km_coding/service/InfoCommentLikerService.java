package com.smu.l04_jpa_km_coding.service;

import com.smu.l04_jpa_km_coding.entity.InfoCommentLike;

public interface InfoCommentLikerService {
    /**
     * 정보 댓글 좋아요 등록
     */
    InfoCommentLike likeInfoComment(Long memberId, Long commentId);

    /**
     * 정보 댓글 좋아요 취소
     */
    void cancelInfoCommentLike(Long likeId);

}
