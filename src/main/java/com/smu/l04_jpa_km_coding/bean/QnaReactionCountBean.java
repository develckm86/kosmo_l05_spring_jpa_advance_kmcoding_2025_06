package com.smu.l04_jpa_km_coding.bean;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class QnaReactionCountBean {
    private Long helpfulCnt;
    private Long interestingCnt;
    private Long confusingCnt;
    private Long empathyCnt;

}
