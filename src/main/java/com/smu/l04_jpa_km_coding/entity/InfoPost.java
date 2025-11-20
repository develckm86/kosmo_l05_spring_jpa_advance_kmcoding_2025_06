package com.smu.l04_jpa_km_coding.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "INFO_POST")
public class InfoPost {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "POST_ID", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "MEMBER_ID", nullable = false)
    private com.smu.l04_jpa_km_coding.entity.Member member;

    @Column(name = "TITLE", nullable = false, length = 200)
    private String title;

    @Lob
    @Column(name = "CONTENT", nullable = false)
    private String content;

    @Column(name = "CREATED_AT", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    @OneToMany(mappedBy = "post")
    private Set<InfoComment> infoComments = new LinkedHashSet<>();

    @OneToMany(mappedBy = "post")
    private Set<InfoLike> infoLikes = new LinkedHashSet<>();

    @OneToMany(mappedBy = "post")
    private Set<com.smu.l04_jpa_km_coding.entity.InfoPostTag> infoPostTags = new LinkedHashSet<>();

}