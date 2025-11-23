package com.smu.l04_jpa_km_coding.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "CATEGORY")
public class Category {
    @Id
    @Column(name = "CATEGORY_ID", nullable = false, length = 50)
    private String categoryId;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "PARENT_ID")
    private Category parent;

    @Column(name = "NAME", nullable = false, length = 100)
    private String name;

    @OneToMany(mappedBy = "parent")
    private Set<Category> categories = new LinkedHashSet<>();

    @OneToMany(mappedBy = "category")
    private Set<InfoPost> infoPosts = new LinkedHashSet<>();

    @OneToMany(mappedBy = "category")
    private Set<QnaPost> qnaPosts = new LinkedHashSet<>();

}