package com.smu.l04_jpa_km_coding.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Getter
@Setter
@Entity
@Table(name = "QNA_IMAGE")
public class QnaImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IMAGE_ID", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "POST_ID", nullable = false)
    private QnaPost post;

    @Size(max = 40)
    @NotNull
    @Column(name = "IMAGE_URL", nullable = false, length = 40)
    private String imageUrl;

    @ColumnDefault("0")
    @Column(name = "IS_MAJOR")
    private Boolean isMajor;

}