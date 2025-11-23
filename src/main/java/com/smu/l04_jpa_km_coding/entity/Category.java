package com.smu.l04_jpa_km_coding.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "CATEGORY")
@ToString(exclude = {"parent","categories","infoPosts","qnaPosts"})
@JsonIgnoreProperties({"parent","categories","infoPosts","qnaPosts"})
public class Category {
    @Id
    @Column(name = "CATEGORY_ID", nullable = false, length = 50)
    private String categoryId;

    @Column(name = "NAME", nullable = false, length = 100)
    private String name;

    @Column(name = "PARENT_ID", length = 50)
    private String parentId;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "PARENT_ID",insertable = false, updatable = false)
    private Category parent;
    //1+N 대신 in 으로 조회
    @BatchSize(size = 50)
    @OneToMany(mappedBy = "parent",fetch = FetchType.LAZY)
    private Set<Category> categories = new LinkedHashSet<>();

    @OneToMany(mappedBy = "category")
    private Set<InfoPost> infoPosts = new LinkedHashSet<>();

    @OneToMany(mappedBy = "category")
    private Set<QnaPost> qnaPosts = new LinkedHashSet<>();

}