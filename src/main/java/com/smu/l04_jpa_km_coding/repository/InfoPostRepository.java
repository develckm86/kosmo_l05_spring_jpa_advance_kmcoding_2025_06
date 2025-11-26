package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.InfoPost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Optional;


@Repository
public interface InfoPostRepository extends JpaRepository<InfoPost, Long> , JpaSpecificationExecutor<InfoPost> {


    Page<InfoPost> findAll(Pageable pageable);

    Page<InfoPost> findByCategoryId(String categoryId,Pageable pageable);

    /**findByTitleContainingAndContentContaining 생성될 쿼리
     * SELECT * FROM info_post WHERE title LIKE '%title%' AND content LIKE '%content%'
     *    Page<InfoPost> findByTitleContaining(String title, Pageable pageable);
     *    Page<InfoPost> findByContentContaining(String content, Pageable pageable);
     *    Page<InfoPost> findByCreatedAtContaining(LocalDateTime createAt, Pageable pageable);
     * */
    Page<InfoPost> findByTitleContainingAndContentContaining(String title,String content, Pageable pageable);



    Page<InfoPost> findByCategoryIdContaining(String categoryId,Pageable pageable);
    /**
     *  searchDynamic 동적 검색 :
     *      @Query + 동적 조건(field 값 비교)
     *      단일 검색어로 여러 필드를 검색
     *  주의점
     * 	    OR 조건이 많을수록 카디널리티가 높아져서 성능 저하 가능
     * 	    (1:N) JOIN FETCH 사용 시 페이징 불가능 (distinct + in-memory)
     * 	DATE를 문자열 LIKE로 검색
     * 	    TO_CHAR( i.createdAt, 'YYYY-MM-DD') LIKE  CONCAT('%',:search,'%')
     * 	    장점 : 날짜를 문자열처럼 검색 가능해 편리함
     *      단점
     * 	        인덱스가 절대 안 걸림 (함수 사용)
     * 	        무조건 full scan
     * 	        실무에서는 비추천
     * 	*/

    @Query("""
            SELECT i FROM InfoPost i WHERE 
                 ( :field = 'title' AND i.title LIKE CONCAT('%',:search,'%') ) 
              OR ( :field = 'content' AND i.content LIKE  CONCAT('%',:search,'%') ) 
              OR ( :field = 'nickname' AND i.member.nickname LIKE  CONCAT('%',:search,'%') )
              OR ( :field = 'createdAt' AND TO_CHAR( i.createdAt, 'YYYY-MM-DD') LIKE  CONCAT('%',:search,'%') )
              OR ( :categoryId IS NOT Null AND i.categoryId LIKE CONCAT('%',:categoryId,'%') )
            """)
    Page<InfoPost> searchDynamic( @Param("field") String field,
                                  @Param("search") String search,
                                  @Param("categoryId") String categoryId,
                                  Pageable pageable);
    /**
     * 동적 검색 2: 여러 입력값을 조합해 검색하는 방식
     *      입력받은 title, content, categoryId, tagId 등 여러 조건을 결합해 검색
     * 	    다중 조건 검색을 구현할 때 유용
     * 	    """
     *             SELECT i FROM InfoPost i  WHERE
     *                 i.title LIKE CONCAT('%',:title,'%') AND
     *                 i.content LIKE CONCAT('%',:content,'%') AND
     *                 i.categoryId LIKE CONCAT('%',:categoryId,'%') AND
     *                 i.member.nickname LIKE CONCAT('%',:nickname,'%') AND
     *                 i.member.email LIKE CONCAT('%',:email,'%') AND
     *                 i.createdAt BETWEEN :startAt AND :endAt
     *             """
     *
     * */
    //양식에서 여러개의 input 으로 다양한 필드 검색
    //25/11/23 00:31:05.606589
    @Query("""
            SELECT i FROM InfoPost i JOIN fetch i.member WHERE 
                ( TRIM(:title)='' OR i.title LIKE CONCAT('%',:title,'%'))
                AND ( TRIM(:content)=''  OR i.content LIKE CONCAT('%',:content,'%'))
                AND ( TRIM(:categoryId)='' OR i.categoryId LIKE CONCAT('%',:categoryId,'%'))
                AND ( TRIM(:nickname)='' OR i.member.nickname LIKE CONCAT('%',:nickname,'%'))
                AND ( TRIM(:email)=''  OR i.member.email LIKE CONCAT('%',:email,'%'))
                AND ( :startAt IS NULL OR :endAt IS NULL OR i.createdAt BETWEEN :startAt AND :endAt)
            """)
    Page<InfoPost> search(
            String title,
            String content,
            String categoryId,
            String nickname,
            String email,
            LocalDateTime startAt,
            LocalDateTime endAt,
            Pageable pageable);

    @Override
    Optional<InfoPost> findOne(Specification<InfoPost> spec);

    @Override
    Page<InfoPost> findAll(Specification<InfoPost> spec, Pageable pageable);


}
    /*
    Spring Data JPA 쿼리 메서드 키워드 정리

    1. 비교(Comparison)
	•	Is / Equals : 값이 같은지 (findByTitleIs)
	•	Not : 값이 다른지 (findByTitleNot)
	•	LessThan / LessThanEqual : <, ≤  (findByCreatedAtLessThan)
	•	GreaterThan / GreaterThanEqual : >, ≥
	•	Between : 범위 검색 (숫자, 날짜 모두 가능) (findByCreatedAtBetween(LocalDate start, LocalDate end))
	•	In / NotIn :여러 값 포함 여부 (findByCategoryIdIn(String[] categoryIds))

    2. 문자열(String)•	Containing : 부분 문자열 포함 (LIKE %value%)
	•	StartingWith : 앞부분 일치 (LIKE value%) (findByTitleStartingWith)
	•	EndingWith : 뒷부분 일치 (LIKE %value) (findByTitleEndingWith)
	•	Like / NotLike : 직접 LIKE 패턴 사용 (findByTitleLike("%java%"))
	•	IgnoreCase : 대소문자 무시 (findByTitleIgnoreCase)

	3. Null 체크
	•	IsNull / Null : NULL 인 값 (findByMemberIsNull)
	•	IsNotNull / NotNull : NOT NULL 값 (findByMemberIsNotNull)

    4. Boolean 필드
	•	True : true 값 (findByIsPublicTrue)
	•	False : false 값 (findByIsPublicFalse)

    5. 날짜(Date/Time)
	•	날짜 검색은 보통 비교 연산과 함께 사용
	•	After : 특정 날짜 이후 (findByCreatedAtAfter)
	•	Before : 특정 날짜 이전 (findByCreatedAtBefore)

    6. 정렬(Sorting)
	•	메서드 이름에 직접 정렬 가능
	•	OrderByFieldAsc (findByTitleOrderByCreatedAtAsc)
	•	OrderByCreatedAtDesc (findByOrderByCreatedAtDesc)

    7. 조건 연결
	•	And : 모두 만족 (findByTitleAndContent)
	•	Or : 하나 이상 만족 (findByTitleOrContent)

	8. 연관관계(Nested Property)
	• 연관 엔티티의 필드도 점(.) 대신 _ 로 탐색 가능: member.nickname = findByMember_Nickname
*/
