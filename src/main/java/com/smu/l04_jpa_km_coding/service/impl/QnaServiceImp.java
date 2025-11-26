package com.smu.l04_jpa_km_coding.service.impl;

import com.smu.l04_jpa_km_coding.entity.QnaPost;
import com.smu.l04_jpa_km_coding.repository.QnaPostRepository;
import com.smu.l04_jpa_km_coding.service.QnaService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor(onConstructor_ = @Autowired)
public class QnaServiceImp implements QnaService {

    private final QnaPostRepository qnaPostRepository;
//    @Autowired
//    public QnaServiceImp(QnaPostRepository qnaPostRepository) {
//        this.qnaPostRepository = qnaPostRepository;
//    }

    @Override
    public Page<QnaPost> getQnaPosts(Pageable pageable) {
        return qnaPostRepository.findAll(pageable);
    }
}
