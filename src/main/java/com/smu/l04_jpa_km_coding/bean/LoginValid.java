package com.smu.l04_jpa_km_coding.bean;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.Getter;

@Data
public class LoginValid {
    @NotBlank(message = "이메일은 꼭 입력해야합니다.")  //null "" 검사
    @Email(message = "이메일 형식이 잘못되었습니다.") // [a-z]@[a-z](정규식)
    private String email;
    @NotBlank(message = "패스워드는 꼭 입력해야합니다.")
    private String password;
}
