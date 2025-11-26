package com.smu.l04_jpa_km_coding.service.impl;

import com.smu.l04_jpa_km_coding.bean.InfoPostSearchBean;
import com.smu.l04_jpa_km_coding.bean.InfoPostSpecification;
import com.smu.l04_jpa_km_coding.entity.InfoPost;
import com.smu.l04_jpa_km_coding.entity.Member;
import com.smu.l04_jpa_km_coding.repository.InfoPostRepository;
import com.smu.l04_jpa_km_coding.service.InfoPostService;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.JoinType;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
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
    public Page<InfoPost> getInfoPosts(String title, String content, String categoryId,String nickname,String email, LocalDateTime startAt, LocalDateTime endAt, Pageable pageable) {
        return infoPostRepository.search(title, content, categoryId, nickname, email, startAt, endAt, pageable);
    }

    @Override
    public Page<InfoPost> getInfoPosts(InfoPostSearchBean infoPostSearchBean, Pageable pageable) {
        return infoPostRepository.search(
                infoPostSearchBean.getTitle(),
                infoPostSearchBean.getContent(),
                infoPostSearchBean.getCategoryId(),
                infoPostSearchBean.getNickname(),
                infoPostSearchBean.getEmail(),
                infoPostSearchBean.getStartAt(),
                infoPostSearchBean.getEndAt(),
                pageable
                );
    }

    /**
     * 1. Example & ExampleMatcher (QBE, Query By Example)
     *
     * Spring Data JPA에서 공식적으로 지원하는 동적 조건 방식.
     * 특징
     * 	•	엔티티 자체를 검색 조건으로 사용
     * 	•	null 이나 빈 값은 자동 무시됨
     * 	•	LIKE 검색, startsWith 등 제공
     * 	•   Date 검색 지원안됨
     * 	•	조인 조건 불가. 단일 엔티티 검색에 적합
     * 	https://docs.spring.io/spring-data/jpa/reference/repositories/query-by-example.html
     * */


    public Page<InfoPost> searchQBE(InfoPostSearchBean s, Pageable pageable) {

        // Probe 객체 생성
        InfoPost probe = new InfoPost();
        probe.setTitle(s.getTitle());
        probe.setContent(s.getContent());
        probe.setCategoryId(s.getCategoryId());

        ExampleMatcher matcher = ExampleMatcher.matchingAll()
                .withIgnoreNullValues()
                .withIgnoreCase()
                .withStringMatcher(ExampleMatcher.StringMatcher.CONTAINING) // LIKE %...%
                .withMatcher("title", match -> match.contains())
                .withMatcher("content", match -> match.contains())
                .withMatcher("categoryId", match -> match.contains());

        Example<InfoPost> example = Example.of(probe, matcher);

        Page<InfoPost> page = infoPostRepository.findAll(example, pageable);
//        // 날짜 필터는 QBE가 지원 안하므로 수동 필터링
//        if (s.getStartAt() != null && s.getEndAt() != null) {
//            List<InfoPost> filtered = page.getContent().stream()
//                    .filter(i -> i.getCreatedAt().isAfter(s.getStartAt()) &&
//                            i.getCreatedAt().isBefore(s.getEndAt()))
//                    .toList();
//            return new PageImpl<>(filtered, pageable, filtered.size());
//        }
        return page;
    }
    Page<InfoPost> searchSpec(InfoPostSearchBean searchBean,Pageable pageable) {
        Page<InfoPost>  infoPostPage=null;
        Specification<InfoPost> spec= (root,query,cb)->{
            if(!searchBean.getNickname().isEmpty() || !searchBean.getEmail().isEmpty()){
                //root.join("member");
                root.fetch("member", JoinType.INNER); //fetch join 영속성에 저장되는 조인으로 효율이 좋음
            }
            return null;
        };
        if(!searchBean.getNickname().isEmpty()){
            spec=spec.and((root,query,cb)->{
                Join<InfoPost, Member> member=root.join("member");
                return cb.like(member.get("nickname"),"%"+searchBean.getNickname()+"%");
            });

        }
        if(!searchBean.getEmail().isEmpty()){
            spec=spec.and((root,query,cb)->{
                Join<InfoPost, Member> member=root.join("member");
                return cb.like(member.get("email"),"%"+searchBean.getEmail()+"%");
            });

        }
        if(!searchBean.getTitle().isEmpty()){
            spec=spec.and((root,query,cb)->cb.like(root.get("title"),"%"+searchBean.getTitle()+"%"));
        }
        if(!searchBean.getContent().isEmpty()){
            spec=spec.and((root,query,cb)->cb.like(root.get("content"),"%"+searchBean.getContent()+"%"));
        }
        if(searchBean.getStartAt()!=null && searchBean.getEndAt()!=null){
            spec=spec.and((root,query,cb)->cb.between(root.get("createdAt"),searchBean.getStartAt(),searchBean.getEndAt()));
        }
        infoPostPage=infoPostRepository.findAll(spec,pageable);
        return infoPostPage;
    }
    Page<InfoPost> searchSpec2(InfoPostSearchBean searchBean,Pageable pageable) {
        Specification<InfoPost> spec = Specification.allOf(InfoPostSpecification.fetchMember())
                .and(InfoPostSpecification.titleContains(searchBean.getTitle()))
                .and(InfoPostSpecification.contentContains(searchBean.getContent()))
                .and(InfoPostSpecification.categoryContains(searchBean.getCategoryId()))
                .and(InfoPostSpecification.nicknameContains(searchBean.getNickname()))
                .and(InfoPostSpecification.emailContains(searchBean.getEmail()))
                .and(InfoPostSpecification.betweenCreatedAt(searchBean.getStartAt(), searchBean.getEndAt()));

        Page<InfoPost> page = infoPostRepository.findAll(spec, pageable);
        return page;
    }

    /**JpaSpecificationExecutor (Specification) : JPA 동적쿼리*
     * JPA 동적 쿼리를 구현하기 위한 Spring Data JPA의 공식 기능
     * 개념 요약
     * 	•	Specification: 조건(Predicate)을 조립해 동적 쿼리를 만드는 인터페이스
     * 	•	JpaSpecificationExecutor: Specification을 적용해 DB 조회할 수 있는 Repository 확장 기능
     * 	•	Criteria API 기반으로 내부 쿼리를 생성
     * 	•	JPQL을 동적으로 조립하지 않아도 됨
     * 	•	동적 WHERE 조건, JOIN, 정렬까지 모두 가능
     *
     * 1. JpaSpecificationExecutor란?
     *
     * Spring Data JPA의 Repository에서 다음처럼 상속해 사용한다:
     * public interface InfoPostRepository  extends JpaRepository<InfoPost, Long>, JpaSpecificationExecutor<InfoPost> {}
     *
     * 제공 메서드
     * 	•	List<T> findAll(Specification<T> spec)
     * 	•	Page<T> findAll(Specification<T> spec, Pageable pageable)
     * 	•	List<T> findAll(Specification<T> spec, Sort sort)
     * 	•	long count(Specification<T> spec)
     * 	•	Optional<T> findOne(Specification<T> spec)
     *
     * Specification만 만들어 넘기면 Spring Data JPA가 쿼리를 자동으로 생성해 실행한다.
     *
     * 2. Specification이란?
     * Specification은 동적으로 조립 가능한 WHERE 조건 블록이다.
     *
     * Specification<InfoPost> spec = (root, query, cb) -> {
     *     return cb.like(root.get("title"), "%스프링%");
     * };
     *
     * 파라미터 3개는 다음을 의미한다:
     * 	•	root → 현재 엔티티의 루트(= FROM InfoPost i)
     * 	•	query → JPA CriteriaQuery 객체
     * 	•	cb → CriteriaBuilder (AND, OR, LIKE 등 생성)
     *
     * 결과는 반드시 Predicate(조건식)여야 한다.
     *
     * 3. Specification 체인 방식 (동적 조립)
     *
     * Specification은 .and(), .or(), .where()로 조립할 수 있다.
     *
     * Specification<InfoPost> spec = Specification.where(null);
     *
     * if (!title.isEmpty()) {
     *     spec = spec.and((root, query, cb) ->
     *             cb.like(root.get("title"), "%" + title + "%"));
     * }
     * if (!nickname.isEmpty()) {
     *     spec = spec.and((root, query, cb) -> {
     *         Join<InfoPost, Member> member = root.join("member");
     *         return cb.like(member.get("nickname"), "%" + nickname + "%");
     *     });
     * }
     *
     * 4. Specification이 JPQL과 다른 점 (장점)
     *
     * ■ JPQL 동적 조립보다 안전
     * 문자열로 JPQL 만들면 파라미터 위치 실수, 띄어쓰기 실수 발생함.
     * Specification은 정적 타입 기반으로 작성되기 때문에 컴파일러가 검사해줌.
     *
     * ■ null / empty 조건 제외가 편함
     * 조건을 넣지 않으면 간단히 .and()를 호출하지 않으면 됨.
     *
     * ■ JOIN 구조도 동적으로 조립 가능
     *  join(“member”) 수행.
     *
     * ■ 페이징 + 정렬 그대로 사용 가능
     * findAll(spec, pageable)로 끝.
     *
     *
     * 5. Specification 내부 동작 (어떻게 쿼리를 만들까?)
     *
     * Specification의 핵심 메서드:
     * Predicate toPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder cb);
     **
     * Spring Data JPA는 다음 흐름으로 동작한다:
     * 	1.	JpaSpecificationExecutor.findAll() 호출
     * 	2.	CriteriaBuilder 생성
     * 	3.	CriteriaQuery 생성
     * 	4.	root 생성 (FROM InfoPost i)
     * 	5.	모든 Specification을 순서대로 실행
     * 	6.	각 spec에서 반환된 Predicate를 AND/OR로 조합
     * 	7.	JPA 구현체(Hibernate)가 실제 SQL로 변환
     * 	8.	DB에서 실행
     *
     * Specification = CriteriaBuilder로 만들어진 “조건 객체”
     *
     *
     * 6. 실전: JOIN + 동적 LIKE + 날짜 검색 포함 Specification 전체 예시
     *
     * Specification<InfoPost> spec = Specification.where((root, query, cb) -> {
     *     if (query.getResultType() != Long.class) { //Specification 은 쿼리를 2개 만드는데 페이징을 위한 count 쿼리를 제외하고 조인함
     *         root.fetch("member", JoinType.INNER); // fetch join
     *     }
     *     return null; //where 절을 추가하지 않음
     * });
     *
     * // title
     * if (!title.isEmpty()) {
     *     spec = spec.and((root, query, cb) ->
     *             cb.like(root.get("title"), "%" + title + "%"));
     * }
     *
     * // nickname (JOIN)
     * if (!nickname.isEmpty()) {
     *     spec = spec.and((root, query, cb) -> {
     *         Join<InfoPost, Member> member = root.join("member");
     *         return cb.like(member.get("nickname"), "%" + nickname + "%");
     *     });
     * }
     *
     * // date
     * if (startAt != null && endAt != null) {
     *     spec = spec.and((root, query, cb) ->
     *             cb.between(root.get("createdAt"), startAt, endAt));
     * }
     *
     * Repository 호출:
     *
     * Page<InfoPost> page = infoPostRepository.findAll(spec, pageable);
     *
     *
     *
     * 7. 주의해야 할 점
     *
     * 1) fetch join을 count 쿼리에 넣으면 안 됨
     * Spring Data JPA는 페이징 시 count 쿼리와 content 쿼리를 따로 만듦.
     * count 쿼리에 fetch join 넣으면 오류 발생함.
     **
     * if (query.getResultType() != Long.class) {
     *     root.fetch("member", JoinType.INNER);
     * }
     *
     * 이 패턴이 거의 표준이다.
     *
     * 2) Specification은 동적 조인
     * join()은 필요한 조건이 있을 때만 실행해야 한다.
     * 예: cb.like(root.join("member").get("email"), "%gmail%")

     *
     * 3) order by는 Pageable 사용 권장  : Specification 내부에서 query.orderBy()를 직접 쓰면 충돌 위험 있음.
     *
     * 8. 언제 Specification을 사용해야 하는가?
     * 조건 많고 동적이고 조인 필요	Specification (가장 실무적)
     * 복잡한 조합 + 도메인 DSL 필요	QueryDSL
     * Specification은 JPQL 동적 쿼리의 완전한 대체 기능이다.
     *
     * 9. 결론
     * JpaSpecificationExecutor와 Specification은
     * JPA 동적 쿼리를 타입 안정성 + 조건 조립 형태로 구현하는 최적의 도구이다.
     * 	•	문자열 JPQL 없이 동적 where 조건 조립
     * 	•	join, like, between 모두 가능
     * 	•	pageable, sort 완벽 호환
     * 	•	유지보수성 매우 높음
     * 	•	QueryDSL이 없다면 실무에서 가장 많이 쓰는 방식
     **/



    @Override
    public Optional<InfoPost> getInfoPostDetail(Long postId) {
        return infoPostRepository.findById(postId);
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
