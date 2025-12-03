package com.smu.l04_jpa_km_coding.interceptor;

import com.smu.l04_jpa_km_coding.entity.Member;
import com.smu.l04_jpa_km_coding.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.Optional;

@Component
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class AutoLoginDevInterceptor implements HandlerInterceptor {
    private final MemberService memberService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String email = "km@gmail.com";
        String password = "pw1";
        HttpSession session = request.getSession();
        Object loginUser=session.getAttribute("loginUser");
        System.out.println(loginUser+" 로그인 중");
        if(loginUser!=null){
            return true; //이미 로그인되어 있기 때문에 자동로그인 안함!!
        }
        Optional<Member> loginUserOpt=memberService.login(email,password);
        session.setAttribute("loginUser",loginUserOpt.get()); //자동 로그인
        System.out.println("자동로그인 됨!");
        return true;
    }
}
