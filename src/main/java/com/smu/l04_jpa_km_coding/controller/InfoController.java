package com.smu.l04_jpa_km_coding.controller;

import com.smu.l04_jpa_km_coding.entity.Category;
import com.smu.l04_jpa_km_coding.repository.CategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/info")
@RequiredArgsConstructor
public class InfoController {
    private final CategoryRepository categoryRepository;

    // 정보글 리스트/검색
    @GetMapping("/list.do")
    public String list(@PageableDefault(size = 20) Pageable pageable,
//                       @RequestParam(required = false) String sort,
                       @RequestParam(required = false) String search,
                       @RequestParam(required = false) String field,
                       @RequestParam(required = false) String tag,
                       Model model) {
        List<Category> categoriesLv1 = categoryRepository.findByParentIdIsNull();
        List<Category> categoriesLv2 = categoriesLv1.stream()
                .flatMap(c -> c.getCategories().stream())
                .toList();
        List<Category> categoriesLv3 = categoriesLv2.stream()
                .flatMap(c -> c.getCategories().stream())
                .toList();

        // TODO 서비스 연동 예정
        model.addAttribute("pageable", pageable);
//        model.addAttribute("sort", sort);
        model.addAttribute("search", search);
        model.addAttribute("field", field);
        model.addAttribute("tag", tag);
        model.addAttribute("categories", categoriesLv1);
        model.addAttribute("categoriesLv1", categoriesLv1);
        model.addAttribute("categoriesLv2", categoriesLv2);
        model.addAttribute("categoriesLv3", categoriesLv3);
        return "info/list";
    }

    // 정보글 작성 폼
    @GetMapping("/write.do")
    public String writeForm() {
        return "info/write";
    }

    // 정보글 작성 액션
    @PostMapping("/write.do")
    public String writeSubmit() {
        return "redirect:/info/list.do";
    }

    // 정보글 수정 폼
    @GetMapping("/edit.do")
    public String editForm(@RequestParam Long id, Model model) {
        model.addAttribute("postId", id);
        return "info/edit";
    }

    // 정보글 수정 액션
    @PostMapping("/edit.do")
    public String editSubmit(@RequestParam Long id) {
        return "redirect:/info/" + id + "/detail.do";
    }

    // 정보글 삭제
    @GetMapping("/{id}/remove.do")
    public String remove(@PathVariable Long id) {
        return "redirect:/info/list.do";
    }

    // 정보글 상세
    @GetMapping("/{id}/detail.do")
    public String detail(@PathVariable Long id,
                         Model model) {
        model.addAttribute("postId", id);
        return "info/detail";
    }

    // 좋아요 등록
    @PostMapping("/{id}/like")
    public String like(@PathVariable Long id) {
        return "redirect:/info/" + id + "/detail.do";
    }

    // 좋아요 취소
    @DeleteMapping("/{likeId}/like")
    public String cancelLike(@PathVariable Long likeId, @RequestParam Long postId) {
        return "redirect:/info/" + postId + "/detail.do";
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
        return "info/detail";
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
