package com.smu.l04_jpa_km_coding.service.impl;

import com.smu.l04_jpa_km_coding.bean.QnaPostSpecification;
import com.smu.l04_jpa_km_coding.entity.Member;
import com.smu.l04_jpa_km_coding.entity.QnaPost;
import com.smu.l04_jpa_km_coding.repository.QnaPostRepository;
import com.smu.l04_jpa_km_coding.service.QnaService;
import jakarta.persistence.criteria.*;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

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
    public Page<QnaPost> getQnaPosts(String search, String field, Pageable pageable) {
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

    @Override
    public Page<QnaPost> getQnaPosts(String title, String content, String email, Pageable pageable) {
        //SELECT q FROM QnaPost q : root
        Specification<QnaPost> spec=(root,query,cb)->{
            //  root.join("member");
            if(email!=null && !email.isEmpty()){
                root.fetch("member", JoinType.INNER);
            }
            return null;
        };
        if(title!=null && !title.isEmpty()){
            spec=spec.and((root,query,cb)->{
                return cb.like(root.get("title"),"%"+title+"%");
            });
        }
        if(content!=null && !content.isEmpty()){
            spec=spec.and((root,query,cb)->{
                return cb.like(root.get("content"),"%"+content+"%");
            });
        }
        if(email!=null && !email.isEmpty()){
            spec=spec.and((root, query, cb) ->{
                //root 에서 join 없이 지연조회로 조회(1+N문제)
                Join<QnaPost, Member> member=root.join("member");
               return cb.like(member.get("email"),"%"+email+"%");
            });
        }

        Page<QnaPost> qnaPostPage=qnaPostRepository.findAll(spec,pageable);
        return qnaPostPage;
    }

    @Override
    public Page<QnaPost> getQnaPosts(String title, String content, String email, LocalDateTime startAt, LocalDateTime endAt, Pageable pageable) {

        Specification<QnaPost> spec=Specification.allOf(QnaPostSpecification.fetchMember())
                .and(QnaPostSpecification.titleContains(title))
                .and(QnaPostSpecification.contentContains(content))
                .and(QnaPostSpecification.emailContains(email))
                .and(QnaPostSpecification.betweenCreatedAt(startAt,endAt));

        return qnaPostRepository.findAll(spec,pageable);
    }
}
