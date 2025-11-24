package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.InfoPost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface InfoPostRepository extends JpaRepository<InfoPost, Long> {
    Page<InfoPost> findAll(Pageable pageable);
    Page<InfoPost> findByCategoryId(String categoryId,Pageable pageable);

    //backend
    //backend_springboot
    //backend_springboot_springdatajpa
    Page<InfoPost> findByCategoryIdContaining(String categoryId,Pageable pageable);
    //1개의 input 으로 다양한 필드 검색
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

    //양식에서 여러개의 input 으로 다양한 필드 검색
    //25/11/23 00:31:05.606589
    @Query("""
            SELECT i FROM InfoPost i JOIN FETCH i.infoPostTags t WHERE 
                i.title LIKE CONCAT('%',:title,'%') AND 
                i.content LIKE CONCAT('%',:content,'%') AND 
                i.categoryId LIKE CONCAT('%',:categoryId,'%') AND 
                i.member.nickname LIKE CONCAT('%',:categoryId,'%') AND 
                t.tagId LIKE CONCAT('%',:tagId,'%') AND 
                TO_CHAR(i.createdAt,'YYYY-MM-dd') LIKE CONCAT(:createdAtStr,'%') 
            """)
    Page<InfoPost> search(
            String title,
            String content,
            String categoryId,
            String tagId,
            String createdAtStr,
            Pageable pageable);


//    /*SELECT * FROM info_post WHERE title LIKE '%title%' AND content LIKE '%content%'*/
    Page<InfoPost> findByTitleContainingAndContentContaining(String title,String content, Pageable pageable);
//    Page<InfoPost> findByTitleContaining(String title, Pageable pageable);
//    Page<InfoPost> findByContentContaining(String content, Pageable pageable);
//    Page<InfoPost> findByCreatedAtContaining(LocalDateTime createAt, Pageable pageable);
}
