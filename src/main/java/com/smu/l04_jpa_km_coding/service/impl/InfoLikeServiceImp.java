package com.smu.l04_jpa_km_coding.service.impl;

import com.smu.l04_jpa_km_coding.bean.InfoLikeBean;
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
    public InfoLikeBean toggleInfoPost(Long memberId, Long postId) {
        boolean exist=infoLikeRepository.existsByMemberIdAndPostId(memberId,postId);
        Boolean toggle=null;
        if(exist) { //이미 좋아요한 상태로 삭제
            infoLikeRepository.deleteByMemberIdAndPostId(memberId,postId);
            toggle=false;
        }else {
            InfoLike infoLike=new InfoLike();
            infoLike.setMemberId(memberId);
            infoLike.setPostId(postId);
            infoLikeRepository.save(infoLike);
            toggle=true;
        }
        Long likeCount=infoLikeRepository.countByPostId(postId);
        InfoLikeBean infoLikeBean=new InfoLikeBean();
        infoLikeBean.setToggle(toggle);
        infoLikeBean.setLikeCount(likeCount);
        return infoLikeBean;
    }


    @Override
    public Optional<InfoLike> getInfoPost(Long memberId, Long postId) {
        return infoLikeRepository.findByMemberIdAndPostId(memberId,postId);
    }
}
