package com.smu.l04_jpa_km_coding.bean;

import com.smu.l04_jpa_km_coding.entity.Member;
import com.smu.l04_jpa_km_coding.entity.QnaPost;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.JoinType;
import org.springframework.data.jpa.domain.Specification;

import java.time.LocalDateTime;

public class QnaPostSpecification {
    public static Specification<QnaPost> fetchMember(){
        return (root,query,cb)->{
            root.fetch("member", JoinType.LEFT);
            return null;
        };
    }
    public static Specification<QnaPost> titleContains(String title){
        return (root,query,cb) ->{
            if(title==null || title.isEmpty()) return null;
            return cb.like(root.get("title"),"%"+title+"%");
        };
    }
    public static Specification<QnaPost> contentContains(String content){
        return (root,query,cb) ->{
            if(content==null || content.isEmpty()) return null;
            return cb.like(root.get("content"),"%"+content+"%");
        };
    }
    public static Specification<QnaPost> emailContains(String email){
        return ((root, query, cb) -> {
            if(email==null || email.isEmpty()) return null;
            Join<QnaPost, Member> member=root.join("member");
            return cb.like(member.get("email"),"%"+email+"%");
        });
    }
    //WHERE createdAt(LocalDateTime) BETWEEN :startAt AND :endAt
    public static Specification<QnaPost> betweenCreatedAt(LocalDateTime startAt, LocalDateTime endAt){
        return (root,query,cb)->{
            if(startAt==null || endAt==null) return null;
            return cb.between(root.get("createdAt"),startAt,endAt);
        };

    }


}
