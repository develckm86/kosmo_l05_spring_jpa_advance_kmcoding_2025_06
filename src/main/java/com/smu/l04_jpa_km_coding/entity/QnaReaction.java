package com.smu.l04_jpa_km_coding.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Getter
@Setter
@Entity
@Table(name = "QNA_REACTION")
@ToString(exclude = {"post","member"})
public class QnaReaction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "REACTION_ID", nullable = false)
    private Long id;

    @Column(name = "POST_ID", nullable = false)
    private Long postId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "POST_ID", insertable = false, updatable = false)
    private QnaPost post;

    @Column(name = "MEMBER_ID", nullable = false)
    private Long memberId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "MEMBER_ID", insertable = false, updatable = false)
    private Member member;

    @Column(name = "REACTION_TYPE", length = 20)
    private String reactionType;

}