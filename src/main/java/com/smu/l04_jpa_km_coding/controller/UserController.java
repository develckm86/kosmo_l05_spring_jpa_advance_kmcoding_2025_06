package com.smu.l04_jpa_km_coding.controller;

import com.smu.l04_jpa_km_coding.bean.LoginValid;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {
    //로그인 양식
    @GetMapping("/login.do")
    public String loginForm(
            @Valid LoginValid loginValid,
            BindingResult bindingResult, //사용하지 않음! 하지만 작성이 편리함
            Model model
    ) {
        model.addAttribute("loginValid", loginValid);
        return "user/login";
    }
    //로그인 액션
    @PostMapping("/login.do")
    public String loginSubmit(
            @Valid LoginValid loginValid,
            BindingResult bindingResult //LoginValid 의 작성한 유효성 검사에 문제가 생기면 동작!
            ) {
        if(bindingResult.hasErrors()){ //유효성 검사에 문제가 있음
            System.out.println(bindingResult.getAllErrors());
            System.out.println(bindingResult.getFieldError("email"));
            System.out.println(bindingResult.getFieldError("password"));
            //return "redirect:/user/login.do";
            return "user/login"; //양식에 오류를 출력하려면 redirect 는 안됨!!
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
