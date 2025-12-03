package com.smu.l04_jpa_km_coding.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Getter
@Setter
@Entity
@Table(name = "INFO_POST_TAG")
@ToString(exclude = {"post","tag"})
@JsonIgnoreProperties({"post","tag"})
public class InfoPostTag {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MAP_ID", nullable = false)
    private Long id;

    @Column(name = "TAG_ID", nullable = false, length = 50)
    private String tagId;

    @Column(name = "POST_ID", nullable = false)
    private Long postId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "POST_ID", insertable = false, updatable = false)
    private InfoPost post;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "TAG_ID", insertable = false, updatable = false)
    private Tag tag;

}