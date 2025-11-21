package com.smu.l04_jpa_km_coding.service;

import com.smu.l04_jpa_km_coding.entity.InfoLike;

public interface InfoLikeService {

    /**
     * 정보글 좋아요 등록
     */
    InfoLike likeInfoPost(Long memberId, Long postId);

    /**
     * 정보글 좋아요 취소
     */
    void cancelInfoPostLike(Long likeId);

}
