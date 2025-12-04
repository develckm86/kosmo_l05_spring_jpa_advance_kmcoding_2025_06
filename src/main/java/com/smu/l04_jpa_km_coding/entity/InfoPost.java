package com.smu.l04_jpa_km_coding.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.*;
import org.springframework.boot.context.properties.bind.DefaultValue;

import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "INFO_POST")
@ToString(exclude = {"member","category","infoComments", "infoLikes", "infoPostTags"})
@JsonIgnoreProperties({"member","category","infoComments", "infoLikes", "infoPostTags"})
public class InfoPost {
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
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    @Column(name = "MEMBER_ID",nullable = false)
    private Long memberId;

    @Column(name = "CATEGORY_ID", nullable = false, length = 50)
    private String categoryId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "MEMBER_ID",insertable = false,updatable = false)
    private Member member;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "CATEGORY_ID",insertable = false,updatable = false)
    private Category category;


    @OneToMany(mappedBy = "post")
    private Set<InfoComment> infoComments = new LinkedHashSet<>();

    @OneToMany(mappedBy = "post")
    private Set<InfoLike> infoLikes = new LinkedHashSet<>();

    @OneToMany(mappedBy = "post")
    private Set<InfoPostTag> infoPostTags = new LinkedHashSet<>();

    @OneToMany(mappedBy = "post")
    private Set<InfoImage> infoImages = new LinkedHashSet<>();


    //Formula : 서브쿼리 작성, 즉시조회(지연조회 불가능), 네이티브쿼리만 가능, 엔티티 필드로 취급되지 않음
    @Formula("(select count(*) from info_comment c where c.post_id = post_id)")
    private Long commentCount=0L;

    @Formula("(select count(*) from info_like l where l.post_id = post_id)")
    private Long likeCount=0L;
    @Transient
    private Boolean liked;
    public Boolean getLiked(Long memberId) {
        this.liked = infoLikes.stream().anyMatch(like -> like.getMemberId().equals(memberId));
        return this.liked;
    }
}
