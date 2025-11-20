package com.smu.l04_jpa_km_coding.service;

import com.smu.l04_jpa_km_coding.entity.InfoComment;
import com.smu.l04_jpa_km_coding.entity.InfoCommentLike;
import com.smu.l04_jpa_km_coding.entity.InfoLike;
import com.smu.l04_jpa_km_coding.entity.InfoPost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Set;

/**
 * README에 정의된 INFO 게시판 기능 계약 인터페이스
 */
public interface InfoService {

    /**
     * 정보글 목록/검색 조회 (Pageable 기반, 기본 page size=20)
     */
    Page<InfoPost> getInfoPosts(Pageable pageable, String search, String field, String tag);

    /**
     * 정보글 상세 조회
     */
    InfoPost getInfoPostDetail(Long postId);

    /**
     * 정보글 좋아요 등록
     */
    InfoLike likeInfoPost(Long memberId, Long postId);

    /**
     * 정보글 좋아요 취소
     */
    void cancelInfoPostLike(Long likeId);

    /**
     * 정보 댓글 리스트 조회 (Pageable 기반, 기본 page size=20)
     */
    Page<InfoComment> getInfoComments(Long postId, Pageable pageable);

    /**
     * 정보 댓글 작성(대댓글 parentId 허용) - 엔티티 기반 입력
     */
    InfoComment writeInfoComment(InfoComment infoComment);

    /**
     * 정보 댓글 삭제
     */
    void removeInfoComment(Long commentId);

    /**
     * 정보 댓글 좋아요 등록
     */
    InfoCommentLike likeInfoComment(Long memberId, Long commentId);

    /**
     * 정보 댓글 좋아요 취소
     */
    void cancelInfoCommentLike(Long likeId);

    /**
     * 정보글 작성 (태그 N:N 매핑 포함) - 엔티티 기반 입력
     */
    InfoPost writeInfoPost(InfoPost infoPost, Set<Long> tagIds);

    /**
     * 정보글 수정 (내용/태그 업데이트) - 엔티티 기반 입력
     */
    InfoPost editInfoPost(InfoPost infoPost, Set<Long> tagIds);

    /**
     * 정보글 삭제
     */
    void removeInfoPost(Long postId);

    /**
     * 내 활동 - 내가 작성한 정보글 페이지 조회 (Pageable, 기본 page size=20)
     */
    Page<InfoPost> getMyWrittenInfoPosts(Long memberId, Pageable pageable);

    /**
     * 내 활동 - 내가 좋아요한 정보글 페이지 조회 (Pageable, 기본 page size=20)
     */
    Page<InfoPost> getMyLikedInfoPosts(Long memberId, Pageable pageable);

    /**
     * 내 활동 - 내가 작성한 댓글 페이지 조회 (Pageable, 기본 page size=20)
     */
    Page<InfoComment> getMyWrittenInfoComments(Long memberId, Pageable pageable);

    /**
     * 내 활동 - 내가 좋아요한 댓글 페이지 조회 (Pageable, 기본 page size=20)
     */
    Page<InfoComment> getMyLikedInfoComments(Long memberId, Pageable pageable);
}
