package com.smu.l04_jpa_km_coding.service.impl;

import com.smu.l04_jpa_km_coding.entity.Category;
import com.smu.l04_jpa_km_coding.service.CategoryService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class CategoryServiceImpTest {
    @Autowired
    private CategoryService categoryService;
    @Test
    void getOne() {
        Optional<Category> categoryOptional=categoryService.getOne("backend");
        categoryOptional.ifPresent(System.out::println);
    }
}