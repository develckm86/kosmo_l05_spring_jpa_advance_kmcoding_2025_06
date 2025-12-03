package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class MemberRepositoryTest {
    @Autowired
    private MemberRepository memberRepository;


    @Test
    void findByEmailAndPassword() {
        String email="km@gmail.com";
        String password="pw1";
        Optional<Member> member = memberRepository.findByEmailAndPassword(email, password);
        if(member.isPresent()){
            System.out.println(member.get());
        }else {
            System.out.println("로그인 실패");
        }
    }
}