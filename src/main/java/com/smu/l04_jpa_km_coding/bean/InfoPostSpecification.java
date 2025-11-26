package com.smu.l04_jpa_km_coding.bean;

import com.smu.l04_jpa_km_coding.entity.*;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.JoinType;
import org.springframework.data.jpa.domain.Specification;

import java.time.LocalDateTime;

public class InfoPostSpecification {
    public static Specification<InfoPost> titleContains(String title) {
        return (root, query, cb) -> {
            if (title == null || title.trim().isEmpty()) return null;
            return cb.like(root.get("title"), "%" + title + "%");
        };
    }

    public static Specification<InfoPost> contentContains(String content) {
        return (root, query, cb) -> {
            if (content == null || content.trim().isEmpty()) return null;
            return cb.like(root.get("content"), "%" + content + "%");
        };
    }

    public static Specification<InfoPost> categoryContains(String categoryId) {
        return (root, query, cb) -> {
            if (categoryId == null || categoryId.trim().isEmpty()) return null;
            return cb.like(root.get("categoryId"), "%" + categoryId + "%");
        };
    }

    public static Specification<InfoPost> nicknameContains(String nickname) {
        return (root, query, cb) -> {
            if (nickname == null || nickname.trim().isEmpty()) return null;
            Join<InfoPost, Member> member = root.join("member");
            return cb.like(member.get("nickname"), "%" + nickname + "%");
        };
    }

    public static Specification<InfoPost> emailContains(String email) {
        return (root, query, cb) -> {
            if (email == null || email.trim().isEmpty()) return null;
            Join<InfoPost, Member> member = root.join("member");
            return cb.like(member.get("email"), "%" + email + "%");
        };
    }

    public static Specification<InfoPost> betweenCreatedAt(LocalDateTime startAt, LocalDateTime endAt) {
        return (root, query, cb) -> {
            if (startAt == null || endAt == null) return null;
            return cb.between(root.get("createdAt"), startAt, endAt);
        };
    }

    // fetch join 적용 (한 번만 적용되도록 처리)
    public static Specification<InfoPost> fetchMember() {
        return (root, query, cb) -> {
            // count 쿼리에는 fetch join 넣지 않음
            if (query.getResultType() != Long.class) {
                root.fetch("member", JoinType.INNER);
            }
            return null; // Predicate 없음
        };
    }

}
