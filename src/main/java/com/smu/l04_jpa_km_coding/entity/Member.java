package com.smu.l04_jpa_km_coding.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "MEMBER")
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MEMBER_ID", nullable = false)
    private Long id;

    @Column(name = "EMAIL", nullable = false, length = 200)
    private String email;

    @Column(name = "PASSWORD", nullable = false, length = 200)
    private String password;

    @Column(name = "NICKNAME", nullable = false, length = 100)
    private String nickname;

    @Column(name = "CREATED_AT", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    @OneToMany(mappedBy = "member")
    private Set<InfoComment> infoComments = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    private Set<InfoCommentLike> infoCommentLikes = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    private Set<InfoLike> infoLikes = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    private Set<InfoPost> infoPosts = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    private Set<com.smu.l04_jpa_km_coding.entity.QnaComment> qnaComments = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    private Set<com.smu.l04_jpa_km_coding.entity.QnaCommentLike> qnaCommentLikes = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    private Set<com.smu.l04_jpa_km_coding.entity.QnaPost> qnaPosts = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    private Set<com.smu.l04_jpa_km_coding.entity.QnaReaction> qnaReactions = new LinkedHashSet<>();

}