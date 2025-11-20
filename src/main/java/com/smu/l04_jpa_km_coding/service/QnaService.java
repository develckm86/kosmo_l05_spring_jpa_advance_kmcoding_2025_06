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
     * 질문글 리액션 등록(공감/어려움/흥미/도움됨)
     */
    QnaReaction reactToQnaPost(Long memberId, Long postId, String reactionType);

    /**
     * 질문글 리액션 취소
     */
    void cancelQnaReaction(Long reactionId);

    /**
     * 질문 댓글 리스트 조회 (Pageable 기반, 기본 page size=20)
     */
    Page<QnaComment> getQnaComments(Long postId, Pageable pageable);

    /**
     * 질문 댓글 작성(대댓글 parentId 허용) - 엔티티 기반 입력
     */
    QnaComment writeQnaComment(QnaComment qnaComment);

    /**
     * 질문 댓글 삭제
     */
    void removeQnaComment(Long commentId);

    /**
     * 질문 댓글 채택
     */
    QnaAdopt adoptAnswer(Long postId, Long commentId);

    /**
     * 질문 댓글 채택 취소
     */
    void cancelAdopt(Long adoptId);

    /**
     * 질문 댓글 좋아요 등록
     */
    QnaCommentLike likeQnaComment(Long memberId, Long commentId);

    /**
     * 질문 댓글 좋아요 취소
     */
    void cancelQnaCommentLike(Long likeId);

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

    /**
     * 내 활동 - 내가 작성한 질문 댓글 페이지 조회 (Pageable, 기본 page size=20)
     */
    Page<QnaComment> getMyWrittenQnaComments(Long memberId, Pageable pageable);

    /**
     * 내 활동 - 내가 좋아요한 질문 댓글 페이지 조회 (Pageable, 기본 page size=20)
     */
    Page<QnaComment> getMyLikedQnaComments(Long memberId, Pageable pageable);
}
