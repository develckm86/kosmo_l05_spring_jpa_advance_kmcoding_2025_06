package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.Category;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class CategoryRepositoryTest {
    @Autowired
    private CategoryRepository categoryRepository;
    @Test
    @Transactional
    void findByParentIdIsNull() {
        List<Category> categories=(categoryRepository.findByParentIdIsNull());
        for(Category category:categories){
            System.out.println(category);
            for (Category childs : category.getCategories()){
                System.out.println(childs);
                for (Category childs2 : childs.getCategories()){
                    System.out.println(childs2);

                }
            }
        }
    }
}