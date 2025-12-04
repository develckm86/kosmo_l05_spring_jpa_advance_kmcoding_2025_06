package com.smu.l04_jpa_km_coding.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.*;
import software.amazon.awssdk.services.s3.presigner.S3Presigner;
import software.amazon.awssdk.services.s3.presigner.model.GetObjectPresignRequest;


import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Random;

@Service
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@Slf4j
public class FileUploadS3Service {
    @Value("${cloud.aws.s3.bucket}")
    private String bucket;

    private final S3Client s3Client;
    private final S3Presigner s3Presigner;
    private final String[] imageTypes = {
            "png", "jpg", "jpeg", "webp", "gif", "bmp", "tiff", "svg"
    };

    //요청시 받아온 파일이 이미지인지 확인 : 아니면 오류
    public void imgTypeTest(MultipartFile file) throws IOException {
        if (file.isEmpty()) throw new IOException("File is empty.");


        String[] contentType = file.getContentType().split("/");
        if (!contentType[0].equals("image"))
            throw new IOException("이미지만 저장 가능");


        boolean match = Arrays.stream(imageTypes).anyMatch(type -> contentType[1].equals(type));
        if (!match)
            throw new IOException("Only png, jpg, jpeg, webp files are allowed.");
    }

    //이미지 이름 작성 후 S3에 업로드
    public String upload(MultipartFile file, String filename) throws IOException {
        // 이미지인지 확인
        imgTypeTest(file);
        // image/png -> png
        String ext = file.getContentType().split("/")[1];

        //S3에 저장한 파일 객체 생성
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss"));
        int random = new Random().nextInt(9000) + 1000;

        String fileName = timestamp + "_" + random + "_" + filename + "." + ext;
        //20251203_224523_5721_info.png

        PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                .bucket(bucket)
                .key(fileName)
                .acl("public-read") // 공개 URL이 필요하면
                .contentType(file.getContentType())
                .build();
        //S3에 저장요청
        s3Client.putObject(
                putObjectRequest,
                RequestBody.fromInputStream(file.getInputStream(), file.getSize()
        ));
        log.info("S3 파일 생성 : {}", fileName);

        return fileName;
    }


    public void delete(String fileUrl) {
        DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
                .bucket(bucket)
                .key(fileUrl)
                .build();
        s3Client.deleteObject(deleteObjectRequest);
        log.info("S3 파일 삭제 : {}", fileUrl);
    }

    public String createPresignedGetUrl(String key) {

        GetObjectRequest getObjectRequest = GetObjectRequest.builder()
                .bucket(bucket)
                .key(key)
                .build();

        GetObjectPresignRequest presignRequest = GetObjectPresignRequest.builder()
                .signatureDuration(Duration.ofMinutes(10)) // 10분 유효
                .getObjectRequest(getObjectRequest)
                .build();


        return s3Presigner.presignGetObject(presignRequest)
                .url()
                .toString();
    }

}