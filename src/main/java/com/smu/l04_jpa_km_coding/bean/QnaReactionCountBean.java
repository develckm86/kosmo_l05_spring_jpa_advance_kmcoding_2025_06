package com.smu.l04_jpa_km_coding.bean;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class QnaReactionCountBean {
    private Long postId=0L;
    private Long helpfulCnt=0L;
    private Long interestingCnt=0L;
    private Long confusingCnt=0L;
    private Long empathyCnt=0L;

    private Boolean isHelpful=false;
    private Boolean isInteresting=false;
    private Boolean isConfusing=false;
    private Boolean isEmpathy=false;

    public QnaReactionCountBean(Long postId, Long helpfulCnt, Long interestingCnt, Long confusingCnt, Long empathyCnt) {
        this.postId = postId;
        this.helpfulCnt = helpfulCnt;
        this.interestingCnt = interestingCnt;
        this.confusingCnt = confusingCnt;
        this.empathyCnt = empathyCnt;
    }

    public QnaReactionCountBean(Long postId, Long helpfulCnt, Long interestingCnt, Long confusingCnt, Long empathyCnt,
                                Long isHelpful, Long isInteresting, Long isConfusing, Long isEmpathy) {
        this.postId = postId;
        this.helpfulCnt = helpfulCnt;
        this.interestingCnt = interestingCnt;
        this.confusingCnt = confusingCnt;
        this.empathyCnt = empathyCnt;
        this.isHelpful = isHelpful == 1 ;
        this.isInteresting = isInteresting == 1;
        this.isConfusing = isConfusing == 1;
        this.isEmpathy = isEmpathy == 1;
    }
}
