package com.smu.l04_jpa_km_coding.controller;

import com.smu.l04_jpa_km_coding.entity.InfoComment;
import com.smu.l04_jpa_km_coding.service.InfoCommentService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/info/comment")
@AllArgsConstructor(onConstructor_ = @Autowired)
public class InfoCommentRestController {
    private final InfoCommentService infoCommentService;

    // 댓글 리스트
    @GetMapping("/{postId}")
    public ResponseEntity<Page<InfoComment>> comments(
            @PathVariable Long postId,
            @PageableDefault(size = 5) Pageable pageable,
            Model model) {
        ResponseEntity<Page<InfoComment>> responseEntity = null;
        try {
            Page<InfoComment> comments = infoCommentService.getInfoComments(postId, pageable);
            responseEntity = ResponseEntity.ok(comments);
        }catch (Exception e){
            e.printStackTrace();
            responseEntity = ResponseEntity.badRequest().build();
        }
        return responseEntity;
    }

    // 댓글 작성
    @PostMapping("/comment/write.do")
    public String writeComment(@RequestParam Long postId,
                               @RequestParam(required = false) Long parentId) {
        return "redirect:/info/" + postId + "/detail.do";
    }

    // 댓글 삭제
    @DeleteMapping("/comment/{commentId}/remove.do")
    public String removeComment(@PathVariable Long commentId, @RequestParam Long postId) {
        return "redirect:/info/" + postId + "/detail.do";
    }

    // 댓글 좋아요
    @PostMapping("/comment/{commentId}/like")
    public String likeComment(@PathVariable Long commentId, @RequestParam Long postId) {
        return "redirect:/info/" + postId + "/detail.do";
    }

    // 댓글 좋아요 취소
    @DeleteMapping("/comment/{commentId}/like")
    public String cancelCommentLike(@PathVariable Long commentId, @RequestParam Long postId) {
        return "redirect:/info/" + postId + "/detail.do";
    }

}
