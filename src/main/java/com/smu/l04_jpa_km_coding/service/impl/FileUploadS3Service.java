package com.smu.l04_jpa_km_coding.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.S3ClientBuilder;
import software.amazon.awssdk.services.s3.S3Configuration;
import software.amazon.awssdk.services.s3.model.*;


import java.io.IOException;
import java.net.URI;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Random;
import java.util.UUID;

@Service
public class FileUploadS3Service {
    @Value("${cloud.aws.credentials.access-key}")
    private String accessKey;
    @Value("${cloud.aws.credentials.secret-key}")
    private String secretKey;
    @Value("${cloud.aws.region.static}")
    private String region;
    @Value("${cloud.aws.s3.bucket}")
    private String bucket;
    @Value("${cloud.aws.endpoint}")
    private String endpoint;


    private String PATH_PREFIX = "public/img/";

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final String[] imageTypes = {
            "png", "jpg", "jpeg", "webp", "gif", "bmp", "tiff", "svg"
    };
    //s3 버킷에 접속
    private S3Client s3Client() {
        //객체 생성시 접속
        S3ClientBuilder builder= S3Client.builder()
                .region(Region.of(region))
                .credentialsProvider(
                        StaticCredentialsProvider.create(
                                AwsBasicCredentials.create(accessKey, secretKey)
                        )
                );
        if (endpoint != null) {// LocalStack에서는 필수
            builder.endpointOverride(URI.create(endpoint))
                    .serviceConfiguration(
                            S3Configuration.builder()
                                    .pathStyleAccessEnabled(true)
                                    .checksumValidationEnabled(false)
                                    .chunkedEncodingEnabled(false)
                                    .build()
                    );
        }
        return builder.build();
    }
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
    public String uploadProfileImage(MultipartFile file, String filename) throws IOException {
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
        s3Client().putObject(
                putObjectRequest,
                RequestBody.fromInputStream(file.getInputStream(), file.getSize()
        ));
        return fileName;
    }


    public void delete(String fileUrl) {
        DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
                .bucket(bucket)
                .key(fileUrl)
                .build();


        s3Client().deleteObject(deleteObjectRequest);
        logger.info("S3 파일 삭제 : {}", fileUrl);
    }


}