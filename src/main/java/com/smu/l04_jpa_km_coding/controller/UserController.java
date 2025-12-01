package com.smu.l04_jpa_km_coding.controller;

import com.smu.l04_jpa_km_coding.bean.LoginValid;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.boot.context.properties.bind.BindResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user")
public class UserController {

    @GetMapping("/login.do")
    public String loginForm(
            @Valid LoginValid loginValid,
            BindingResult bindingResult
    ) {
        return "user/login";
    }

    @PostMapping("/login.do")
    public String loginSubmit(
            HttpSession session,
            @Valid LoginValid loginValid,
            BindingResult bindingResult
    ) {
        if(bindingResult.hasErrors()){

            return "/user/login";
        }
        return "redirect:/";
    }

    @GetMapping("/logout.do")
    public String logout() {
        return "redirect:/";
    }

    @GetMapping("/signup.do")
    public String signupForm() {
        return "user/signup";
    }

    @GetMapping("/{memberId}/existId")
    public String existId(@PathVariable Long memberId, Model model) {
        model.addAttribute("memberId", memberId);
        return "user/signup";
    }

    @PostMapping("/signup.do")
    public String signupSubmit() {
        return "redirect:/";
    }

    @GetMapping("/my.do")
    public String myPage() {
        return "user/my";
    }
}
