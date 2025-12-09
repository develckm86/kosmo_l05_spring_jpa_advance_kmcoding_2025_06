package com.smu.l04_jpa_km_coding.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Getter
@Setter
@Entity
@Table(name = "QNA_IMAGE")
@ToString(exclude = {"post"})
public class QnaImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IMAGE_ID", nullable = false)
    private Long id;

    @Column(name = "POST_ID", nullable = false)
    private Long postId;

    //@NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "POST_ID",insertable = false, updatable = false)
    private QnaPost post;

    @Size(max = 40)
    @NotNull
    @Column(name = "IMAGE_URL", nullable = false, length = 40)
    private String imageUrl;

    @Transient //Table과 관련 없는 필드야!
    private String presignedUrl;

    @ColumnDefault("0")
    @Column(name = "IS_MAJOR")
    private Boolean isMajor;

}