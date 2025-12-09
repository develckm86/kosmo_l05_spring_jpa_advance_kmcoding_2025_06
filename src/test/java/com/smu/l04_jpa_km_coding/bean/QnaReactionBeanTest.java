package com.smu.l04_jpa_km_coding.bean;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class QnaReactionBeanTest {

    @Test
    void test() {
        QnaReactionBean qnaReactionBean=new QnaReactionBean();
        qnaReactionBean.setReaction(QnaReactionBean.Reaction.CONFUSING);
//        qnaReactionBean.setReaction(QnaReactionBean.Reaction.INTERESTING);
        System.out.println(qnaReactionBean);
        System.out.println(qnaReactionBean.getReaction().toString().equals("CONFUSING"));
        System.out.println(qnaReactionBean.getReaction().name.equals("CONFUSING"));

    }
}