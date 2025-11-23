package com.smu.l04_jpa_km_coding.controller;

import com.smu.l04_jpa_km_coding.entity.Category;
import com.smu.l04_jpa_km_coding.service.CategoryService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@ControllerAdvice
@AllArgsConstructor
public class GlobalControllerAdvice {
    private final CategoryService categoryService;
    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryService.getCategories();
    }
}
