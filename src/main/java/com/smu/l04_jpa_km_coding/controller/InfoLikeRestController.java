package com.smu.l04_jpa_km_coding.controller;

import com.smu.l04_jpa_km_coding.bean.InfoLikeBean;
import com.smu.l04_jpa_km_coding.entity.InfoLike;
import com.smu.l04_jpa_km_coding.entity.Member;
import com.smu.l04_jpa_km_coding.service.InfoLikeService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/info/like")
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class InfoLikeRestController {
    private final InfoLikeService infoLikeService;

    @PostMapping("/{postId}")
    public ResponseEntity<InfoLikeBean> likeTogle(
            @PathVariable Long postId,
            @SessionAttribute Member loginUser //400 로그인 후 이용
            ) {
        InfoLikeBean infoLikeBean=infoLikeService.toggleInfoPost(loginUser.getId(),postId);
        return ResponseEntity.ok(infoLikeBean); //200 좋아요 등록 or 삭제(null) 성공
    }

}
