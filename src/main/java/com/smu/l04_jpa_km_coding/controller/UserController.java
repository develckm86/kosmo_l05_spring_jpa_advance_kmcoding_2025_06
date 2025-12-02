package com.smu.l04_jpa_km_coding.controller;

import com.smu.l04_jpa_km_coding.bean.LoginValid;
import com.smu.l04_jpa_km_coding.entity.Member;
import com.smu.l04_jpa_km_coding.service.MemberService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.BindResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Slf4j
@Controller
@RequestMapping("/user")
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class UserController {

    private final MemberService memberService;

    @GetMapping("/login.do")
    public String loginForm(
            @Valid LoginValid loginValid,
            BindingResult bindingResult,
            Model model
    ) {
        model.addAttribute("loginValid", loginValid);
        return "user/login";
    }

    @PostMapping("/login.do")
    public String loginSubmit(
            HttpSession session,
            @Valid LoginValid loginValid,
            BindingResult bindingResult,
            Model model
    ) {
        if(bindingResult.hasErrors()){
            System.out.println(loginValid);
            System.out.println(bindingResult.getAllErrors());
            return "/user/login";
        }
        Optional<Member> loginUserOpt=memberService.login(loginValid.getEmail(), loginValid.getPassword());
        if(loginUserOpt.isEmpty()){
            model.addAttribute("msg","아이디나 비밀번호를 확인하세요.");
            return "/user/login";
        }

        session.setAttribute("loginUser", loginUserOpt.get());
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
