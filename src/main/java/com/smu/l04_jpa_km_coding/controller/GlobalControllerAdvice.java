package com.smu.l04_jpa_km_coding.controller;

import com.smu.l04_jpa_km_coding.entity.Category;
import com.smu.l04_jpa_km_coding.service.CategoryService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@ControllerAdvice
@RequiredArgsConstructor
public class GlobalControllerAdvice {
    private final CategoryService categoryService;
    @Value("${cloud.aws.s3.bucket}")
    private String bucket;
    @Value("${cloud.aws.region.static}")
    private String region;
    @Value("${cloud.aws.endpoint}")
    private String endpoint;
    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryService.getCategories();
    }
    @ModelAttribute("imgServer")
    public String imgServer(){
        String fileUrl=null;
        if(endpoint==null){
            //https://[버킷명].s3.[버킷 위치].amazonaws.com/[파일 이름 및 경로]
            fileUrl = String.format("https://%s.s3.%s.amazonaws.com/", bucket, region);
        }else{
            fileUrl = endpoint+"/"+bucket+"/";  // http://localhost:4566/images
        }
        return fileUrl;
    }
}
