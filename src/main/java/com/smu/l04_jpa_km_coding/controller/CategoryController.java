package com.smu.l04_jpa_km_coding.controller;

import com.smu.l04_jpa_km_coding.service.CategoryService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/category")
@AllArgsConstructor
public class CategoryController {
    private final CategoryService categoryService;

    @GetMapping("/list.do")
    public String list(Model model) {
        //model.addAttribute("categories", categoryService.getCategories());
        //GlobalControllerAdvice 에 등록해서 어디서든 호출됨
        return "category/list";
    }
}
