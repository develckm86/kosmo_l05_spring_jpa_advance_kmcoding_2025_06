package com.smu.l04_jpa_km_coding.controller;

import com.smu.l04_jpa_km_coding.bean.LoginValid;
import com.smu.l04_jpa_km_coding.entity.Member;
import com.smu.l04_jpa_km_coding.service.MemberService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class UserController {

    private final MemberService memberService;

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
            BindingResult bindingResult, //LoginValid 의 작성한 유효성 검사에 문제가 생기면 동작!
            Model model,
            HttpSession session
    ) {
        if(bindingResult.hasErrors()){ //유효성 검사에 문제가 있음
            System.out.println(bindingResult.getAllErrors());
            //return "redirect:/user/login.do";
            return "user/login"; //양식에 오류를 출력하려면 redirect 는 안됨!!
        }
        Optional<Member> loginUserOpt=memberService.login(loginValid.getEmail(),loginValid.getPassword());
        if(loginUserOpt.isEmpty()){ //아이디와 비밀본호가 잘못됨 => 로그인 양식
            model.addAttribute("msg","아이디와 비밀번호를 확인하세요!");
            return "/user/login";
        }else{ //로그인 성공 =>메인

            Member loginUser=loginUserOpt.get();
            loginUser.setPassword(null);
            session.setAttribute("loginUser",loginUserOpt.get());
            return "redirect:/";
        }
    }

    @GetMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();
//        session.removeAttribute("loginUser");
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
