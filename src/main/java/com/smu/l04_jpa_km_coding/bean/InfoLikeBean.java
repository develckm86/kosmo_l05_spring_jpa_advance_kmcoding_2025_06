package com.smu.l04_jpa_km_coding.bean;

import lombok.Data;

@Data
public class InfoLikeBean {
    private Boolean toggle; //좋아요 true, 좋아요 취소 false
    private Long likeCount;
}
