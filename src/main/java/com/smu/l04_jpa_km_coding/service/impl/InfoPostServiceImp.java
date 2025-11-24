package com.smu.l04_jpa_km_coding.service.impl;

import com.smu.l04_jpa_km_coding.entity.InfoPost;
import com.smu.l04_jpa_km_coding.repository.InfoPostRepository;
import com.smu.l04_jpa_km_coding.service.InfoPostService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
@AllArgsConstructor(onConstructor_ = @Autowired)
public class InfoPostServiceImp implements InfoPostService {
    private final InfoPostRepository infoPostRepository;
    @Override
    public Page<InfoPost> getInfoPosts(Pageable pageable) {
        return infoPostRepository.findAll(pageable);
    }
    @Override
    public Page<InfoPost> getInfoPosts( String categoryId,Pageable pageable) {
        return infoPostRepository.findByCategoryIdContaining(categoryId, pageable);
    }
    //단건검색
    @Override
    public Page<InfoPost> getInfoPosts( String field, String search, String categoryId ,Pageable pageable) {
        return infoPostRepository.searchDynamic(field, search, categoryId, pageable);
    }
    //복수 조건 검색
    @Override
    public Page<InfoPost> getInfoPosts(String title, String content, String categoryId, String tagId, String createdAtStr, Pageable pageable) {
        return infoPostRepository.search(title, content, categoryId, tagId, createdAtStr, pageable);
    }



    @Override
    public InfoPost getInfoPostDetail(Long postId) {
        return null;
    }

    @Override
    public InfoPost writeInfoPost(InfoPost infoPost, Set<Long> tagIds) {
        return null;
    }

    @Override
    public InfoPost editInfoPost(InfoPost infoPost, Set<Long> tagIds) {
        return null;
    }

    @Override
    public void removeInfoPost(Long postId) {

    }

    @Override
    public Page<InfoPost> getMyWrittenInfoPosts(Long memberId, Pageable pageable) {
        return null;
    }

    @Override
    public Page<InfoPost> getMyLikedInfoPosts(Long memberId, Pageable pageable) {
        return null;
    }
}
