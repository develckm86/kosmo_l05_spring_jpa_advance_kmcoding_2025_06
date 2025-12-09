package com.smu.l04_jpa_km_coding.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import groovyjarjarantlr4.v4.runtime.misc.NotNull;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@ToString(exclude = {"member","category","qnaComments","qnaPostTags","qnaReactions","qnaImages"})
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
}