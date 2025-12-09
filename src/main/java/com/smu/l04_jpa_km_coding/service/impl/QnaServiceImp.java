package com.smu.l04_jpa_km_coding.service.impl;

import com.smu.l04_jpa_km_coding.bean.QnaPostSpecification;
import com.smu.l04_jpa_km_coding.bean.QnaPostWriteValid;
import com.smu.l04_jpa_km_coding.bean.QnaReactionBean;
import com.smu.l04_jpa_km_coding.entity.*;
import com.smu.l04_jpa_km_coding.repository.QnaImageRepository;
import com.smu.l04_jpa_km_coding.repository.QnaPostRepository;
import com.smu.l04_jpa_km_coding.repository.QnaReactionRepository;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
@AllArgsConstructor(onConstructor_ = @Autowired)
public class QnaServiceImp implements QnaService {

    private final QnaPostRepository qnaPostRepository;
    private final FileUploadS3Service fileUploadS3Service;//S3
    private final QnaImageRepository qnaImageRepository;
    private final QnaReactionRepository qnaReactionRepository;


    @Override
    public QnaReaction reaction(QnaReactionBean qnaReactionBean) {
        QnaReaction reaction = null;
        //리액션 한적 있니?
        Optional<QnaReaction> qnaReactionOpt =
                qnaReactionRepository.findByPostIdAndMemberId(
                        qnaReactionBean.getQnaPostId()
                        , qnaReactionBean.getMemberId()
                );
        //있으면 수정 or 삭제
        if (qnaReactionOpt.isPresent()) {
            QnaReaction qnaReaction = qnaReactionOpt.get();
            //"INTERESTING".euqals(Reaction.INTERESTING);
            String reactionStr = qnaReactionBean.getReaction().toString();

            //리액션이 같으면 삭제
            if (qnaReaction.getReactionType().equals(reactionStr)) {
//                qnaReactionRepository.deleteById(qnaReaction.getId());
                qnaReactionRepository.delete(qnaReaction);
            } else { //리액션이 다르면 수정
                qnaReaction.setReactionType(reactionStr);
                reaction = qnaReactionRepository.save(qnaReaction);
                //데이터베이스에서 조회 => Entity 가 영속성 컨텍스트에 저장
                //Entity의 내용 일부만 수정하면 update
            }
        } else { //등록
            QnaReaction qnaReaction = new QnaReaction();
            qnaReaction.setPostId(qnaReactionBean.getQnaPostId());
            qnaReaction.setMemberId(qnaReactionBean.getMemberId());
            qnaReaction.setReactionType(qnaReactionBean.getReaction().toString());
            reaction = qnaReactionRepository.save(qnaReaction);
        }
        //QnaReaction 조회, 수정, 등록 (save), 삭제
        return reaction;
    }
    @Override
    public Optional<QnaPost> getQnaPostDetail(Long postId) {
        Optional<QnaPost> postOpt= qnaPostRepository.findById(postId);
        if(postOpt.isPresent()){
            QnaPost post=postOpt.get();
            Set<QnaImage> qnaImages=post.getQnaImages();
            for(QnaImage qnaImage:qnaImages){
                String presignedUrl=fileUploadS3Service.createPresignedGetUrl(qnaImage.getImageUrl());
                qnaImage.setPresignedUrl(presignedUrl);
            }
        }

        return postOpt;
    }



//    @Autowired
//    public QnaServiceImp(QnaPostRepository qnaPostRepository) {
//        this.qnaPostRepository = qnaPostRepository;
//    }
    /**
     * 질문 게시글에 글 작성
     * qna_post insert
     * 이미지들 업로드
     *
     * qna_tags insert
     * tag insert (해당 태그가 없을 때 생성)
     * */
    @Override
    @Transactional
    public QnaPost writeQnaPost(QnaPostWriteValid qnaPostWriteValid) throws IOException {
        QnaPost qnaPost=new QnaPost();
        qnaPost.setTitle(qnaPostWriteValid.getTitle());
        qnaPost.setContent(qnaPostWriteValid.getContent());
        qnaPost.setMemberId(qnaPostWriteValid.getWriterId());
        qnaPost.setCategoryId("backend");
        qnaPost=qnaPostRepository.save(qnaPost);
        //33
        List<QnaImage> images=new ArrayList<>();
        if(qnaPostWriteValid.getImages()!=null){
            for(MultipartFile image:qnaPostWriteValid.getImages()){
                String key=fileUploadS3Service.upload(image,"qna");
                QnaImage qnaImage=new QnaImage();
                qnaImage.setImageUrl(key);
                qnaImage.setPostId(qnaPost.getId());
                images.add(qnaImage);
            }
        }
        qnaImageRepository.saveAll(images);

        return qnaPost;
    }


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
