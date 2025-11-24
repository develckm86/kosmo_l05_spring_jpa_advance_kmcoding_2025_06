package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.Category;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, String> {
    //셀프조인의 깊이는 1개가 한계
    //@EntityGraph(attributePaths = {"categories","categories.categories","categories.categories.categories"})
    //@EntityGraph(attributePaths = {"categories"})
    List<Category> findByParentIdIsNull();
}
