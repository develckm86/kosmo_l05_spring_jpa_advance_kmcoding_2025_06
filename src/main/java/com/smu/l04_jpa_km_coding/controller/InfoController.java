package com.smu.l04_jpa_km_coding.controller;

import com.smu.l04_jpa_km_coding.bean.InfoPostSearchBean;
import com.smu.l04_jpa_km_coding.entity.Category;
import com.smu.l04_jpa_km_coding.entity.InfoComment;
import com.smu.l04_jpa_km_coding.entity.InfoPost;
import com.smu.l04_jpa_km_coding.repository.CategoryRepository;
import com.smu.l04_jpa_km_coding.repository.InfoPostRepository;
import com.smu.l04_jpa_km_coding.service.CategoryService;
import com.smu.l04_jpa_km_coding.service.InfoPostService;
import com.smu.l04_jpa_km_coding.service.impl.CategoryServiceImp;
import com.smu.l04_jpa_km_coding.service.impl.InfoPostServiceImp;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Slf4j
@Controller
@RequestMapping("/info")
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class InfoController {
    private final InfoPostServiceImp infoPostService;
    private final CategoryServiceImp categoryService;
    //private static Logger log = LoggerFactory.getLogger(this.getClass()); //@Slf4j
    // 정보글 리스트/검색
    @GetMapping("/list.do")
    public String list(@PageableDefault(size = 10,page = 0,sort = "createdAt",direction = Sort.Direction.DESC) Pageable pageable,
                       @RequestParam(defaultValue = "") String categoryId,
                       @RequestParam(defaultValue = "") String search,
                       @RequestParam(defaultValue = "") String field,
                       Model model) {
        model.addAttribute("pageable", pageable);
        model.addAttribute("categoryId", categoryId);

        Page<InfoPost> infoPostPage=null;
        if(!field.isEmpty() && !search.isEmpty()){
            infoPostPage =infoPostService.getInfoPosts(field, search, categoryId, pageable);
        }else {
            infoPostPage = infoPostService.getInfoPosts(categoryId, pageable);
        }
        model.addAttribute("infoPostPage", infoPostPage);
        if(!categoryId.isEmpty()){
            Optional<Category> categoryOpt=categoryService.getOne(categoryId);
            categoryOpt.ifPresent(category -> model.addAttribute("category", category));
        }

        return "info/list";
    }
    // 정보글 상세
    @GetMapping("/{id}/detail.do")
    public String detail(@PathVariable Long id,
                         @PageableDefault(size = 20, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable,
                         Model model) {
        model.addAttribute("postId", id);
        Optional<InfoPost> infoPostOpt=infoPostService.getInfoPostDetail(id);
        if(infoPostOpt.isEmpty()){
            model.addAttribute("errorMessage", "존재하지 않는 게시물입니다.");
            return "info/detail";
        }

        InfoPost infoPost = infoPostOpt.get();
        Page<InfoComment> commentPage = paginateComments(infoPost.getInfoComments(), pageable);

        model.addAttribute("infoPost", infoPost);
        model.addAttribute("commentPage", commentPage);
        return "info/detail";
    }
    @GetMapping("/search.do")
    public String search(
            Model model,
            @ModelAttribute InfoPostSearchBean infoPostSearchBean,
            @PageableDefault(size = 10,page =0, sort = "createdAt",direction = Sort.Direction.DESC) Pageable pageable) {
        Page<InfoPost> infoPostPage=infoPostService.getInfoPosts(infoPostSearchBean, pageable);
        List<Category> categories=categoryService.getCategories();
        model.addAttribute("categories", categories);
        model.addAttribute("infoPostPage", infoPostPage);
        return "info/search";
    }


    // 정보글 작성 폼
    @GetMapping("/write.do")
    public String writeForm() {
        return "info/write";
    }
    // 정보글 작성 폼

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

    /**
     * 간단한 in-memory 페이징 유틸 (별도 댓글 리포지토리/서비스가 준비되지 않은 상태 고려)
     */
    private Page<InfoComment> paginateComments(java.util.Set<InfoComment> comments, Pageable pageable) {
        List<InfoComment> sorted = new ArrayList<>();
        if (comments != null) {
            sorted = comments.stream()
                    .sorted(Comparator.comparing(InfoComment::getCreatedAt, Comparator.nullsLast(Comparator.naturalOrder())).reversed())
                    .toList();
        }

        int start = Math.min((int) pageable.getOffset(), sorted.size());
        int end = Math.min(start + pageable.getPageSize(), sorted.size());
        List<InfoComment> pageContent = sorted.subList(start, end);

        return new org.springframework.data.domain.PageImpl<>(pageContent, pageable, sorted.size());
    }
}
