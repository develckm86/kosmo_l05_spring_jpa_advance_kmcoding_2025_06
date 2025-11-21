package com.smu.l04_jpa_km_coding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/tag")
public class TagController {

    @GetMapping("/list.do")
    public String search(@RequestParam(required = false) String keyword, Model model) {
        model.addAttribute("keyword", keyword);
        return "tag/list";
    }
}
