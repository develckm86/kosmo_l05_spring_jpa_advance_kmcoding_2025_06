package com.smu.l04_jpa_km_coding.service;

import com.smu.l04_jpa_km_coding.entity.Member;

import java.util.Optional;

/**
 * LOGIN / SIGNUP / MY 영역 서비스 계약 인터페이스
 */
public interface MemberService {

    /**
     * 로그인 처리 (세션/토큰 발급은 구현체 책임)
     */
    Optional<Member> login(String email, String password);

    /**
     * 로그아웃 처리 (세션 만료/토큰 블랙리스트 등 구현체 책임)
     */
    void logout(Long memberId);

//    /**
//     * 회원가입 - 엔티티 입력 기반
//     */
//    Member signup(Member member);
//
//    /**
//     * 회원 수정 (닉네임, 비밀번호, 이메일)
//     */
//    Member modfiy(Member member);
//
//    /**
//     * 회원 탈퇴
//     */
//    void delete(Long memberId);
//
//    /**
//     * ID로 회원 조회
//     */
//    Member getMember(Long memberId);
//
//    /**
//     * 이메일로 회원 조회
//     */
//    Member getMember(String email);
//
//    /**
//     * 이메일 중복 여부 확인
//     */
//    boolean existsByEmail(String email);
//
//    /**
//     * 마이페이지용 내 정보 조회
//     */
//    Member getMyProfile(Long memberId);
}
