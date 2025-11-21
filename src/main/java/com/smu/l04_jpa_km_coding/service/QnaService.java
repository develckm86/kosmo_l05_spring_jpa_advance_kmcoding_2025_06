package com.smu.l04_jpa_km_coding.service;

import com.smu.l04_jpa_km_coding.entity.QnaAdopt;
import com.smu.l04_jpa_km_coding.entity.QnaComment;
import com.smu.l04_jpa_km_coding.entity.QnaCommentLike;
import com.smu.l04_jpa_km_coding.entity.QnaPost;
import com.smu.l04_jpa_km_coding.entity.QnaReaction;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Set;

/**
 * README에 정의된 QNA 게시판 기능 계약 인터페이스
 */
public interface QnaService {

    /**
     * 질문글 목록/검색 조회 (Pageable 기반, 기본 page size=20)
     */
    Page<QnaPost> getQnaPosts(Pageable pageable, String search, String field, String tag);

    /**
     * 질문글 상세 조회
     */
    QnaPost getQnaPostDetail(Long postId);


    /**
     * 질문글 작성 (태그 N:N 매핑 포함) - 엔티티 기반 입력
     */
    QnaPost writeQnaPost(QnaPost qnaPost, Set<Long> tagIds);

    /**
     * 질문글 수정 - 엔티티 기반 입력
     */
    QnaPost editQnaPost(QnaPost qnaPost, Set<Long> tagIds);

    /**
     * 질문글 삭제
     */
    void removeQnaPost(Long postId);

    /**
     * 내 활동 - 내가 작성한 질문글 페이지 조회 (Pageable, 기본 page size=20)
     */
    Page<QnaPost> getMyWrittenQnaPosts(Long memberId, Pageable pageable);

    /**
     * 내 활동 - 내가 리액션한 질문글 페이지 조회 (Pageable, 기본 page size=20)
     */
    Page<QnaPost> getMyReactedQnaPosts(Long memberId, Pageable pageable);

}
