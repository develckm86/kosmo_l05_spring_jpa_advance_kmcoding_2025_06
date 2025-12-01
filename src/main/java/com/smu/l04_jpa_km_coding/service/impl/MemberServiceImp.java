package com.smu.l04_jpa_km_coding.service.impl;

import com.smu.l04_jpa_km_coding.entity.Member;
import com.smu.l04_jpa_km_coding.repository.MemberRepository;
import com.smu.l04_jpa_km_coding.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class MemberServiceImp implements MemberService {

    private final MemberRepository memberRepository;

    @Override
    public Optional<Member> login(String email, String password) {
        return memberRepository.findByEmailAndPassword(email, password);
    }
}
