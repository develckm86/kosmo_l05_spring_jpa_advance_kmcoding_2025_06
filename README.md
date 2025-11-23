## KM CODING 사이트의 목적

이 웹 애플리케이션은 개발 학습자들이 회원가입 후 자유롭게 질문을 남기거나 정보를 공유할 수 있는 커뮤니티 기반 학습 플랫폼이다.  
사용자는 자신이 고민하는 개발 문제를 질문으로 등록하거나, 유용한 기술 정보를 글 형태로 공유할 수 있다.  
각 게시글에는 댓글로 소통할 수 있으며, 좋아요 기능을 통해 공감하거나 추천할 수 있다.

주요 기능:
- 회원가입 및 로그인
- 정보 공유 게시판 (Info)
- 질문/답변 게시판 (QnA)
- 댓글 작성 및 삭제
- 게시글 좋아요 기능
- 태그 기반 분류 및 검색
- Oracle DB + Spring Boot 기반 실전 개발 학습 환경 제공

## 교육 내용(Backend 중심)

- Spring Boot 기반 웹 서비스 개발
- JPA 및 연관관계 매핑(1:N, N:1, 양방향/단방향)
- JPA QueryDSL을 활용한 동적 검색 및 조건 필터링
- Service Layer 설계 및 트랜잭션 처리
- JUnit 단위 테스트 기반 서비스 검증
- JPA `Page` 객체를 활용한 페이징 처리
- 고급 페이징: 검색 + 정렬 + 페이지 이동 + 스크롤 페이징(AJAX)
- 댓글 CRUD, 게시글 좋아요 기능, 중복 체크 로직
- Oracle DB 기반 실전 DDL/쿼리 실행 및 데이터 모델링
- Thymeleaf 템플릿 엔진 사용
- `thymeleaf-layout-dialect` 기반 레이아웃 구조 설계
- 파일 업로드(멀티파트 업로드, 저장 경로 관리)
- Toast UI Editor/Viewer를 활용한 게시글 작성 및 렌더링
- AJAX 기반 비동기 요청 처리
- Bootstrap 기반 UI 구성
- JavaScript는 **바닐라 JS** 기반으로 구현(프레임워크 의존 X)

## 종합 목표

이 프로젝트는 단순 기능 구현이 아닌,  
“백엔드 아키텍처 → 서비스 로직 → DB 설계 → 테스트 → 프론트엔드 템플릿 구성 → 비동기 처리”  
까지 실제 서비스 개발에 필요한 전 과정을 학습하는 것을 목표로 한다.

학생들은 이 프로젝트를 통해  
실전에 가까운 구조를 경험하고, 개발 전반을 이해하며,  
팀 개발과 실제 서비스 개발에서 요구되는 기술을 자연스럽게 습득하게 된다.


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

---

## TAG — 모든 게시판에 여러개 작성가능한 해시태그
`TAG (TAG_ID PK)`

## CATEGORY — 모든 게시판의 카테고리 설정 예) TAG(development,개발,null),(backend, 서버개발, development),(java, 자바, backend) 
`TAG (CATEGORY_ID PK, NAME UK, PARENT_ID FK)`

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
컨트롤러에서 사용할 서비스 계약 요약(기본 페이지 사이즈 20 가정). 실제 메서드 시그니처는 `service/` 인터페이스를 기준으로 한다.

## MemberService
- `Member login(String email, String password)` — 로그인
- `void logout(Long memberId)` — 로그아웃
- `Member signup(Member member)` — 회원가입
- `Member modfiy(Member member)` — 회원 수정(닉네임/비밀번호/이메일)
- `void delete(Long memberId)` — 회원 탈퇴
- `Member getMember(Long memberId)` — ID로 조회
- `Member getMember(String email)` — 이메일로 조회
- `boolean existsByEmail(String email)` — 이메일 중복 확인
- `Member getMyProfile(Long memberId)` — 내 정보 조회

## InfoService (게시판/마이페이지)
- `Page<InfoPost> getInfoPosts(Pageable pageable)` — 정보글 목록
- `Page<InfoPost> getInfoPosts(Pageable pageable, String search, String field, String tag)` — 정보글 검색
- `InfoPost getInfoPostDetail(Long postId)` — 정보글 상세
- `InfoPost writeInfoPost(InfoPost infoPost, Set<Long> tagIds)` — 정보글 작성
- `InfoPost editInfoPost(InfoPost infoPost, Set<Long> tagIds)` — 정보글 수정
- `void removeInfoPost(Long postId)` — 정보글 삭제
- `Page<InfoPost> getMyWrittenInfoPosts(Long memberId, Pageable pageable)` — 내가 작성한 정보글
- `Page<InfoPost> getMyLikedInfoPosts(Long memberId, Pageable pageable)` — 내가 좋아요한 정보글

## QnaService (게시판/마이페이지)
- `Page<QnaPost> getQnaPosts(Pageable pageable, String search, String field, String tag)` — 질문글 목록/검색
- `QnaPost getQnaPostDetail(Long postId)` — 질문 상세
- `QnaPost writeQnaPost(QnaPost qnaPost, Set<Long> tagIds)` — 질문글 작성
- `QnaPost editQnaPost(QnaPost qnaPost, Set<Long> tagIds)` — 질문글 수정
- `void removeQnaPost(Long postId)` — 질문글 삭제
- `Page<QnaPost> getMyWrittenQnaPosts(Long memberId, Pageable pageable)` — 내가 작성한 질문글
- `Page<QnaPost> getMyReactedQnaPosts(Long memberId, Pageable pageable)` — 내가 리액션한 질문글

## TagService
- `List<Tag> searchTags(String keyword)` — 태그 검색/자동완성

## InfoCommentService
- `Page<InfoComment> getInfoComments(Long postId, Pageable pageable)` — 정보글 댓글/대댓글 조회
- `InfoComment writeInfoComment(InfoComment infoComment)` — 정보글 댓글 작성
- `void removeInfoComment(Long commentId)` — 정보글 댓글 삭제
- `Page<InfoComment> getMyWrittenInfoComments(Long memberId, Pageable pageable)` — 내가 작성한 정보 댓글
- `Page<InfoComment> getMyLikedInfoComments(Long memberId, Pageable pageable)` — 내가 좋아요한 정보 댓글

## InfoLikeService
- `InfoLike likeInfoPost(Long memberId, Long postId)` — 정보글 좋아요 등록
- `void cancelInfoPostLike(Long likeId)` — 정보글 좋아요 취소

## InfoCommentLikerService
- `InfoCommentLike likeInfoComment(Long memberId, Long commentId)` — 정보 댓글 좋아요 등록
- `void cancelInfoCommentLike(Long likeId)` — 정보 댓글 좋아요 취소

## QnaCommentService
- `Page<QnaComment> getQnaComments(Long postId, Pageable pageable)` — 질문 댓글/답변 조회
- `QnaComment writeQnaComment(QnaComment qnaComment)` — 질문 댓글/답변 작성
- `void removeQnaComment(Long commentId)` — 질문 댓글 삭제
- `Page<QnaComment> getMyWrittenQnaComments(Long memberId, Pageable pageable)` — 내가 작성한 질문 댓글
- `Page<QnaComment> getMyAdoptedQnaComments(Long memberId, Pageable pageable)` — 내가 채택된 질문 댓글
- `Page<QnaComment> getMyLikedQnaComments(Long memberId, Pageable pageable)` — 내가 좋아요한 질문 댓글

## QnaCommentAdoptService
- `QnaAdopt adoptAnswer(Long postId, Long commentId)` — 질문 댓글 채택
- `void cancelAdopt(Long adoptId)` — 질문 댓글 채택 취소

## QnaCommentLikerService
- `QnaCommentLike likeQnaComment(Long memberId, Long commentId)` — 질문 댓글 좋아요 등록
- `void cancelQnaCommentLike(Long likeId)` — 질문 댓글 좋아요 취소

## QnaReactionService
- `QnaReaction reactToQnaPost(Long memberId, Long postId, String reactionType)` — 질문글 리액션 등록/변경
- `void cancelQnaReaction(Long reactionId)` — 질문글 리액션 취소
