package com.smu.l04_jpa_km_coding.bean;

import jakarta.validation.constraints.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class InfoPostWriteBean {

    @NotBlank(message = "제목을 입력하세요.")
    @Size(max = 200, message = "제목은 200자 이내여야 합니다.")
    private String title;

    @NotBlank(message = "내용을 입력하세요.")
    private String content;

    private Long writerId;

    @Pattern(
            regexp = "^[a-zA-Z0-9가-힣, ]*$",
            message = "태그는 콤마로 구분된 문자, 숫자만 입력 가능합니다."
    )
    private String tags;

    // images[]는 선택이므로 validation optional
    private MultipartFile[] images;

    @Min(value = 0, message = "대표 이미지 index는 0 이상의 정수여야 합니다.")
    private Integer major;
}