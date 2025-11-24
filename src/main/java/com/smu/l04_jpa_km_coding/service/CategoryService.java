package com.smu.l04_jpa_km_coding.service;

import com.smu.l04_jpa_km_coding.entity.Category;

import java.util.List;
import java.util.Optional;

public interface CategoryService {
    List<Category> getCategories();
    Optional<Category> getOne(String categoryId);
}
