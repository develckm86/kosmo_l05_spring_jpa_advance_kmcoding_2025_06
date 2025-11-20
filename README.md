# KM CODING – 전체 URL 구조 & DB TABLE MAP (Dynamic Server Resources)

## 1. HOME
`/` , `/index.html` [GET] — 홈 화면(로그인, 회원가입, 인기 정보글, 최신 질문)

## 2. INFO (정보공유 게시판)
- `/info/list.do?page=1&sort=createAt` [GET] — 정보글 리스트(20개 페이징)
- `/info/list.do?page=1&sort=createAt&search=엔터티+생성+법&field=title&tag=jpa` [GET] — 정보글 검색
- `/info/{id}/detail.do` [GET] — 정보 상세
    - `/info/{id}/like` [POST] — 좋아요 등록
    - `/info/{like_id}/like` [REMOVE] — 좋아요 취소
    - `/info/comment/list.do?page=1&sort=createAt` [GET] — 댓글 리스트(20개)
    - `/info/comment/write.do` [POST] — 댓글 작성
    - `/info/comment/{commentId}/remove.do` [REMOVE] — 댓글 삭제
        - `/info/comment/{comment_id}/like` [POST] — 댓글 좋아요
        - `/info/comment/{comment_id}/like` [REMOVE] — 댓글 좋아요 취소
- `/info/write.do` [GET] — 글 작성 폼
- `/info/write.do` [POST] — 글 작성 액션
- `/info/edit.do` [GET] — 글 수정 폼
- `/info/edit.do` [POST] — 글 수정 액션
- `/info/{id}/remove.do` [GET] — 글 삭제

---

## 3. QNA (질문 게시판)
- `/qna/list.do?page=1&sort=createAt` [GET] — 질문글 리스트(20개)
- `/qna/list.do?page=1&sort=createAt&search=엔터티생성&field=title&tag=jpa` [GET] — 질문 검색
- `/qna/{id}/detail.do` [GET] — 질문 상세
    - `/qna/{id}/{react}/recation` [POST] — 질문 리액션(공감·어려움·흥미·도움됨)
    - `/qna/{id}/recation` [REMOVE] — 리액션 삭제
    - `/qna/comment/list.do?page=1&sort=createAt` [GET] — 댓글 리스트
    - `/qna/comment/write.do` [POST] — 댓글 작성
    - `/qna/{comment_id}/comment` [REMOVE] — 댓글 삭제
        - `/qna/{id}/{comment_id}/comment/adopt` [PUT] — 답변 채택
        - `/qna/{id}/{comment_id}/comment/adopt` [REMOVE] — 채택 취소
        - `/qna/comment/{comment_id}/like` [POST] — 댓글 좋아요
        - `/qna/comment/{comment_id}/like` [REMOVE] — 댓글 좋아요 취소
- `/qna/write.do` [GET] — 질문 작성 폼
- `/qna/write.do` [POST] — 질문 작성 액션
- `/qna/edit.do` [GET] — 질문 수정 폼
- `/qna/edit.do` [POST] — 질문 수정 액션
- `/qna/{id}/remove.do` [GET] — 질문 삭제

---

## 4. TAG
- `/tag/list.do` [GET] — 태그 검색(게시글 작성/검색에 사용)

---

## 5. USER
- `/user/login.do` [POST] — 로그인
- `/user/logout.do` [GET] — 로그아웃
- `/user/signup.do` [GET] — 회원가입 폼
    - `/user/[memberId]/existId` [GET] — ID 중복확인
- `/user/signup.do` [POST] — 회원가입
- `/user/my.do` [GET] — 내 활동 내역 (로그인 세션 기반)
    - `/info/writer/list.do?page=1&sort=createAt&row=5` [GET] — 내가 작성한 정보글 Top5
    - `/info/writer/like` [POST] — 내가 '좋아요'한 정보글 Top5
    - `/info/comment/writer/list.do?page=1&sort=createAt&row=5` [GET] — 내가 작성한 댓글 Top5
    - `/info/comment/writer/like` [POST] — 내가 좋아요한 댓글 Top5
    - `/qna/writer/list.do?page=1&sort=createAt&row=5` [GET] — 내가 작성한 질문 Top5
    - `/qna/writer/recation` [POST] — 내가 리액션한 질문 Top5
- `/qna/comment/writer/list.do?page=1&sort=createAt&row=5` [GET] — 내가 작성한 질문 댓글 Top5
- `/qna/comment/writer/like` [POST] — 내가 좋아요한 질문 댓글 Top5

---

# KM_CODING – DB TABLE MAP

## MEMBER — 모든 기능의 공통 사용자 정보
`MEMBER (MEMBER_ID PK, EMAIL, PASSWORD, NICKNAME, CREATED_AT, UPDATED_AT)`

## TAG — 모든 게시판 공통 태그
`TAG (TAG_ID PK, NAME UK)`

---

## INFO 영역
### INFO_POST — 정보공유 게시글
`INFO_POST (POST_ID PK, MEMBER_ID FK, TITLE, CONTENT, CREATED_AT, UPDATED_AT)`

### INFO_LIKE — 정보게시글 좋아요
`INFO_LIKE (LIKE_ID PK, POST_ID FK, MEMBER_ID FK, POST_ID+MEMBER_ID UK)`

### INFO_COMMENT — 정보댓글/대댓글
`INFO_COMMENT (COMMENT_ID PK, POST_ID FK, MEMBER_ID FK, CONTENT, PARENT_ID FK, CREATED_AT)`

### INFO_COMMENT_LIKE — 댓글 좋아요
`INFO_COMMENT_LIKE (LIKE_ID PK, COMMENT_ID FK, MEMBER_ID FK, COMMENT_ID+MEMBER_ID UK)`

### INFO_POST_TAG — 정보글 N:N 태그 매핑
`INFO_POST_TAG (MAP_ID PK, POST_ID FK, TAG_ID FK, POST_ID+TAG_ID UK)`

---

## QNA 영역
### QNA_POST — 질문글
`QNA_POST (POST_ID PK, MEMBER_ID FK, TITLE, CONTENT, CREATED_AT, UPDATED_AT)`

### QNA_REACTION — 질문 리액션(공감,어려움,흥미로움,도움됨)
`QNA_REACTION (LIKE_ID PK, REACTION_TYPE CHECK, POST_ID FK, MEMBER_ID FK, POST_ID+MEMBER_ID UK)`

### QNA_COMMENT — 질문 댓글/답변
`QNA_COMMENT (COMMENT_ID PK, POST_ID FK, MEMBER_ID FK, CONTENT, PARENT_ID FK, CREATED_AT)`

### QNA_COMMENT_LIKE — 질문 댓글 좋아요
`QNA_COMMENT_LIKE (LIKE_ID PK, COMMENT_ID FK, MEMBER_ID FK, COMMENT_ID+MEMBER_ID UK)`

### QNA_ADOPT — 질문 채택
`QNA_ADOPT (ADOPT_ID PK, POST_ID FK, COMMENT_ID FK, POST_ID+COMMENT_ID UK, CREATED_AT)`

### QNA_POST_TAG — 질문글 태그 매핑
`QNA_POST_TAG (MAP_ID PK, TAG_ID FK, POST_ID FK, TAG_ID+POST_ID UK)`

---

# 서비스 인터페이스 명세 (README 기반)
컨트롤러에서 사용할 서비스 계약 요약(기본 페이지 사이즈 20 가정).

## MemberService
- `Member login(String email, String password)` — 로그인
- `void logout(Long memberId)` — 로그아웃
- `Member signup(Member member)` — 회원가입
- `Member updateNickname(Long memberId, String nickname)` — 닉네임 수정
- `void delete(Long memberId)` — 회원 탈퇴
- `Member getMember(Long memberId)` — ID로 조회
- `Member getMember(String email)` — 이메일로 조회
- `boolean existsByEmail(String email)` — 이메일 중복 확인
- `Member getMyProfile(Long memberId)` — 내 정보 조회

## InfoService
- `Page<InfoPost> getInfoPosts(Pageable pageable, String search, String field, String tag)` — 정보글 목록/검색
- `InfoPost getInfoPostDetail(Long postId)` — 정보글 상세
- `InfoLike likeInfoPost(Long memberId, Long postId)` / `void cancelInfoPostLike(Long likeId)` — 정보글 좋아요 등록/취소
- `Page<InfoComment> getInfoComments(Long postId, Pageable pageable)` — 댓글 목록
- `InfoComment writeInfoComment(InfoComment infoComment)` / `void removeInfoComment(Long commentId)` — 댓글 작성/삭제
- `InfoCommentLike likeInfoComment(Long memberId, Long commentId)` / `void cancelInfoCommentLike(Long likeId)` — 댓글 좋아요 등록/취소
- `InfoPost writeInfoPost(InfoPost infoPost, Set<Long> tagIds)` / `InfoPost editInfoPost(InfoPost infoPost, Set<Long> tagIds)` / `void removeInfoPost(Long postId)` — 정보글 작성/수정/삭제
- `Page<InfoPost> getMyWrittenInfoPosts(Long memberId, Pageable pageable)` — 내가 작성한 정보글
- `Page<InfoPost> getMyLikedInfoPosts(Long memberId, Pageable pageable)` — 내가 좋아요한 정보글
- `Page<InfoComment> getMyWrittenInfoComments(Long memberId, Pageable pageable)` — 내가 작성한 댓글
- `Page<InfoComment> getMyLikedInfoComments(Long memberId, Pageable pageable)` — 내가 좋아요한 댓글

## QnaService
- `Page<QnaPost> getQnaPosts(Pageable pageable, String search, String field, String tag)` — 질문글 목록/검색
- `QnaPost getQnaPostDetail(Long postId)` — 질문 상세
- `QnaReaction reactToQnaPost(Long memberId, Long postId, String reactionType)` / `void cancelQnaReaction(Long reactionId)` — 질문 리액션 등록/취소
- `Page<QnaComment> getQnaComments(Long postId, Pageable pageable)` — 질문 댓글 목록
- `QnaComment writeQnaComment(QnaComment qnaComment)` / `void removeQnaComment(Long commentId)` — 댓글 작성/삭제
- `QnaAdopt adoptAnswer(Long postId, Long commentId)` / `void cancelAdopt(Long adoptId)` — 답변 채택/취소
- `QnaCommentLike likeQnaComment(Long memberId, Long commentId)` / `void cancelQnaCommentLike(Long likeId)` — 댓글 좋아요 등록/취소
- `QnaPost writeQnaPost(QnaPost qnaPost, Set<Long> tagIds)` / `QnaPost editQnaPost(QnaPost qnaPost, Set<Long> tagIds)` / `void removeQnaPost(Long postId)` — 질문글 작성/수정/삭제
- `Page<QnaPost> getMyWrittenQnaPosts(Long memberId, Pageable pageable)` — 내가 작성한 질문글
- `Page<QnaPost> getMyReactedQnaPosts(Long memberId, Pageable pageable)` — 내가 리액션한 질문글
- `Page<QnaComment> getMyWrittenQnaComments(Long memberId, Pageable pageable)` — 내가 작성한 질문 댓글
- `Page<QnaComment> getMyLikedQnaComments(Long memberId, Pageable pageable)` — 내가 좋아요한 질문 댓글

## TagService
- `List<Tag> searchTags(String keyword)` — 태그 검색/자동완성
