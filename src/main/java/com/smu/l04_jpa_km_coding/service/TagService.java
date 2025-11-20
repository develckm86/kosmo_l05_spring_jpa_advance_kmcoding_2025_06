package com.smu.l04_jpa_km_coding.service;

import com.smu.l04_jpa_km_coding.entity.Tag;

import java.util.List;

/**
 * 태그 검색/조회 기능 계약 인터페이스
 */
public interface TagService {

    /**
     * 태그 이름 검색 (작성/검색 자동완성에 사용)
     */
    List<Tag> searchTags(String keyword);
}
