package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.QnaImage;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class QnaImageRepositoryTest {
    @Autowired
    private QnaImageRepository qnaImageRepository;

    @Test
    void saveAll() {
        List<QnaImage> Imgs=new ArrayList();
        QnaImage img=new QnaImage();
        img.setPostId(1L);
        img.setImageUrl("/20251212_121212_12312_qna.png");
        Imgs.add(img);
        QnaImage img2=new QnaImage();
        img.setPostId(1L);
        img.setImageUrl("/20251212_121212_12314_qna.jpeg");
        Imgs.add(img);
        Iterable<QnaImage> saveAll = qnaImageRepository.saveAll(Imgs);
    }
    @Test
    void save() {
    }
}