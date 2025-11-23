package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.InfoPost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface InfoPostRepository extends JpaRepository<InfoPost, Long> {
    Page<InfoPost> findAll(Pageable pageable);
    //25/11/23 00:31:05.606589
    @Query("SELECT i FROM InfoPost i WHERE " +
            "i.title LIKE CONCAT('%',:title,'%') AND " +
            "i.content LIKE CONCAT('%',:content,'%') AND "+
            "TO_CHAR(i.createdAt,'YYYY-MM-dd') LIKE CONCAT(:createdAtStr,'%')"
    )
    Page<InfoPost> search(String title,String content,String createdAtStr, Pageable pageable);

    @Query("SELECT i FROM InfoPost i JOIN FETCH i.infoPostTags t WHERE " +
            "i.title LIKE CONCAT('%',:title,'%') AND " +
            "i.content LIKE CONCAT('%',:content,'%') AND "+
            "TO_CHAR(i.createdAt,'YYYY-MM-dd') LIKE CONCAT(:createdAtStr,'%') AND "+
            "t.tagId=:tag"
    )
    Page<InfoPost> search(String title,String content,String createdAtStr,String tag, Pageable pageable);

//    /*SELECT * FROM info_post WHERE title LIKE '%title%' AND content LIKE '%content%'*/
    Page<InfoPost> findByTitleContainingAndContentContaining(String title,String content, Pageable pageable);
//    Page<InfoPost> findByTitleContaining(String title, Pageable pageable);
//    Page<InfoPost> findByContentContaining(String content, Pageable pageable);
//    Page<InfoPost> findByCreatedAtContaining(LocalDateTime createAt, Pageable pageable);
}
