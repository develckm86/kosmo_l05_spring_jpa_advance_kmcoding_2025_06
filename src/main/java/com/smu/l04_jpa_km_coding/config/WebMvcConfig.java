package com.smu.l04_jpa_km_coding.config;

import com.smu.l04_jpa_km_coding.interceptor.AutoLoginInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class WebMvcConfig implements WebMvcConfigurer {
    private final AutoLoginInterceptor autoLoginInterceptor; //개발용 자동로그인
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(autoLoginInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns( "/src/**", "/favicon.ico", "/user/login.do", "/user/signup.do");

    }
}
