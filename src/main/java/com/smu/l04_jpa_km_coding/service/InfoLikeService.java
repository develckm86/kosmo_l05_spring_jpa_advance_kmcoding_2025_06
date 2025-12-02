package com.smu.l04_jpa_km_coding.service;

import com.smu.l04_jpa_km_coding.bean.InfoLikeBean;
import com.smu.l04_jpa_km_coding.entity.InfoLike;

import java.util.Optional;

public interface InfoLikeService {

    /**
     * 정보글 좋아요 등록 및 취소
     */
    InfoLikeBean toggleInfoPost(Long memberId, Long postId);


    Optional<InfoLike> getInfoPost(Long memberId, Long postId);

}
