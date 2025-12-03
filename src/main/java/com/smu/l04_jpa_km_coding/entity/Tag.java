package com.smu.l04_jpa_km_coding.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "TAG")
public class Tag {
    @Id
    @Column(name = "TAG_ID", nullable = false, length = 50)
    private String id;

    @OneToMany(mappedBy = "tag")
    private Set<InfoPostTag> infoPostTags = new LinkedHashSet<>();

    @OneToMany(mappedBy = "tag")
    private Set<QnaPostTag> qnaPostTags = new LinkedHashSet<>();

}