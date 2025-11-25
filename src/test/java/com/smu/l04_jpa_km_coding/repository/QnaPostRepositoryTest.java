package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.QnaPost;
import org.junit.jupiter.api.Test;
import org.junit.platform.commons.logging.Logger;
import org.junit.platform.commons.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class QnaPostRepositoryTest {
    @Autowired
    private QnaPostRepository qnaPostRepository;
    @Test
    @Transactional(readOnly = true)
    void findAll() {
        System.out.println(qnaPostRepository.findAll());
    }

    @Test
    @Transactional(readOnly = true)
    void testFindAll() {
        Pageable pageable = PageRequest.of(0, 3, Sort.by("createdAt").descending());
        Page<QnaPost> qnaPostPage = qnaPostRepository.findAll(pageable);
        System.out.println(qnaPostPage.getNumber()); //현재페이지 (0페이지부터 시작)
        System.out.println(qnaPostPage.getSize()); //3
        System.out.println(qnaPostPage.getTotalPages()); //사이즈가 3일때 총 페이지수
        System.out.println(qnaPostPage.getTotalElements()); //row의 총 수
        System.out.println(qnaPostPage.getContent().size()); //List<QnaPost>
    }
}