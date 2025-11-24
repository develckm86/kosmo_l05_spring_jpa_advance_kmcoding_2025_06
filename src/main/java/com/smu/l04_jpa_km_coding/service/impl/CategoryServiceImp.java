package com.smu.l04_jpa_km_coding.service.impl;

import com.smu.l04_jpa_km_coding.entity.Category;
import com.smu.l04_jpa_km_coding.repository.CategoryRepository;
import com.smu.l04_jpa_km_coding.service.CategoryService;
import lombok.AllArgsConstructor;
import org.hibernate.Hibernate;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class CategoryServiceImp implements CategoryService {
    private final CategoryRepository categoryRepository;
    //스프링부트메인 함수나 설정에 @EnableCaching 정의
    @Cacheable(value = "categories")
    @Override
    @Transactional(readOnly = true)
    public List<Category> getCategories() {
        List<Category> categories= categoryRepository.findByParentIdIsNull();
        //for(Category c : categories){for(Category c2 : c.getCategories()){for(Category c3 : c2.getCategories()){}}}
        categories.forEach((c)->{
            Hibernate.initialize(c.getCategories());
            c.getCategories().forEach((c2)->{
                Hibernate.initialize(c2.getCategories());
            });
        });
        return categories;
    }

    @Override
    public Optional<Category> getOne(String categoryId) {
        return categoryRepository.findById(categoryId);
    }
}
