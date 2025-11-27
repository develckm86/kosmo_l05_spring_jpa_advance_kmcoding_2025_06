package com.smu.l04_jpa_km_coding.service.impl;

import com.smu.l04_jpa_km_coding.entity.InfoComment;
import com.smu.l04_jpa_km_coding.repository.InfoCommentRepository;
import com.smu.l04_jpa_km_coding.service.InfoCommentService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor(onConstructor_ = @Autowired)
public class InfoCommentServiceImp implements InfoCommentService {
    private final InfoCommentRepository infoCommentRepository;
    @Override
    public Page<InfoComment> getInfoComments(Long postId, Pageable pageable) {
        return infoCommentRepository.findByPostIdAndParentIdIsNull(postId, pageable);
    }
}
