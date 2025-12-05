package com.smu.l04_jpa_km_coding.bean;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class QnaPostWriteValid {
    @NotBlank(message = "제목은 꼭 입력")
    private String title;
    @NotBlank(message = "컨텐츠는 꼭 입력")
    private String content;
    @Pattern(
            regexp = "^[a-zA-Z0-9가-힣, ]*$",
            message = "태그는 콤마로 구분된 문자, 숫자만 입력 가능합니다."
    )
    private String tags; //"java,spring,jpa"

    private MultipartFile[] images;
}
