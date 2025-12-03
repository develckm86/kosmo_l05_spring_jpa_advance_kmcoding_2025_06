package com.smu.l04_jpa_km_coding.service.impl;

import com.smu.l04_jpa_km_coding.entity.Member;
import com.smu.l04_jpa_km_coding.repository.MemberRepository;
import com.smu.l04_jpa_km_coding.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class MemberServiceImp implements MemberService {

    private final MemberRepository memberRepository;
    //상수 : 무조건 초기값을 가져야함


    //SELECT * FROM MEMBER WHERE EMAIL = ? AND PASSWORD = ?;
    @Override
    public Optional<Member> login(String email, String password) {
        return memberRepository.findByEmailAndPassword(email, password);
    }

    @Override
    public void logout(Long memberId) {

    }
}
