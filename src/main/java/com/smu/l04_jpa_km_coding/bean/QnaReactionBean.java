package com.smu.l04_jpa_km_coding.bean;

import lombok.Data;

@Data
public class QnaReactionBean {
    public static enum  Reaction {
        EMPATHY("EMPATHY"),
        CONFUSING("CONFUSING"),
        INTERESTING("INTERESTING"),
        HELPFUL("HELPFUL");
        public String name;
        Reaction(String name){
            this.name=name;
        }
        @Override
        public String toString() {
            return name;
        }
    }
    Long qnaPostId;
    Long memberId;
    Reaction reaction;
    //'EMPATHY','CONFUSING','INTERESTING','HELPFUL'
}
