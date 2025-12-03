package com.smu.l04_jpa_km_coding.interceptor;

import com.smu.l04_jpa_km_coding.entity.Member;
import com.smu.l04_jpa_km_coding.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.Optional;

@Component
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class AutoLoginInterceptor implements HandlerInterceptor {

    private final MemberService memberService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object loginUserObj = session.getAttribute("loginUser");
        if(loginUserObj == null){
            Optional<Member> loginMemberOpt=memberService.login("km@gmail.com","pw1");
            loginMemberOpt.ifPresent(member -> session.setAttribute("loginUser", member));
        }
        return true;
    }
}
