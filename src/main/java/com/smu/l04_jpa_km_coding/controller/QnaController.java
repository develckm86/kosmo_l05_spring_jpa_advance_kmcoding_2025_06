package com.smu.l04_jpa_km_coding.controller;

import com.smu.l04_jpa_km_coding.entity.QnaPost;
import com.smu.l04_jpa_km_coding.service.QnaService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/qna")
@AllArgsConstructor
@Slf4j
public class QnaController {

    private final QnaService qnaService;
    //private static Logger log = LoggerFactory.getLogger(this.getClass());

    // 질문 리스트/검색
    @GetMapping("/list.do")
    public String list(
            Model model,
            @PageableDefault(page = 0, size = 2, sort = "id",direction = Sort.Direction.DESC) Pageable pageable,
            @RequestParam(defaultValue="") String search,
            @RequestParam(defaultValue="") String field
    ) {
        model.addAttribute("keyword", "안녕!");
        Page<QnaPost> qnaPostPage=null;
        if(!search.isEmpty() && !field.isEmpty()){
            qnaPostPage=qnaService.getQanPosts(search, field, pageable);
        }else{
            qnaPostPage=qnaService.getQnaPosts(pageable);
        }

        model.addAttribute("qnaPostPage", qnaPostPage);
        log.info("qnaPostPage.content : {}", qnaPostPage.getContent());
        return "qna/list";
    }

    // 질문 작성 폼
    @GetMapping("/write.do")
    public String writeForm() {
        return "qna/write";
    }

    // 질문 작성 액션
    @PostMapping("/write.do")
    public String writeSubmit() {
        return "redirect:/qna/list.do";
    }

    // 질문 수정 폼
    @GetMapping("/edit.do")
    public String editForm(@RequestParam Long id, Model model) {
        model.addAttribute("postId", id);
        return "qna/edit";
    }

    // 질문 수정 액션
    @PostMapping("/edit.do")
    public String editSubmit(@RequestParam Long id) {
        return "redirect:/qna/" + id + "/detail.do";
    }

    // 질문 삭제
    @GetMapping("/{id}/remove.do")
    public String remove(@PathVariable Long id) {
        return "redirect:/qna/list.do";
    }

    // 질문 상세
    @GetMapping("/{id}/detail.do")
    public String detail(@PathVariable Long id, Model model) {
        model.addAttribute("postId", id);
        return "qna/detail";
    }

    // 질문 리액션 등록
    @PostMapping("/{id}/{react}/recation")
    public String react(@PathVariable Long id, @PathVariable String react) {
        return "redirect:/qna/" + id + "/detail.do";
    }

    // 질문 리액션 취소
    @DeleteMapping("/{id}/recation")
    public String cancelReact(@PathVariable Long id) {
        return "redirect:/qna/" + id + "/detail.do";
    }

    // 댓글 리스트
    @GetMapping("/comment/list.do")
    public String comments(@RequestParam Long postId,
                           @PageableDefault(size = 20) Pageable pageable,
                           @RequestParam(required = false) String sort,
                           Model model) {
        model.addAttribute("postId", postId);
        model.addAttribute("pageable", pageable);
        model.addAttribute("sort", sort);
        return "qna/detail";
    }

    // 댓글 작성
    @PostMapping("/comment/write.do")
    public String writeComment(@RequestParam Long postId,
                               @RequestParam(required = false) Long parentId) {
        return "redirect:/qna/" + postId + "/detail.do";
    }

    // 댓글 삭제
    @DeleteMapping("/{comment_id}/comment")
    public String removeComment(@PathVariable("comment_id") Long commentId, @RequestParam Long postId) {
        return "redirect:/qna/" + postId + "/detail.do";
    }

    // 답변 채택
    @PutMapping("/{id}/{comment_id}/comment/adopt")
    public String adopt(@PathVariable Long id, @PathVariable("comment_id") Long commentId) {
        return "redirect:/qna/" + id + "/detail.do";
    }

    // 답변 채택 취소
    @DeleteMapping("/{id}/{comment_id}/comment/adopt")
    public String cancelAdopt(@PathVariable Long id, @PathVariable("comment_id") Long commentId) {
        return "redirect:/qna/" + id + "/detail.do";
    }

    // 댓글 좋아요
    @PostMapping("/comment/{comment_id}/like")
    public String likeComment(@PathVariable("comment_id") Long commentId, @RequestParam Long postId) {
        return "redirect:/qna/" + postId + "/detail.do";
    }

    // 댓글 좋아요 취소
    @DeleteMapping("/comment/{comment_id}/like")
    public String cancelLikeComment(@PathVariable("comment_id") Long commentId, @RequestParam Long postId) {
        return "redirect:/qna/" + postId + "/detail.do";
    }
}
