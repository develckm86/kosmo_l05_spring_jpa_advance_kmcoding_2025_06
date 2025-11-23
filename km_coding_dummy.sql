-- 전체적으로 다음 “스토리 콘셉트”를 가지고 더미를 구성했습니다.
--
-- 스토리 흐름 요약
-- 	1.	개발자 커뮤니티 “km_coding”이 오픈됨
-- 	2.	초보자·중급자·고수 멤버들이 가입
-- 	3.	정보공유 게시판에는 튜토리얼/노하우 글이 올라오고 댓글·좋아요가 자연스러운 패턴으로 형성됨
-- 	4.	질문 게시판에는 실전 에러/설계/Java/Spring/DB 질문이 올라옴
-- 	5.	질문에 답변이 달리고 채택됨
-- 	6.	태그는 Java, Spring, DB, MySQL, React, Docker 등 실제 개발자 커뮤니티 태그 기반
--
-- 1. MEMBER (10명)
    commit ;
------------------------------------------------------
INSERT INTO km_coding.member (email, password, nickname, created_at, updated_at) VALUES ('km@gmail.com', 'pw1', '경민', SYSDATE, SYSDATE);
INSERT INTO km_coding.member (email, password, nickname, created_at, updated_at) VALUES ('mj@gmail.com', 'pw2', '민지', SYSDATE, SYSDATE);
INSERT INTO km_coding.member (email, password, nickname, created_at, updated_at) VALUES ('dy@gmail.com', 'pw3', '도윤', SYSDATE, SYSDATE);
INSERT INTO km_coding.member (email, password, nickname, created_at, updated_at) VALUES ('jh@gmail.com', 'pw4', '지호', SYSDATE, SYSDATE);
INSERT INTO km_coding.member (email, password, nickname, created_at, updated_at) VALUES ('hr@gmail.com', 'pw5', '해린', SYSDATE, SYSDATE);
INSERT INTO km_coding.member (email, password, nickname, created_at, updated_at) VALUES ('kw@gmail.com', 'pw6', '건우', SYSDATE, SYSDATE);
INSERT INTO km_coding.member (email, password, nickname, created_at, updated_at) VALUES ('si@gmail.com', 'pw7', '시온', SYSDATE, SYSDATE);
INSERT INTO km_coding.member (email, password, nickname, created_at, updated_at) VALUES ('nr@gmail.com', 'pw8', '나래', SYSDATE, SYSDATE);
INSERT INTO km_coding.member (email, password, nickname, created_at, updated_at) VALUES ('jh2@gmail.com', 'pw9', '주혁', SYSDATE, SYSDATE);
INSERT INTO km_coding.member (email, password, nickname, created_at, updated_at) VALUES ('hb@gmail.com', 'pw10', '한별', SYSDATE, SYSDATE);
------------------------------------------------------
-- 2. TAG (10개)
------------------------------------------------------
INSERT INTO km_coding.tag (TAG_ID) VALUES ('java');
INSERT INTO km_coding.tag (TAG_ID) VALUES ('spring');
INSERT INTO km_coding.tag (TAG_ID) VALUES ('mysql');
INSERT INTO km_coding.tag (TAG_ID) VALUES ('oracle');
INSERT INTO km_coding.tag (TAG_ID) VALUES ('react');
INSERT INTO km_coding.tag (TAG_ID) VALUES ('javascript');
INSERT INTO km_coding.tag (TAG_ID) VALUES ('docker');
INSERT INTO km_coding.tag (TAG_ID) VALUES ('devops');
INSERT INTO km_coding.tag (TAG_ID) VALUES ('jpa');
INSERT INTO km_coding.tag (TAG_ID) VALUES ('algorithm');
------------------------------------------------------
-- 3. INFO_POST (10개)
------------------------------------------------------


--1) 최상위 카테고리

INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend', NULL, '백엔드');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('frontend', NULL, '프론트엔드');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('database', NULL, '데이터베이스');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('devops', NULL, '데브옵스');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('ai', NULL, '인공지능 / 머신러닝');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('design', NULL, 'UI/UX 디자인');

commit;
--2) 서브 카테고리
--백엔드
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('backend_java', 'backend', '자바(Spring)');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('backend_springboot', 'backend', '스프링 부트');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('backend_jpa', 'backend', 'JPA');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('backend_model2', 'backend', 'Model2');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('backend_jsp', 'backend', 'jsp');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('backend_api', 'backend', 'API / 서버 개발');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('backend_arch', 'backend', '아키텍처 / 패턴');

--프론트엔드

INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('frontend_js', 'frontend', '자바스크립트');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('frontend_react', 'frontend', 'React');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('frontend_perf', 'frontend', '웹 성능 / 최적화');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('frontend_ui', 'frontend', 'UI 컴포넌트 / DOM');

--데이터베이스

INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('database_oracle', 'database', 'Oracle');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('database_mysql', 'database', 'MySQL');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('database_tuning', 'database', 'SQL 튜닝');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('database_schema', 'database', '스키마 모델링');

--데브옵스

INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('devops_docker', 'devops', 'Docker');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('devops_cicd', 'devops', 'CI/CD');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('devops_deploy', 'devops', '배포 자동화');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('devops_server', 'devops', '서버 / 네트워크');

--AI

INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('ai_ml', 'ai', '머신러닝');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('ai_dl', 'ai', '딥러닝');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('ai_serving', 'ai', '모델 서빙');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('ai_preprocess', 'ai', '데이터 전처리');

--디자인

INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('design_ux', 'design', 'UX 설계');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('design_ui', 'design', 'UI 그래픽');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('design_figma', 'design', '프로토타이핑(Figma)');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES  ('design_flow', 'design', '사용자 여정/플로우');






INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (1,
     'Java Stream API 핵심 개념 정리',
     '
     <h2>1. Stream API란?</h2>
     <p>Java Stream은 컬렉션 데이터를 <strong>함수형 스타일로 처리</strong>할 수 있게 해주는 기능입니다.</p>

     <h2>2. 핵심 연산</h2>
     <ul>
       <li><strong>map()</strong>: 요소 변환</li>
       <li><strong>filter()</strong>: 조건 필터링</li>
       <li><strong>reduce()</strong>: 누적/요약 연산</li>
     </ul>

     <h2>3. 예시 코드</h2>
     <pre><code>
     List<String> list = List.of("a","bb","ccc");

     int sum = list.stream()
                   .map(String::length)
                   .reduce(0, Integer::sum);
     </code></pre>

     <p>Stream은 <strong>지연 평가(lazy evaluation)</strong>이므로 성능적으로도 효율적입니다.</p>
     ','backend_java', SYSDATE, SYSDATE);


INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (2,
     '신입이 경험한 첫 배포 후기',
     '
     <h2>첫 배포 과정에서 겪은 문제들</h2>

     <p>처음으로 Spring Boot + AWS EC2 조합으로 서비스를 배포해봤습니다.<br>
     배포 과정은 생각보다 쉽지 않았고, 특히 <strong>보안그룹 설정</strong>이 가장 큰 난관이었어요.</p>

     <h2>1. EC2 포트 문제</h2>
     <p>인바운드 규칙에 8080 포트를 열지 않아서 외부 접속이 되지 않았습니다.</p>

     <h2>2. jar 실행 스크립트</h2>
     <pre><code>
     #!/bin/bash
     nohup java -jar app.jar > log.txt 2>&1 &
     </code></pre>

     <p>신입 개발자로서 좋은 경험이었습니다.</p>
     ','devops_deploy', SYSDATE, SYSDATE);


INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (3,
     'React 상태관리 패턴 비교',
     '
     <h2>React 상태관리 세 가지 패턴 비교</h2>

     <ul>
       <li><strong>useState</strong>: 가장 기본 상태관리</li>
       <li><strong>Redux</strong>: 전역 상태 + 정교한 구조</li>
       <li><strong>Zustand</strong>: 간단한 글로벌 상태관리</li>
     </ul>

     <h2>예시: Zustand 전역 상태</h2>
     <pre><code>
     const useStore = create((set) => ({
       count: 0,
       increase: () => set((s) => ({ count: s.count + 1 }))
     }));
     </code></pre>

     <p>프로젝트 규모에 따라 적절한 패턴을 선택해야 합니다.</p>
     ','frontend_react', SYSDATE, SYSDATE);


INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (4,
     '학교 프로젝트에서 JPA 적용 후기',
     '
     <h2>JPA 도입 배경</h2>
     <p>학교 프로젝트에서 처음으로 JPA를 사용해보았습니다.<br>
     초반에는 <strong>단방향 매핑</strong>으로 시작했지만 기능이 늘어나며 결국 <strong>양방향 매핑</strong>이 필요했어요.</p>

     <h2>양방향 매핑 실수</h2>
     <p>연관관계 주인을 잘못 지정해 insert가 <strong>두 번</strong> 실행되기도 했습니다.</p>

     <h2>해결 방법</h2>
     <ul>
       <li>연관관계 주인은 ManyToOne 쪽</li>
       <li>mappedBy 의미 정확히 이해하기</li>
     </ul>

     <p>이 경험이 큰 공부가 되었습니다.</p>
     ','backend_jpa', SYSDATE, SYSDATE);


INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (5,
     'UI/UX에서 FE로 넘어오며 느낀 점',
     '
     <h2>디자인 → 프론트엔드 전향기</h2>

     <p>UI/UX 디자이너에서 React 프론트엔드로 전향하면서<br>
     <strong>사용자 중심 사고</strong>가 개발에도 큰 도움이 된다는 것을 느꼈습니다.</p>

     <h2>도움이 된 점</h2>
     <ul>
       <li>레이아웃 구조를 빠르게 이해</li>
       <li>컴포넌트 단위 분리 사고</li>
       <li>사용자 흐름(Flow) 설계 능력</li>
     </ul>

     <p>앞으로도 디자인 감각을 살려 더 나은 UI를 만들고 싶어요.</p>
     ','frontend_ui', SYSDATE, SYSDATE);


INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (6,
     'Docker로 개발환경 통합한 이야기',
     '
     <h2>왜 Docker로 통합했는가?</h2>

     <p>팀 내 개발 환경이 모두 달라서 오류 재현이 어려웠습니다.</p>

     <p>Docker Compose로 다음 서비스들을 구성했습니다:</p>

     <ul>
       <li>mysql:8</li>
       <li>redis</li>
       <li>backend (spring)</li>
       <li>frontend (node)</li>
     </ul>

     <h2>docker-compose.yml 일부</h2>
     <pre><code>
     services:
       db:
         image: mysql:8
         environment:
           - MYSQL_ROOT_PASSWORD=1234
     </code></pre>

     <p>환경 통일은 생산성을 크게 올려줬습니다.</p>
     ','devops_docker', SYSDATE, SYSDATE);


INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (7,
     '인덱스 튜닝 기초 가이드',
     '
     <h2>1. 인덱스란?</h2>
     <p>DB에서 검색 속도를 높이기 위해 사용하는 B-Tree 기반 구조입니다.</p>

     <h2>2. 인덱스가 안 타는 이유</h2>
     <ul>
       <li>와일드카드 % 앞에 사용</li>
       <li>함수 적용 (LOWER(name))</li>
       <li>부정 조건 (!=)</li>
     </ul>

     <h2>3. 실행 계획 보기</h2>
     <pre><code>
     EXPLAIN PLAN FOR
     SELECT * FROM user WHERE name LIKE "%kim";
</code></pre>
','database_tuning', SYSDATE, SYSDATE);


INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (9,
     'AI 모델 Serving 전략',
     '
     <h2>ONNX 기반 Serving 구조</h2>

     <p>Python FastAPI와 ONNX Runtime을 이용해 모델을 서빙했습니다.</p>

     <h2>성능 최적화 포인트</h2>
     <ul>
       <li>Batch size 조절</li>
       <li>SessionOptions로 Thread 수 설정</li>
       <li>모델 양자화(Quantization)</li>
     </ul>

     <h2>예시 코드</h2>
     <pre><code>
     session = ort.InferenceSession("model.onnx")
     result = session.run(None, {"input": input_data})
     </code></pre>
     ','ai_serving', SYSDATE, SYSDATE);


INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (10,
     '코드 리뷰 팁 7가지',
     '
     <h2>1. 비난 금지</h2>
     <p>코드 리뷰는 사람을 평가하는 자리가 아닙니다.</p>

     <h2>2. 네이밍 체크</h2>
     <p>좋은 네이밍은 코드 품질을 크게 올립니다.</p>

     <h2>3. 복잡도 검토</h2>
     <p>함수 길이가 너무 길지 않은지 확인하세요.</p>

     <h2>4. 테스트 코드 포함</h2>

     <h2>5. 불필요한 의존성 제거</h2>

     <p>현업에서 5년 동안 느낀 리뷰 노하우입니다.</p>
     ','backend_arch', SYSDATE, SYSDATE);


INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (1,
     'Spring Boot 에러 해결 10선',
     '
     <h2>자주 발생하는 Spring Boot 에러 정리</h2>

     <ol>
       <li>Whitelabel Error Page</li>
       <li>Failed to configure a DataSource</li>
       <li>Could not resolve placeholder</li>
       <li>No qualifying bean</li>
       <li>MethodArgumentNotValidException</li>
     </ol>

     <h2>실전 해결 팁</h2>
     <p>에러 메시지를 <strong>차근차근 읽는 습관</strong>이 가장 중요합니다.</p>
     ','backend_springboot', SYSDATE, SYSDATE);
------------------------------------------------------
-- 4. INFO_COMMENT (20개)
------------------------------------------------------
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES    (1,2,'Stream 정리 도움됐어요!',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,4,'reduce 부분 설명 최고였습니다.',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (2,4,'첫 배포 공감됩니다 ㅋㅋ',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (2,1,'경험 잘 정리하셨네요!',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (3,5,'상태관리 비교가 유용했어요.',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (3,3,'Zustand 추천합니다!',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (4,1,'연관관계 주인 개념이 핵심입니다.',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (4,7,'프록시 동작도 공부해보세요.',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (5,3,'프론트 전향 환영합니다!',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (5,1,'디자인 감각이 큰 장점입니다.',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (6,7,'Docker 네트워크 이해하면 편합니다.',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (6,6,'compose 쓰면 환경 통합 쉽죠.',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (7,1,'실행계획 보는 법도 공부해보세요.',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (7,7,'조건절 컬럼 순서 중요!',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (8,9,'batch 크기 조절이 핵심입니다.',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (9,10,'네이밍 중요하죠.',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (9,2,'신입에게 도움되는 글이었어요.',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (10,2,'저도 이 에러 봤습니다.',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (10,3,'스택트레이스 분석이 중요합니다.',NULL,SYSDATE);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (10,1,'설정 문제일 때가 많아요.',NULL,SYSDATE);
------------------------------------------------------
-- 5. INFO_LIKE (30개)
------------------------------------------------------
INSERT INTO km_coding.info_like (post_id, member_id) VALUES(1,2);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (1,3);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (1,4);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (1,5);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (1,6);

INSERT INTO km_coding.info_like (post_id, member_id) VALUES (2,1);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (2,3);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (2,4);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (2,7);

INSERT INTO km_coding.info_like (post_id, member_id) VALUES (3,2);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (3,5);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (3,8);

INSERT INTO km_coding.info_like (post_id, member_id) VALUES (4,1);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (4,2);

INSERT INTO km_coding.info_like (post_id, member_id) VALUES (5,3);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (5,4);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (5,7);

INSERT INTO km_coding.info_like (post_id, member_id) VALUES (6,1);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (6,2);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (6,9);

INSERT INTO km_coding.info_like (post_id, member_id) VALUES (7,1);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (7,6);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (7,10);

INSERT INTO km_coding.info_like (post_id, member_id) VALUES (8,3);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (8,9);

INSERT INTO km_coding.info_like (post_id, member_id) VALUES (9,2);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (9,4);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (9,10);

INSERT INTO km_coding.info_like (post_id, member_id) VALUES (10,2);
INSERT INTO km_coding.info_like (post_id, member_id) VALUES (10,3);
------------------------------------------------------
-- 6. INFO_POST_TAG
------------------------------------------------------
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES    (1,'java');
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES (1,'algorithm');
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES (2,'spring');
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES (2,'devops');
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES (3,'react');
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES (3,'javascript');
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES (4,'jpa');
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES (4,'java');
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES (5,'react');
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES (5,'javascript');
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES (6,'docker');
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES (6,'devops');
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES (7,'mysql');
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES (7,'java');
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES (8,'algorithm');
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES (9,'java');
INSERT INTO km_coding.info_post_tag (post_id, tag_id) VALUES (10,'spring');
-- – 7. QNA_POST
-- – 컬럼 구조: (POST_ID identity), MEMBER_ID, TITLE, content, category_id, created_at, UPDATED_AT

INSERT INTO km_coding.qna_post (member_id,title,content, category_id, created_at,updated_at)
VALUES (
           2,
           'Spring Boot 3 CORS 오류 해결',
           '
           <h2>문제 상황</h2>
           <p>React 프론트엔드에서 Spring Boot 3 API 호출 시 <strong>CORS 오류</strong>가 발생합니다.</p>

           <h2>오류 메시지</h2>
           <pre><code>
           Access to fetch at '' from origin '' has been blocked by CORS policy
           </code></pre>

           <h2>시도한 방법</h2>
           <ul>
             <li>WebMvcConfigurer로 addCorsMappings 시도</li>
             <li>SecurityFilterChain에 cors().and()</li>
             <li>@CrossOrigin 적용</li>
           </ul>

           <h2>질문</h2>
           <p>Spring Boot 3 기준으로 <strong>CORS 설정 추천 방식</strong>이 무엇인가요?</p>
           ','backend_springboot', SYSDATE, SYSDATE);



INSERT INTO km_coding.qna_post (member_id,title,content, category_id, created_at,updated_at)
VALUES (
           4,
           'JPA 양방향 매핑 문제',
           '
           <h2>문제 상황</h2>
           <p>양방향 매핑을 적용한 후 persist 시 <strong>INSERT가 두 번</strong> 실행되는 문제가 발생합니다.</p>

           <h2>엔티티 구조</h2>
           <pre><code>
           class Member {
             @OneToMany(mappedBy="member")
             List<Order> orders;
           }

           class Order {
             @ManyToOne
             Member member;
           }
           </code></pre>

           <h2>의심되는 부분</h2>
           <ul>
             <li>연관관계 주인을 잘못 지정?</li>
             <li>양쪽에서 set을 중복 호출?</li>
           </ul>

           <p>어디서 잘못된 건지 조언 부탁드립니다!</p>
           ','backend_jpa', SYSDATE, SYSDATE);



INSERT INTO km_coding.qna_post (member_id,title,content, category_id, created_at,updated_at)
VALUES (
           3,
           'React useEffect 무한렌더링',
           '
           <h2>문제 설명</h2>
           <p>useEffect 내부에서 상태를 업데이트하면 <strong>무한 렌더링</strong>이 발생합니다.</p>

           <h2>코드 일부</h2>
           <pre><code>
           useEffect(() => {
             setValue(count + 1);
           }, [count]);
           </code></pre>

           <h2>시도한 내용</h2>
           <ul>
             <li>deps 배열 수정</li>
             <li>조건문으로 렌더링 중단 시도</li>
             <li>setState 위치 이동</li>
           </ul>

           <h2>질문</h2>
           <p>이럴 때의 <strong>정석적인 해결 방법</strong>이 궁금합니다.</p>
           ','frontend_react', SYSDATE, SYSDATE);



INSERT INTO km_coding.qna_post (member_id,title,content, category_id, created_at,updated_at)
VALUES (
           1,
           'Oracle DATE vs TIMESTAMP',
           '
           <h2>질문</h2>
           <p>현재 시스템에서 시간 정보가 필요한데 Oracle에서 <strong>DATE vs TIMESTAMP</strong> 중 무엇을 사용하는 것이 가장 좋을까요?</p>

           <h2>요구사항</h2>
           <ul>
             <li>로그 데이터 저장</li>
             <li>시간 비교 필요</li>
             <li>정밀도(밀리초) 필요 여부 아직 불명</li>
           </ul>

           <h2>고민되는 점</h2>
           <p>DATE는 시분초 저장되지만 밀리초는 안 되고,<br>
           TIMESTAMP는 정밀도가 높아서 더 좋은 것 같은데 성능 차이가 있을까요?</p>
           ','database_oracle', SYSDATE, SYSDATE);



INSERT INTO km_coding.qna_post (member_id,title,content, category_id, created_at,updated_at)
VALUES (
           7,
           'MySQL 인덱스 안타는 문제',
           '
           <h2>문제 현상</h2>
           <p>분명 인덱스를 걸었는데 실행 계획에서는 <strong>Full Table Scan</strong>으로 표시됩니다.</p>

           <h2>테이블 구조</h2>
           <pre><code>
           CREATE INDEX idx_user_name ON users(name);
           </code></pre>

           <h2>쿼리</h2>
           <pre><code>
           SELECT * FROM users
           WHERE LOWER(name) LIKE ''%kim%'';
           </code></pre>

           <h2>질문</h2>
           <p>왜 인덱스가 안 타는지 원인을 알고 싶습니다.</p>
           ','database_mysql', SYSDATE, SYSDATE);



INSERT INTO km_coding.qna_post (member_id,title,content, category_id, created_at,updated_at)
VALUES (
           6,
           'docker-compose 네트워크 충돌',
           '
           <h2>문제 설명</h2>
           <p>docker-compose 환경에서 특정 서비스가 <strong>포트 충돌</strong>을 일으켜 실행되지 않습니다.</p>

           <h2>docker-compose.yml</h2>
           <pre><code>
           services:
             web:
               ports:
                 - "8080:8080"
             api:
               ports:
                 - "8080:8080"
           </code></pre>

           <h2>질문</h2>
           <p>두 서비스가 같은 포트를 쓰지 않도록 구성하는 방법이 있을까요?</p>
           ','devops_docker', SYSDATE, SYSDATE);



INSERT INTO km_coding.qna_post (member_id,title,content, category_id, created_at,updated_at)
VALUES (
           10,
           'JWT 재발급 문제',
           '
           <h2>문제 상황</h2>
           <p>Refresh Token 검증 후 Access Token을 재발급하려고 하는데<br>
           <strong>재발급 메서드가 실행되지 않는</strong> 문제가 있습니다.</p>

           <h2>로그</h2>
           <pre><code>
           JWT expired
           Refresh token valid
           But no new token generated
           </code></pre>

           <h2>질문</h2>
           <p>Spring Security 6 기준으로 <strong>JWT 재발급 플로우</strong>를 다시 설계해야 하나요?</p>
           ','backend_springboot', SYSDATE, SYSDATE);



INSERT INTO km_coding.qna_post (member_id,title,content, category_id, created_at,updated_at)
VALUES (
           9,
           'AI 모델 서빙 속도',
           '
           <h2>문제</h2>
           <p>ONNX Runtime 기반 서빙을 하고 있는데 응답 속도가 <strong>너무 느립니다.</strong></p>

           <h2>서버 구조</h2>
           <pre><code>
           FastAPI → ONNX Runtime → batch inference
           </code></pre>

           <h2>시도한 것</h2>
           <ul>
             <li>배치 크기 조절</li>
             <li>세션 스레드 수 변경</li>
             <li>모델 양자화</li>
           </ul>

           <h2>질문</h2>
           <p>가장 효과가 좋았던 최적화 방법이 있을까요?</p>
           ','ai_serving', SYSDATE, SYSDATE);



INSERT INTO km_coding.qna_post (member_id,title,content, category_id, created_at,updated_at)
VALUES (
           8,
           '게임 루프 GC 튐',
           '
           <h2>문제 상황</h2>
           <p>게임 엔진 반복 루프에서 <strong>100ms 단위로 끊김 현상</strong>이 발생합니다.</p>

           <h2>GC 로그</h2>
           <pre><code>
           [GC] Pause 120ms ...
           </code></pre>

           <h2>질문</h2>
           <ul>
             <li>GC 튐 현상 기본 원인은 무엇인가?</li>
             <li>객체 풀링이 정말 효과적인가?</li>
           </ul>
           ','backend_java', SYSDATE, SYSDATE);



INSERT INTO km_coding.qna_post (member_id,title,content, category_id, created_at,updated_at)
VALUES (
           2,
           'Spring Validation 메시지 출력 문제',
           '
           <h2>상황 설명</h2>
           <p>Spring Validation을 사용하면 기본적으로 BindingResult가 자동으로 설정되는데,<br>
           현재 컨트롤러에서는 BindingResult가 <strong>null</strong>로 들어오고 있습니다.</p>

           <h2>Controller 코드</h2>
           <pre><code>
           @PostMapping("/save")
           public String save(@Valid UserDto dto, BindingResult result) {
               if (result.hasErrors()) {
                   return "form";
               }
               ...
           }
           </code></pre>

           <h2>질문</h2>
           <p>혹시 Validation 처리 순서가 바뀐 걸까요?<br>
           BindingResult가 null이 되는 경우 원인이 뭔가요?</p>
           ','backend_springboot', SYSDATE, SYSDATE);


-- – 8. QNA_COMMENT
-- – 컬럼 구조: (COMMENT_ID identity), POST_ID, MEMBER_ID, CONTENT, PARENT_ID, CREATED_AT

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (1,1,'CORS는 WebMvcConfigurer로 해결 가능합니다.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (1,3,'프록시 서버 경유도 방법입니다.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (2,1,'연관관계 주인 설정을 체크하세요.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (2,7,'flush 타이밍 문제일 수 있습니다.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (3,3,'deps 배열에 상태 과다 포함되면 루프 돕니다.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (3,5,'React 초보자도 많이 겪어요.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (4,7,'DATE는 시분초 없음.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (4,1,'TIMESTAMP는 정밀 시간 포함.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (5,7,'조건절 컬럼 순서 때문이다.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (5,1,'LIKE 검색은 인덱스 거의 안탐.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (6,6,'docker network prune 해보세요.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (6,1,'compose 버전을 확인하세요.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (7,10,'refresh 저장 구조를 점검하세요.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (7,1,'SecurityFilterChain 문제일 확률 큼.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (8,9,'batch 튜닝 필요합니다.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (8,1,'서빙 인스턴스 분리 추천.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (9,9,'GC 빈도 체크하시나요?',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (9,8,'객체 풀링으로 해결됩니다.',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (10,1,'BindingResult는 ModelAttribute 바로 뒤!',NULL,SYSDATE);

INSERT INTO km_coding.qna_comment (post_id,member_id,content,parent_id,created_at)
VALUES (10,3,'Validation annotation 점검 필요.',NULL,SYSDATE);

-- – 9. QNA_COMMENT_LIKE
-- – 컬럼 구조: (LIKE_ID identity), COMMENT_ID, MEMBER_ID
INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (1,2);
INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (1,3);
INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (1,4);

INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (2,1);
INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (2,4);

INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (3,2);
INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (3,5);

INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (5,2);
INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (5,4);
INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (5,6);

INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (7,1);
INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (7,4);

INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (9,2);
INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (9,7);

INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (11,2);
INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (11,3);

INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (13,8);
INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (13,9);

INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (15,3);
INSERT INTO km_coding.qna_comment_like (comment_id,member_id) VALUES (15,7);
-- – 10. QNA_ADOPT
-- – 컬럼 구조: (ADOPT_ID identity), POST_ID, COMMENT_ID, CREATED_AT

INSERT INTO km_coding.qna_adopt (post_id,comment_id,created_at)
VALUES (1,1,SYSDATE);

INSERT INTO km_coding.qna_adopt (post_id,comment_id,created_at)
VALUES (2,3,SYSDATE);

INSERT INTO km_coding.qna_adopt (post_id,comment_id,created_at)
VALUES (3,5,SYSDATE);

INSERT INTO km_coding.qna_adopt (post_id,comment_id,created_at)
VALUES (4,7,SYSDATE);

INSERT INTO km_coding.qna_adopt (post_id,comment_id,created_at)
VALUES (5,9,SYSDATE);

INSERT INTO km_coding.qna_adopt (post_id,comment_id,created_at)
VALUES (6,11,SYSDATE);

INSERT INTO km_coding.qna_adopt (post_id,comment_id,created_at)
VALUES (7,13,SYSDATE);

INSERT INTO km_coding.qna_adopt (post_id,comment_id,created_at)
VALUES (8,15,SYSDATE);

INSERT INTO km_coding.qna_adopt (post_id,comment_id,created_at)
VALUES (9,17,SYSDATE);

INSERT INTO km_coding.qna_adopt (post_id,comment_id,created_at)
VALUES (10,19,SYSDATE);

-- – 11. QNA_POST_TAG
-- – 컬럼 구조: (MAP_ID identity), POST_ID, TAG_ID
INSERT INTO km_coding.qna_post_tag (post_id,tag_id) VALUES (1,'spring');

INSERT INTO km_coding.qna_post_tag (post_id,tag_id) VALUES (2,'jpa');
INSERT INTO km_coding.qna_post_tag (post_id,tag_id) VALUES (2,'java');

INSERT INTO km_coding.qna_post_tag (post_id,tag_id) VALUES (3,'react');

INSERT INTO km_coding.qna_post_tag (post_id,tag_id) VALUES (4,'oracle');

INSERT INTO km_coding.qna_post_tag (post_id,tag_id) VALUES (5,'mysql');

INSERT INTO km_coding.qna_post_tag (post_id,tag_id) VALUES (6,'docker');

INSERT INTO km_coding.qna_post_tag (post_id,tag_id) VALUES (7,'spring');
INSERT INTO km_coding.qna_post_tag (post_id,tag_id) VALUES (7,'javascript');

INSERT INTO km_coding.qna_post_tag (post_id,tag_id) VALUES (8,'algorithm');

INSERT INTO km_coding.qna_post_tag (post_id,tag_id) VALUES (9,'java');

INSERT INTO km_coding.qna_post_tag (post_id,tag_id) VALUES (10,'spring');

commit;
