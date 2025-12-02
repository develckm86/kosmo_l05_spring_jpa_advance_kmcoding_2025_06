package com.smu.l04_jpa_km_coding.service.impl;

import com.smu.l04_jpa_km_coding.entity.InfoLike;
import com.smu.l04_jpa_km_coding.repository.InfoLikeRepository;
import com.smu.l04_jpa_km_coding.service.InfoLikeService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class InfoLikeServiceImp implements InfoLikeService {
    private final InfoLikeRepository infoLikeRepository;

    @Override
    @Transactional
    public InfoLike toggleInfoPost(Long memberId, Long postId) {
        boolean exist=infoLikeRepository.existsByMemberIdAndPostId(memberId,postId);
        InfoLike saveInfoLike=null;
        if(exist) { //이미 좋아요한 상태로 삭제
            infoLikeRepository.deleteByMemberIdAndPostId(memberId,postId);
        }else {
            InfoLike infoLike=new InfoLike();
            infoLike.setMemberId(memberId);
            infoLike.setPostId(postId);
            saveInfoLike=infoLikeRepository.save(infoLike);
        }
        return saveInfoLike;
    }

    @Override
    public Optional<InfoLike> getInfoPost(Long memberId, Long postId) {
        return infoLikeRepository.findByMemberIdAndPostId(memberId,postId);
    }
}
