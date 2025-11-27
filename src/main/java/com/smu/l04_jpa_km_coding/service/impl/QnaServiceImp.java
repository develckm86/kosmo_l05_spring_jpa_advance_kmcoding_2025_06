package com.smu.l04_jpa_km_coding.service.impl;

import com.smu.l04_jpa_km_coding.entity.QnaPost;
import com.smu.l04_jpa_km_coding.repository.QnaPostRepository;
import com.smu.l04_jpa_km_coding.service.QnaService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
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
    //QBE
    @Override
    public Page<QnaPost> getQanPosts(String search, String field, Pageable pageable) {
        QnaPost qnaPost = new QnaPost();
        if(field.equals("title")){
            qnaPost.setTitle(search);
        }else if(field.equals("content")){
            qnaPost.setContent(search);
        }
        //qnaPost.setContent("재발급");
        ExampleMatcher matcher=ExampleMatcher
                .matchingAll()
                .withIgnoreNullValues()
                //.withIgnoreCase()
                .withStringMatcher(ExampleMatcher.StringMatcher.CONTAINING)
                .withMatcher("title",match->match.contains().ignoreCase())
                .withMatcher("content",match->match.contains());
        Example<QnaPost> example=Example.of(qnaPost,matcher);
        Page<QnaPost> qnaPostPage=qnaPostRepository.findAll(example,pageable);
        return qnaPostPage;
    }
}
