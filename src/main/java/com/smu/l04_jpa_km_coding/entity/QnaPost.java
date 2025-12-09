package com.smu.l04_jpa_km_coding.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import groovyjarjarantlr4.v4.runtime.misc.NotNull;
import jakarta.persistence.*;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.*;

import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@ToString(exclude = {"member","category","qnaComments","qnaPostTags","qnaReactions","qnaImages","qnaReactionCount"})
@Table(name = "QNA_POST")
public class QnaPost {
    //GenerationType.IDENTITY==auto increment (insert => default)
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "POST_ID", nullable = false)
    private Long id;

    @Column(name = "TITLE", nullable = false, length = 200)
    private String title;
    @Lob
    @Column(name = "CONTENT", nullable = false)
    private String content;

    @CreationTimestamp
    @Column(name = "CREATED_AT", nullable = false)
    private LocalDateTime createdAt; //Instance

    @UpdateTimestamp
    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;
    //n+1 문제
    @OneToOne(mappedBy = "post",fetch = FetchType.LAZY)
    private QnaAdopt qnaAdopt;
    //FetchType.LAZY
    //@Transaction이나 View에서 member를 호출하면 그 때 조회

    @Column(name = "MEMBER_ID", nullable = false)
    private Long memberId;

    //@NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "MEMBER_ID",insertable = false,updatable = false)
    private Member member;

    @Column(name = "CATEGORY_ID", nullable = false, length = 50)
    private String categoryId;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "CATEGORY_ID",insertable = false,updatable = false)
    private Category category;


    @OneToMany(mappedBy = "post")
    private Set<QnaComment> qnaComments = new LinkedHashSet<>();

    @OneToMany(mappedBy = "post")
    private Set<QnaPostTag> qnaPostTags = new LinkedHashSet<>();

    @OneToMany(mappedBy = "post")
    private Set<QnaReaction> qnaReactions = new LinkedHashSet<>();

    @OneToMany(mappedBy = "post")
    private Set<QnaImage> qnaImages = new LinkedHashSet<>();

    @Formula("(SELECT COUNT(*) FROM QNA_REACTION r WHERE r.post_id=post_id AND r.reaction_type='HELPFUL')")
    private Long helpfulCnt=0L;
    @Formula("(SELECT COUNT(*) FROM QNA_REACTION r WHERE r.post_id=post_id AND r.reaction_type='INTERESTING')")
    private Long interestingCnt=0L;
    @Formula("(SELECT COUNT(*) FROM QNA_REACTION r WHERE r.post_id=post_id AND r.reaction_type='CONFUSING')")
    private Long confusingCnt=0L;
    @Formula("(SELECT COUNT(*) FROM QNA_REACTION r WHERE r.post_id=post_id AND r.reaction_type='EMPATHY')")
    private Long empathyCnt=0L;

    public boolean isHelpful(Long memberId){
        return qnaReactions.stream().anyMatch(reaction -> reaction.getMemberId().equals(memberId) && reaction.getReactionType().equals("HELPFUL"));
    }
    public boolean isInteresting(Long memberId){
        return qnaReactions.stream().anyMatch(reaction -> reaction.getMemberId().equals(memberId) && reaction.getReactionType().equals("INTERESTING"));
    }
    public boolean isConfusing(Long memberId){
        return qnaReactions.stream().anyMatch(reaction -> reaction.getMemberId().equals(memberId) && reaction.getReactionType().equals("CONFUSING"));
    }
    public boolean isEmpathy(Long memberId){
        return qnaReactions.stream().anyMatch(reaction -> reaction.getMemberId().equals(memberId) && reaction.getReactionType().equals("EMPATHY"));
    }
}