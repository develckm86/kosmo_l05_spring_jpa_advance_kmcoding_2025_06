package com.smu.l04_jpa_km_coding.bean;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class InfoPostSearchBean {
    private String title;
    private String content;
    private String categoryId;
    private String nickname;
    private String email;
    private LocalDateTime startAt;
    private LocalDateTime endAt;
}
