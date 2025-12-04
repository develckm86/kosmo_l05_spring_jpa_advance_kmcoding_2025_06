package com.smu.l04_jpa_km_coding.service.impl;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockMultipartFile;
import software.amazon.awssdk.services.s3.model.S3Exception;

import java.io.IOException;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class FileUploadS3ServiceTest {

    @Autowired
    private FileUploadS3Service fileUploadS3Service;

    @Test
    @DisplayName("이미지 타입 검증 - 정상 처리")
    void testImgTypeValid() throws IOException {
        MockMultipartFile file = new MockMultipartFile(
                "file",
                "test.png",
                "image/png",
                "dummy".getBytes()
        );

        assertDoesNotThrow(() -> fileUploadS3Service.imgTypeTest(file));
    }

    @Test
    @DisplayName("이미지 타입 검증 - 잘못된 타입이면 예외")
    void testImgTypeInvalid() {
        MockMultipartFile file = new MockMultipartFile(
                "file",
                "test.txt",
                "text/plain",
                "dummy".getBytes()
        );

        Exception ex = assertThrows(IOException.class, () ->
                fileUploadS3Service.imgTypeTest(file)
        );

        System.out.println("오류 메시지: " + ex.getMessage());

        assertTrue(ex.getMessage().contains("이미지만 저장 가능"));
    }

    @Test
    @DisplayName("업로드 테스트")
    void testUpload() throws IOException {
        MockMultipartFile file = new MockMultipartFile(
                "file",
                "info.png",
                "image/png",
                "content".getBytes()
        );


        String fileName=fileUploadS3Service.upload(file, "info");
        System.out.println(fileName);
        //http://localhost:8333/images/+fileName
    }

    @Test
    @DisplayName("delete 호출 테스트 - 실제로는 S3Exception 발생(정상)")
    void testDelete() {
        S3Exception ex = assertThrows(S3Exception.class, () ->
                fileUploadS3Service.delete("test.png")
        );

        assertNotNull(ex);
    }

    @Test
    @DisplayName("Presigned URL 생성 테스트")
    void testPresignedUrl() {
        String url =fileUploadS3Service.createPresignedGetUrl("img/dog.png");
        System.out.println(url);
        //http://localhost:8333/images/img/dog.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20251204T064220Z&X-Amz-SignedHeaders=host&X-Amz-Credential=test%2F20251204%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Expires=600&X-Amz-Signature=52814c54cda76689224f19e153aae6b48cccb6a1abe4583958d5a0fda174c5f7
    }
}