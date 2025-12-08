package com.smu.l04_jpa_km_coding.service;

import com.smu.l04_jpa_km_coding.bean.QnaPostWriteValid;
import com.smu.l04_jpa_km_coding.entity.QnaPost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.io.IOException;
import java.time.LocalDateTime;

/**
 * README에 정의된 QNA 게시판 기능 계약 인터페이스
 */
public interface QnaService {

    //질문글 전체 조회(Paging 기반)
    //Page java.util.List+Pageable :List 인데 페이지 정보를 포함
    Page<QnaPost> getQnaPosts(Pageable pageable);

    Page<QnaPost> getQnaPosts(String search, String field, Pageable pageable);


    Page<QnaPost> getQnaPosts(String title, String content, String email, Pageable pageable);
    Page<QnaPost> getQnaPosts(
            String title,
            String content,
            String email,
            LocalDateTime startAt,
            LocalDateTime endAt,
            Pageable pageable);


    /**
     * 질문글 작성 (태그 N:N 매핑 포함) - 엔티티 기반 입력
     */
    QnaPost writeQnaPost(QnaPostWriteValid qnaPostWriteValid) throws IOException;


    //    /**
//     * 질문글 목록/검색 조회 (Pageable 기반, 기본 page size=20)
//     */
//    Page<QnaPost> getQnaPosts(Pageable pageable, String search, String field, String tag);
//
//    /**
//     * 질문글 상세 조회
//     */
//    QnaPost getQnaPostDetail(Long postId);
//
//
//
//    /**
//     * 질문글 수정 - 엔티티 기반 입력
//     */
//    QnaPost editQnaPost(QnaPost qnaPost, Set<Long> tagIds);
//
//    /**
//     * 질문글 삭제
//     */
//    void removeQnaPost(Long postId);
//
//    /**
//     * 내 활동 - 내가 작성한 질문글 페이지 조회 (Pageable, 기본 page size=20)
//     */
//    Page<QnaPost> getMyWrittenQnaPosts(Long memberId, Pageable pageable);
//
//    /**
//     * 내 활동 - 내가 리액션한 질문글 페이지 조회 (Pageable, 기본 page size=20)
//     */
//    Page<QnaPost> getMyReactedQnaPosts(Long memberId, Pageable pageable);

}
