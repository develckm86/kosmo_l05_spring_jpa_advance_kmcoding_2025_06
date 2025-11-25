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



---

--## 1) 백엔드 소분류

--### backend_java (자바 Spring)

INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_java_basic', 'backend_java', '자바 문법 기초');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_java_oop', 'backend_java', '객체지향(OOP)');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_java_thread', 'backend_java', '스레드 / 동시성');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_java_memory', 'backend_java', 'JVM / 메모리 구조');


--### backend_springboot


INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_springboot_core', 'backend_springboot', '스프링 핵심 개념');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_springboot_mvc', 'backend_springboot', 'Spring MVC');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_springboot_security', 'backend_springboot', 'Spring Security');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_springboot_rest', 'backend_springboot', 'REST API');


--### backend_jpa


INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_jpa_entity', 'backend_jpa', '엔티티 매핑');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_jpa_query', 'backend_jpa', 'JPQL / QueryDSL');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_jpa_performance', 'backend_jpa', '성능 최적화');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_jpa_transaction', 'backend_jpa', '트랜잭션 관리');


--### backend_model2


INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_model2_servlet', 'backend_model2', 'Servlet');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_model2_jspmvc', 'backend_model2', 'JSP MVC 구조');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_model2_jstl', 'backend_model2', 'JSTL / EL');


--### backend_jsp


INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_jsp_basic', 'backend_jsp', 'JSP 기본 문법');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_jsp_form', 'backend_jsp', '폼 처리 / request');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_jsp_session', 'backend_jsp', '세션/쿠키');


--### backend_api (API / 서버 개발)


INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_api_rest', 'backend_api', 'REST 규칙');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_api_auth', 'backend_api', '인증/인가');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_api_error', 'backend_api', '에러 처리');


--### backend_arch (아키텍처/패턴)


INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_arch_layer', 'backend_arch', '레이어드 아키텍처');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_arch_clean', 'backend_arch', '클린 아키텍처');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('backend_arch_designpattern', 'backend_arch', '디자인 패턴');


---

--## 2) 프론트엔드 소분류

--### frontend_js


INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('frontend_js_basic', 'frontend_js', 'JS 기초');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('frontend_js_dom', 'frontend_js', 'DOM 조작');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('frontend_js_async', 'frontend_js', '비동기 / fetch');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('frontend_js_module', 'frontend_js', '모듈 시스템');


--### frontend_react


INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('frontend_react_hooks', 'frontend_react', 'React Hooks');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('frontend_react_router', 'frontend_react', 'React Router');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('frontend_react_state', 'frontend_react', '상태 관리');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('frontend_react_effect', 'frontend_react', '렌더링 / 사이드이펙트');


--### frontend_perf (웹 성능 / 최적화)


INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('frontend_perf_lcp', 'frontend_perf', 'LCP / 렌더링 최적화');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('frontend_perf_bundle', 'frontend_perf', '번들 최적화');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('frontend_perf_cache', 'frontend_perf', '캐싱 전략');


--### frontend_ui


INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('frontend_ui_css', 'frontend_ui', 'CSS / 스타일링');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('frontend_ui_component', 'frontend_ui', 'UI 컴포넌트');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('frontend_ui_event', 'frontend_ui', 'DOM 이벤트');


---

--## 3) 데이터베이스 소분류

--### database_oracle


INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('database_oracle_sql', 'database_oracle', 'Oracle SQL');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('database_oracle_plsql', 'database_oracle', 'PL/SQL');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('database_oracle_index', 'database_oracle', '인덱스 최적화');


--### database_mysql


INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('database_mysql_query', 'database_mysql', '쿼리 작성');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('database_mysql_index', 'database_mysql', '인덱스/튜닝');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('database_mysql_lock', 'database_mysql', 'Lock 이해');


--### database_tuning


INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('database_tuning_plan', 'database_tuning', '실행 계획 분석');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('database_tuning_index', 'database_tuning', '인덱스 전략');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('database_tuning_stats', 'database_tuning', '통계/히스토그램');


--### database_schema

INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('database_schema_normal', 'database_schema', '정규화');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('database_schema_relation', 'database_schema', '관계 설계');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('database_schema_keys', 'database_schema', '키/제약조건');

--## 4) 데브옵스 소분류

--### devops_docker

INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('devops_docker_basic', 'devops_docker', 'Docker 기본');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('devops_docker_compose', 'devops_docker', 'Compose');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('devops_docker_image', 'devops_docker', '이미지 빌드');

--### devops_cicd

INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('devops_cicd_github', 'devops_cicd', 'GitHub Actions');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('devops_cicd_pipeline', 'devops_cicd', 'Pipeline 구조');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('devops_cicd_test', 'devops_cicd', '테스트 자동화');

--### devops_deploy

INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('devops_deploy_blue', 'devops_deploy', 'Blue/Green 배포');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('devops_deploy_canary', 'devops_deploy', '카나리 배포');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('devops_deploy_ec2', 'devops_deploy', 'EC2 배포');

--### devops_server

INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('devops_server_linux', 'devops_server', '리눅스 기초');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('devops_server_network', 'devops_server', '네트워크 기초');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('devops_server_nginx', 'devops_server', 'Nginx 설정');

--## 5) AI 소분류
--### ai_ml
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('ai_ml_regression', 'ai_ml', '회귀 분석');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('ai_ml_classification', 'ai_ml', '분류 알고리즘');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('ai_ml_feature', 'ai_ml', '특징 엔지니어링');
--### ai_dl
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('ai_dl_cnn', 'ai_dl', 'CNN / 이미지');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('ai_dl_rnn', 'ai_dl', 'RNN / LSTM');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('ai_dl_transformer', 'ai_dl', 'Transformer');
--### ai_serving
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('ai_serving_fastapi', 'ai_serving', 'FastAPI 서빙');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('ai_serving_docker', 'ai_serving', 'Docker 서빙');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('ai_serving_batch', 'ai_serving', 'Batch Serving');
--### ai_preprocess
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('ai_preprocess_cleaning', 'ai_preprocess', '데이터 정제');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('ai_preprocess_scaling', 'ai_preprocess', '정규화/스케일링');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('ai_preprocess_split', 'ai_preprocess', '데이터 분리');


--## 6) 디자인 소분류

--### design_ux
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('design_ux_research', 'design_ux', 'UX 리서치');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('design_ux_flow', 'design_ux', '플로우 디자인');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('design_ux_wireframe', 'design_ux', '와이어프레임');
--### design_ui
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('design_ui_color', 'design_ui', '컬러 시스템');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('design_ui_typo', 'design_ui', '타이포그래피');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('design_ui_component', 'design_ui', 'UI 컴포넌트');

--### design_figma

INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('design_figma_auto', 'design_figma', '오토 레이아웃');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('design_figma_component', 'design_figma', '컴포넌트');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('design_figma_prototype', 'design_figma', '프로토타이핑');

--### design_flow

INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('design_flow_user', 'design_flow', '사용자 흐름 분석');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('design_flow_map', 'design_flow', '서비스 맵');
INSERT INTO km_coding.category(CATEGORY_ID, PARENT_ID,NAME) VALUES ('design_flow_story', 'design_flow', '유저 스토리');
commit;

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

-- 추가 INFO_POST 더미 데이터 (서사형)
INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (1,
     'Batch Stream 리팩토링 회고 #01',
     ' 
     <h3>배경</h3>
     <p>스프린트 1 에서 대용량 배치 로그를 Stream으로 리팩토링하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>groupingBy 단계에서 Null 값 때문에 NPE와 성능 저하가 동시에 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>null-safe filter와 map 단계 분리</li>
       <li>Collectors.toMap에 merge 함수 지정</li>
       <li>parallel 스트림 대신 sequential로 회귀</li>
       <li>이슈 로그: INFO-011 / 스프린트-01</li>
     </ul>

     <h3>배운 점</h3>
     <p>스트림 설계는 가독성이 좋아도 예외 흐름을 먼저 정의해야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_java', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (2,
     'Spring Boot 운영 이슈 기록 #01',
     ' 
     <h3>배경</h3>
     <p>스프린트 1 에서 신규 REST API를 운영 반영하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>CORS와 Bean Validation 에러가 로드밸런서 뒤에서만 재현 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>SecurityFilterChain에 corsConfigurationSource 주입</li>
       <li>ConstraintViolation 로그를 MDC에 포함</li>
       <li>헬스체크 엔드포인트를 별도 프로필로 분리</li>
       <li>이슈 로그: INFO-012 / 스프린트-01</li>
     </ul>

     <h3>배운 점</h3>
     <p>운영 환경의 체이닝을 그대로 흉내 낸 통합 테스트가 필수임을 체감했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_springboot', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (3,
     'JPA N+1 탈출기 #01',
     ' 
     <h3>배경</h3>
     <p>스프린트 1 에서 조회 API 응답 시간이 스파이크를 치며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>toOne 연관관계가 모두 Lazy라 fetch join 없이 N+1이 폭발 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>Querydsl로 fetch join + batch size 적용</li>
       <li>조회 전용 DTO 프로젝션으로 페이로드 축소</li>
       <li>읽기 전용 트랜잭션으로 2차 캐시 활용</li>
       <li>이슈 로그: INFO-013 / 스프린트-01</li>
     </ul>

     <h3>배운 점</h3>
     <p>toOne fetch 전략과 조회 전용 쿼리를 초기에 설계했어야 했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_jpa', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (4,
     'Toast UI 연동 삽질기 #01',
     ' 
     <h3>배경</h3>
     <p>스프린트 1 에서 Toast UI Editor/Viewer를 공지 작성 페이지에 붙이며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>이미지 업로드 훅이 두 번 호출되고 상태가 꼬이는 문제 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>custom image hook에서 debounce 처리</li>
       <li>unmount 시 editorInstance.destroy로 메모리 정리</li>
       <li>drag&drop 업로드는 presigned URL 응답으로 교체</li>
       <li>이슈 로그: INFO-014 / 스프린트-01</li>
     </ul>

     <h3>배운 점</h3>
     <p>에디터 라이프사이클을 명확히 관리하지 않으면 예상치 못한 렌더링이 발생한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_react', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (5,
     '부트스트랩 테마 튜닝 노트 #01',
     ' 
     <h3>배경</h3>
     <p>스프린트 1 에서 디자인 시스템 맞춰 부트스트랩 변수를 재정의하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>다크모드 토글 시 focus outline이 사라져 접근성 기준을 놓침 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>CSS 변수로 색상 토큰 통합</li>
       <li>focus-visible 기반 outline 재적용</li>
       <li>Toast 메시지 대비비율을 WCAG AA 이상으로 조정</li>
       <li>이슈 로그: INFO-015 / 스프린트-01</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인 토큰을 먼저 잡아두면 테마 전환과 접근성 대응이 쉬워진다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_ui', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (6,
     'Docker Compose 안정화 기록 #01',
     ' 
     <h3>배경</h3>
     <p>스프린트 1 에서 로컬 개발환경을 Compose로 단일화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>컨테이너 간 DNS 지연으로 애플리케이션 부팅이 랜덤하게 실패 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>healthcheck와 depends_on 조건 강화</li>
       <li>네트워크 모드를 bridge 단일 네트워크로 통일</li>
       <li>환경변수를 .env로 모아 온보딩 속도 개선</li>
       <li>이슈 로그: INFO-016 / 스프린트-01</li>
     </ul>

     <h3>배운 점</h3>
     <p>헬스체크를 설계에 포함시키면 팀 전체 개발 경험이 안정된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_docker', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (7,
     '배포 자동화 회고 #01',
     ' 
     <h3>배경</h3>
     <p>스프린트 1 에서 배포 파이프라인을 blue-green에서 canary로 전환하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>초기 canary 트래픽 분배가 잘못되어 세션 스티키가 깨짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>ALB 타겟 그룹 가중치 재조정 자동화</li>
       <li>배포 단계별 슬랙 알림에 메트릭 링크 포함</li>
       <li>롤백 스크립트에 DB 마이그레이션 검증 추가</li>
       <li>이슈 로그: INFO-017 / 스프린트-01</li>
     </ul>

     <h3>배운 점</h3>
     <p>점진적 배포는 메트릭과 롤백 스크립트가 함께 설계되어야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_deploy', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (8,
     '인덱스 튜닝 실습 메모 #01',
     ' 
     <h3>배경</h3>
     <p>스프린트 1 에서 월간 리포트 쿼리를 최적화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>범위 조건과 정렬 조건이 복합 인덱스를 타지 못해 full scan 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>커버링 인덱스와 힌트를 실험</li>
       <li>gather stats로 최신 통계 반영</li>
       <li>불필요한 함수 사용을 제거해 검색 조건 단순화</li>
       <li>이슈 로그: INFO-018 / 스프린트-01</li>
     </ul>

     <h3>배운 점</h3>
     <p>실행 계획은 데이터 분포가 바뀔 때마다 다시 검증해야 한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'database_tuning', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (9,
     '분류 모델 운영 체험기 #01',
     ' 
     <h3>배경</h3>
     <p>스프린트 1 에서 간단한 분류 모델을 배포해 주간 리포트를 생성하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>피처 스케일이 drift 되어 F1 점수가 스프린트마다 흔들림 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>모니터링에 feature distribution 로그 추가</li>
       <li>베이스라인과 최신 모델을 shadow 테스트</li>
       <li>전처리 파이프라인을 모델 버전과 함께 고정</li>
       <li>이슈 로그: INFO-019 / 스프린트-01</li>
     </ul>

     <h3>배운 점</h3>
     <p>모델 품질은 파이프라인 재현성과 모니터링이 함께 가야 유지된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'ai_ml_classification', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (10,
     '디자인 시스템 QA 로그 #01',
     ' 
     <h3>배경</h3>
     <p>스프린트 1 에서 새로운 UI 컴포넌트 라이브러리를 배포하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>Figma 토큰과 실제 CSS 변수 값이 어긋나 브랜드 컬러가 틀어짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>디자인 토큰 스냅샷을 CI에 추가</li>
       <li>스토리북에 상태별 스크린샷 테스트 도입</li>
       <li>컴포넌트 prop 타입을 문서화하여 FE/디자이너 합의</li>
       <li>이슈 로그: INFO-020 / 스프린트-01</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인-개발 간 소스오브트루스를 정리하면 QA 소요가 크게 준다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'design_ui_component', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (1,
     'Batch Stream 리팩토링 회고 #02',
     ' 
     <h3>배경</h3>
     <p>스프린트 2 에서 대용량 배치 로그를 Stream으로 리팩토링하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>groupingBy 단계에서 Null 값 때문에 NPE와 성능 저하가 동시에 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>null-safe filter와 map 단계 분리</li>
       <li>Collectors.toMap에 merge 함수 지정</li>
       <li>parallel 스트림 대신 sequential로 회귀</li>
       <li>이슈 로그: INFO-021 / 스프린트-02</li>
     </ul>

     <h3>배운 점</h3>
     <p>스트림 설계는 가독성이 좋아도 예외 흐름을 먼저 정의해야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_java', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (2,
     'Spring Boot 운영 이슈 기록 #02',
     ' 
     <h3>배경</h3>
     <p>스프린트 2 에서 신규 REST API를 운영 반영하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>CORS와 Bean Validation 에러가 로드밸런서 뒤에서만 재현 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>SecurityFilterChain에 corsConfigurationSource 주입</li>
       <li>ConstraintViolation 로그를 MDC에 포함</li>
       <li>헬스체크 엔드포인트를 별도 프로필로 분리</li>
       <li>이슈 로그: INFO-022 / 스프린트-02</li>
     </ul>

     <h3>배운 점</h3>
     <p>운영 환경의 체이닝을 그대로 흉내 낸 통합 테스트가 필수임을 체감했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_springboot', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (3,
     'JPA N+1 탈출기 #02',
     ' 
     <h3>배경</h3>
     <p>스프린트 2 에서 조회 API 응답 시간이 스파이크를 치며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>toOne 연관관계가 모두 Lazy라 fetch join 없이 N+1이 폭발 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>Querydsl로 fetch join + batch size 적용</li>
       <li>조회 전용 DTO 프로젝션으로 페이로드 축소</li>
       <li>읽기 전용 트랜잭션으로 2차 캐시 활용</li>
       <li>이슈 로그: INFO-023 / 스프린트-02</li>
     </ul>

     <h3>배운 점</h3>
     <p>toOne fetch 전략과 조회 전용 쿼리를 초기에 설계했어야 했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_jpa', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (4,
     'Toast UI 연동 삽질기 #02',
     ' 
     <h3>배경</h3>
     <p>스프린트 2 에서 Toast UI Editor/Viewer를 공지 작성 페이지에 붙이며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>이미지 업로드 훅이 두 번 호출되고 상태가 꼬이는 문제 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>custom image hook에서 debounce 처리</li>
       <li>unmount 시 editorInstance.destroy로 메모리 정리</li>
       <li>drag&drop 업로드는 presigned URL 응답으로 교체</li>
       <li>이슈 로그: INFO-024 / 스프린트-02</li>
     </ul>

     <h3>배운 점</h3>
     <p>에디터 라이프사이클을 명확히 관리하지 않으면 예상치 못한 렌더링이 발생한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_react', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (5,
     '부트스트랩 테마 튜닝 노트 #02',
     ' 
     <h3>배경</h3>
     <p>스프린트 2 에서 디자인 시스템 맞춰 부트스트랩 변수를 재정의하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>다크모드 토글 시 focus outline이 사라져 접근성 기준을 놓침 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>CSS 변수로 색상 토큰 통합</li>
       <li>focus-visible 기반 outline 재적용</li>
       <li>Toast 메시지 대비비율을 WCAG AA 이상으로 조정</li>
       <li>이슈 로그: INFO-025 / 스프린트-02</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인 토큰을 먼저 잡아두면 테마 전환과 접근성 대응이 쉬워진다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_ui', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (6,
     'Docker Compose 안정화 기록 #02',
     ' 
     <h3>배경</h3>
     <p>스프린트 2 에서 로컬 개발환경을 Compose로 단일화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>컨테이너 간 DNS 지연으로 애플리케이션 부팅이 랜덤하게 실패 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>healthcheck와 depends_on 조건 강화</li>
       <li>네트워크 모드를 bridge 단일 네트워크로 통일</li>
       <li>환경변수를 .env로 모아 온보딩 속도 개선</li>
       <li>이슈 로그: INFO-026 / 스프린트-02</li>
     </ul>

     <h3>배운 점</h3>
     <p>헬스체크를 설계에 포함시키면 팀 전체 개발 경험이 안정된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_docker', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (7,
     '배포 자동화 회고 #02',
     ' 
     <h3>배경</h3>
     <p>스프린트 2 에서 배포 파이프라인을 blue-green에서 canary로 전환하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>초기 canary 트래픽 분배가 잘못되어 세션 스티키가 깨짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>ALB 타겟 그룹 가중치 재조정 자동화</li>
       <li>배포 단계별 슬랙 알림에 메트릭 링크 포함</li>
       <li>롤백 스크립트에 DB 마이그레이션 검증 추가</li>
       <li>이슈 로그: INFO-027 / 스프린트-02</li>
     </ul>

     <h3>배운 점</h3>
     <p>점진적 배포는 메트릭과 롤백 스크립트가 함께 설계되어야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_deploy', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (8,
     '인덱스 튜닝 실습 메모 #02',
     ' 
     <h3>배경</h3>
     <p>스프린트 2 에서 월간 리포트 쿼리를 최적화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>범위 조건과 정렬 조건이 복합 인덱스를 타지 못해 full scan 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>커버링 인덱스와 힌트를 실험</li>
       <li>gather stats로 최신 통계 반영</li>
       <li>불필요한 함수 사용을 제거해 검색 조건 단순화</li>
       <li>이슈 로그: INFO-028 / 스프린트-02</li>
     </ul>

     <h3>배운 점</h3>
     <p>실행 계획은 데이터 분포가 바뀔 때마다 다시 검증해야 한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'database_tuning', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (9,
     '분류 모델 운영 체험기 #02',
     ' 
     <h3>배경</h3>
     <p>스프린트 2 에서 간단한 분류 모델을 배포해 주간 리포트를 생성하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>피처 스케일이 drift 되어 F1 점수가 스프린트마다 흔들림 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>모니터링에 feature distribution 로그 추가</li>
       <li>베이스라인과 최신 모델을 shadow 테스트</li>
       <li>전처리 파이프라인을 모델 버전과 함께 고정</li>
       <li>이슈 로그: INFO-029 / 스프린트-02</li>
     </ul>

     <h3>배운 점</h3>
     <p>모델 품질은 파이프라인 재현성과 모니터링이 함께 가야 유지된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'ai_ml_classification', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (10,
     '디자인 시스템 QA 로그 #02',
     ' 
     <h3>배경</h3>
     <p>스프린트 2 에서 새로운 UI 컴포넌트 라이브러리를 배포하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>Figma 토큰과 실제 CSS 변수 값이 어긋나 브랜드 컬러가 틀어짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>디자인 토큰 스냅샷을 CI에 추가</li>
       <li>스토리북에 상태별 스크린샷 테스트 도입</li>
       <li>컴포넌트 prop 타입을 문서화하여 FE/디자이너 합의</li>
       <li>이슈 로그: INFO-030 / 스프린트-02</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인-개발 간 소스오브트루스를 정리하면 QA 소요가 크게 준다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'design_ui_component', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (1,
     'Batch Stream 리팩토링 회고 #03',
     ' 
     <h3>배경</h3>
     <p>스프린트 3 에서 대용량 배치 로그를 Stream으로 리팩토링하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>groupingBy 단계에서 Null 값 때문에 NPE와 성능 저하가 동시에 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>null-safe filter와 map 단계 분리</li>
       <li>Collectors.toMap에 merge 함수 지정</li>
       <li>parallel 스트림 대신 sequential로 회귀</li>
       <li>이슈 로그: INFO-031 / 스프린트-03</li>
     </ul>

     <h3>배운 점</h3>
     <p>스트림 설계는 가독성이 좋아도 예외 흐름을 먼저 정의해야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_java', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (2,
     'Spring Boot 운영 이슈 기록 #03',
     ' 
     <h3>배경</h3>
     <p>스프린트 3 에서 신규 REST API를 운영 반영하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>CORS와 Bean Validation 에러가 로드밸런서 뒤에서만 재현 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>SecurityFilterChain에 corsConfigurationSource 주입</li>
       <li>ConstraintViolation 로그를 MDC에 포함</li>
       <li>헬스체크 엔드포인트를 별도 프로필로 분리</li>
       <li>이슈 로그: INFO-032 / 스프린트-03</li>
     </ul>

     <h3>배운 점</h3>
     <p>운영 환경의 체이닝을 그대로 흉내 낸 통합 테스트가 필수임을 체감했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_springboot', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (3,
     'JPA N+1 탈출기 #03',
     ' 
     <h3>배경</h3>
     <p>스프린트 3 에서 조회 API 응답 시간이 스파이크를 치며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>toOne 연관관계가 모두 Lazy라 fetch join 없이 N+1이 폭발 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>Querydsl로 fetch join + batch size 적용</li>
       <li>조회 전용 DTO 프로젝션으로 페이로드 축소</li>
       <li>읽기 전용 트랜잭션으로 2차 캐시 활용</li>
       <li>이슈 로그: INFO-033 / 스프린트-03</li>
     </ul>

     <h3>배운 점</h3>
     <p>toOne fetch 전략과 조회 전용 쿼리를 초기에 설계했어야 했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_jpa', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (4,
     'Toast UI 연동 삽질기 #03',
     ' 
     <h3>배경</h3>
     <p>스프린트 3 에서 Toast UI Editor/Viewer를 공지 작성 페이지에 붙이며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>이미지 업로드 훅이 두 번 호출되고 상태가 꼬이는 문제 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>custom image hook에서 debounce 처리</li>
       <li>unmount 시 editorInstance.destroy로 메모리 정리</li>
       <li>drag&drop 업로드는 presigned URL 응답으로 교체</li>
       <li>이슈 로그: INFO-034 / 스프린트-03</li>
     </ul>

     <h3>배운 점</h3>
     <p>에디터 라이프사이클을 명확히 관리하지 않으면 예상치 못한 렌더링이 발생한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_react', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (5,
     '부트스트랩 테마 튜닝 노트 #03',
     ' 
     <h3>배경</h3>
     <p>스프린트 3 에서 디자인 시스템 맞춰 부트스트랩 변수를 재정의하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>다크모드 토글 시 focus outline이 사라져 접근성 기준을 놓침 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>CSS 변수로 색상 토큰 통합</li>
       <li>focus-visible 기반 outline 재적용</li>
       <li>Toast 메시지 대비비율을 WCAG AA 이상으로 조정</li>
       <li>이슈 로그: INFO-035 / 스프린트-03</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인 토큰을 먼저 잡아두면 테마 전환과 접근성 대응이 쉬워진다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_ui', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (6,
     'Docker Compose 안정화 기록 #03',
     ' 
     <h3>배경</h3>
     <p>스프린트 3 에서 로컬 개발환경을 Compose로 단일화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>컨테이너 간 DNS 지연으로 애플리케이션 부팅이 랜덤하게 실패 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>healthcheck와 depends_on 조건 강화</li>
       <li>네트워크 모드를 bridge 단일 네트워크로 통일</li>
       <li>환경변수를 .env로 모아 온보딩 속도 개선</li>
       <li>이슈 로그: INFO-036 / 스프린트-03</li>
     </ul>

     <h3>배운 점</h3>
     <p>헬스체크를 설계에 포함시키면 팀 전체 개발 경험이 안정된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_docker', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (7,
     '배포 자동화 회고 #03',
     ' 
     <h3>배경</h3>
     <p>스프린트 3 에서 배포 파이프라인을 blue-green에서 canary로 전환하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>초기 canary 트래픽 분배가 잘못되어 세션 스티키가 깨짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>ALB 타겟 그룹 가중치 재조정 자동화</li>
       <li>배포 단계별 슬랙 알림에 메트릭 링크 포함</li>
       <li>롤백 스크립트에 DB 마이그레이션 검증 추가</li>
       <li>이슈 로그: INFO-037 / 스프린트-03</li>
     </ul>

     <h3>배운 점</h3>
     <p>점진적 배포는 메트릭과 롤백 스크립트가 함께 설계되어야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_deploy', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (8,
     '인덱스 튜닝 실습 메모 #03',
     ' 
     <h3>배경</h3>
     <p>스프린트 3 에서 월간 리포트 쿼리를 최적화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>범위 조건과 정렬 조건이 복합 인덱스를 타지 못해 full scan 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>커버링 인덱스와 힌트를 실험</li>
       <li>gather stats로 최신 통계 반영</li>
       <li>불필요한 함수 사용을 제거해 검색 조건 단순화</li>
       <li>이슈 로그: INFO-038 / 스프린트-03</li>
     </ul>

     <h3>배운 점</h3>
     <p>실행 계획은 데이터 분포가 바뀔 때마다 다시 검증해야 한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'database_tuning', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (9,
     '분류 모델 운영 체험기 #03',
     ' 
     <h3>배경</h3>
     <p>스프린트 3 에서 간단한 분류 모델을 배포해 주간 리포트를 생성하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>피처 스케일이 drift 되어 F1 점수가 스프린트마다 흔들림 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>모니터링에 feature distribution 로그 추가</li>
       <li>베이스라인과 최신 모델을 shadow 테스트</li>
       <li>전처리 파이프라인을 모델 버전과 함께 고정</li>
       <li>이슈 로그: INFO-039 / 스프린트-03</li>
     </ul>

     <h3>배운 점</h3>
     <p>모델 품질은 파이프라인 재현성과 모니터링이 함께 가야 유지된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'ai_ml_classification', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (10,
     '디자인 시스템 QA 로그 #03',
     ' 
     <h3>배경</h3>
     <p>스프린트 3 에서 새로운 UI 컴포넌트 라이브러리를 배포하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>Figma 토큰과 실제 CSS 변수 값이 어긋나 브랜드 컬러가 틀어짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>디자인 토큰 스냅샷을 CI에 추가</li>
       <li>스토리북에 상태별 스크린샷 테스트 도입</li>
       <li>컴포넌트 prop 타입을 문서화하여 FE/디자이너 합의</li>
       <li>이슈 로그: INFO-040 / 스프린트-03</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인-개발 간 소스오브트루스를 정리하면 QA 소요가 크게 준다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'design_ui_component', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (1,
     'Batch Stream 리팩토링 회고 #04',
     ' 
     <h3>배경</h3>
     <p>스프린트 4 에서 대용량 배치 로그를 Stream으로 리팩토링하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>groupingBy 단계에서 Null 값 때문에 NPE와 성능 저하가 동시에 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>null-safe filter와 map 단계 분리</li>
       <li>Collectors.toMap에 merge 함수 지정</li>
       <li>parallel 스트림 대신 sequential로 회귀</li>
       <li>이슈 로그: INFO-041 / 스프린트-04</li>
     </ul>

     <h3>배운 점</h3>
     <p>스트림 설계는 가독성이 좋아도 예외 흐름을 먼저 정의해야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_java', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (2,
     'Spring Boot 운영 이슈 기록 #04',
     ' 
     <h3>배경</h3>
     <p>스프린트 4 에서 신규 REST API를 운영 반영하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>CORS와 Bean Validation 에러가 로드밸런서 뒤에서만 재현 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>SecurityFilterChain에 corsConfigurationSource 주입</li>
       <li>ConstraintViolation 로그를 MDC에 포함</li>
       <li>헬스체크 엔드포인트를 별도 프로필로 분리</li>
       <li>이슈 로그: INFO-042 / 스프린트-04</li>
     </ul>

     <h3>배운 점</h3>
     <p>운영 환경의 체이닝을 그대로 흉내 낸 통합 테스트가 필수임을 체감했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_springboot', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (3,
     'JPA N+1 탈출기 #04',
     ' 
     <h3>배경</h3>
     <p>스프린트 4 에서 조회 API 응답 시간이 스파이크를 치며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>toOne 연관관계가 모두 Lazy라 fetch join 없이 N+1이 폭발 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>Querydsl로 fetch join + batch size 적용</li>
       <li>조회 전용 DTO 프로젝션으로 페이로드 축소</li>
       <li>읽기 전용 트랜잭션으로 2차 캐시 활용</li>
       <li>이슈 로그: INFO-043 / 스프린트-04</li>
     </ul>

     <h3>배운 점</h3>
     <p>toOne fetch 전략과 조회 전용 쿼리를 초기에 설계했어야 했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_jpa', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (4,
     'Toast UI 연동 삽질기 #04',
     ' 
     <h3>배경</h3>
     <p>스프린트 4 에서 Toast UI Editor/Viewer를 공지 작성 페이지에 붙이며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>이미지 업로드 훅이 두 번 호출되고 상태가 꼬이는 문제 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>custom image hook에서 debounce 처리</li>
       <li>unmount 시 editorInstance.destroy로 메모리 정리</li>
       <li>drag&drop 업로드는 presigned URL 응답으로 교체</li>
       <li>이슈 로그: INFO-044 / 스프린트-04</li>
     </ul>

     <h3>배운 점</h3>
     <p>에디터 라이프사이클을 명확히 관리하지 않으면 예상치 못한 렌더링이 발생한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_react', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (5,
     '부트스트랩 테마 튜닝 노트 #04',
     ' 
     <h3>배경</h3>
     <p>스프린트 4 에서 디자인 시스템 맞춰 부트스트랩 변수를 재정의하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>다크모드 토글 시 focus outline이 사라져 접근성 기준을 놓침 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>CSS 변수로 색상 토큰 통합</li>
       <li>focus-visible 기반 outline 재적용</li>
       <li>Toast 메시지 대비비율을 WCAG AA 이상으로 조정</li>
       <li>이슈 로그: INFO-045 / 스프린트-04</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인 토큰을 먼저 잡아두면 테마 전환과 접근성 대응이 쉬워진다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_ui', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (6,
     'Docker Compose 안정화 기록 #04',
     ' 
     <h3>배경</h3>
     <p>스프린트 4 에서 로컬 개발환경을 Compose로 단일화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>컨테이너 간 DNS 지연으로 애플리케이션 부팅이 랜덤하게 실패 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>healthcheck와 depends_on 조건 강화</li>
       <li>네트워크 모드를 bridge 단일 네트워크로 통일</li>
       <li>환경변수를 .env로 모아 온보딩 속도 개선</li>
       <li>이슈 로그: INFO-046 / 스프린트-04</li>
     </ul>

     <h3>배운 점</h3>
     <p>헬스체크를 설계에 포함시키면 팀 전체 개발 경험이 안정된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_docker', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (7,
     '배포 자동화 회고 #04',
     ' 
     <h3>배경</h3>
     <p>스프린트 4 에서 배포 파이프라인을 blue-green에서 canary로 전환하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>초기 canary 트래픽 분배가 잘못되어 세션 스티키가 깨짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>ALB 타겟 그룹 가중치 재조정 자동화</li>
       <li>배포 단계별 슬랙 알림에 메트릭 링크 포함</li>
       <li>롤백 스크립트에 DB 마이그레이션 검증 추가</li>
       <li>이슈 로그: INFO-047 / 스프린트-04</li>
     </ul>

     <h3>배운 점</h3>
     <p>점진적 배포는 메트릭과 롤백 스크립트가 함께 설계되어야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_deploy', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (8,
     '인덱스 튜닝 실습 메모 #04',
     ' 
     <h3>배경</h3>
     <p>스프린트 4 에서 월간 리포트 쿼리를 최적화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>범위 조건과 정렬 조건이 복합 인덱스를 타지 못해 full scan 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>커버링 인덱스와 힌트를 실험</li>
       <li>gather stats로 최신 통계 반영</li>
       <li>불필요한 함수 사용을 제거해 검색 조건 단순화</li>
       <li>이슈 로그: INFO-048 / 스프린트-04</li>
     </ul>

     <h3>배운 점</h3>
     <p>실행 계획은 데이터 분포가 바뀔 때마다 다시 검증해야 한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'database_tuning', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (9,
     '분류 모델 운영 체험기 #04',
     ' 
     <h3>배경</h3>
     <p>스프린트 4 에서 간단한 분류 모델을 배포해 주간 리포트를 생성하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>피처 스케일이 drift 되어 F1 점수가 스프린트마다 흔들림 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>모니터링에 feature distribution 로그 추가</li>
       <li>베이스라인과 최신 모델을 shadow 테스트</li>
       <li>전처리 파이프라인을 모델 버전과 함께 고정</li>
       <li>이슈 로그: INFO-049 / 스프린트-04</li>
     </ul>

     <h3>배운 점</h3>
     <p>모델 품질은 파이프라인 재현성과 모니터링이 함께 가야 유지된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'ai_ml_classification', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (10,
     '디자인 시스템 QA 로그 #04',
     ' 
     <h3>배경</h3>
     <p>스프린트 4 에서 새로운 UI 컴포넌트 라이브러리를 배포하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>Figma 토큰과 실제 CSS 변수 값이 어긋나 브랜드 컬러가 틀어짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>디자인 토큰 스냅샷을 CI에 추가</li>
       <li>스토리북에 상태별 스크린샷 테스트 도입</li>
       <li>컴포넌트 prop 타입을 문서화하여 FE/디자이너 합의</li>
       <li>이슈 로그: INFO-050 / 스프린트-04</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인-개발 간 소스오브트루스를 정리하면 QA 소요가 크게 준다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'design_ui_component', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (1,
     'Batch Stream 리팩토링 회고 #05',
     ' 
     <h3>배경</h3>
     <p>스프린트 5 에서 대용량 배치 로그를 Stream으로 리팩토링하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>groupingBy 단계에서 Null 값 때문에 NPE와 성능 저하가 동시에 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>null-safe filter와 map 단계 분리</li>
       <li>Collectors.toMap에 merge 함수 지정</li>
       <li>parallel 스트림 대신 sequential로 회귀</li>
       <li>이슈 로그: INFO-051 / 스프린트-05</li>
     </ul>

     <h3>배운 점</h3>
     <p>스트림 설계는 가독성이 좋아도 예외 흐름을 먼저 정의해야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_java', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (2,
     'Spring Boot 운영 이슈 기록 #05',
     ' 
     <h3>배경</h3>
     <p>스프린트 5 에서 신규 REST API를 운영 반영하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>CORS와 Bean Validation 에러가 로드밸런서 뒤에서만 재현 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>SecurityFilterChain에 corsConfigurationSource 주입</li>
       <li>ConstraintViolation 로그를 MDC에 포함</li>
       <li>헬스체크 엔드포인트를 별도 프로필로 분리</li>
       <li>이슈 로그: INFO-052 / 스프린트-05</li>
     </ul>

     <h3>배운 점</h3>
     <p>운영 환경의 체이닝을 그대로 흉내 낸 통합 테스트가 필수임을 체감했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_springboot', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (3,
     'JPA N+1 탈출기 #05',
     ' 
     <h3>배경</h3>
     <p>스프린트 5 에서 조회 API 응답 시간이 스파이크를 치며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>toOne 연관관계가 모두 Lazy라 fetch join 없이 N+1이 폭발 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>Querydsl로 fetch join + batch size 적용</li>
       <li>조회 전용 DTO 프로젝션으로 페이로드 축소</li>
       <li>읽기 전용 트랜잭션으로 2차 캐시 활용</li>
       <li>이슈 로그: INFO-053 / 스프린트-05</li>
     </ul>

     <h3>배운 점</h3>
     <p>toOne fetch 전략과 조회 전용 쿼리를 초기에 설계했어야 했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_jpa', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (4,
     'Toast UI 연동 삽질기 #05',
     ' 
     <h3>배경</h3>
     <p>스프린트 5 에서 Toast UI Editor/Viewer를 공지 작성 페이지에 붙이며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>이미지 업로드 훅이 두 번 호출되고 상태가 꼬이는 문제 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>custom image hook에서 debounce 처리</li>
       <li>unmount 시 editorInstance.destroy로 메모리 정리</li>
       <li>drag&drop 업로드는 presigned URL 응답으로 교체</li>
       <li>이슈 로그: INFO-054 / 스프린트-05</li>
     </ul>

     <h3>배운 점</h3>
     <p>에디터 라이프사이클을 명확히 관리하지 않으면 예상치 못한 렌더링이 발생한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_react', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (5,
     '부트스트랩 테마 튜닝 노트 #05',
     ' 
     <h3>배경</h3>
     <p>스프린트 5 에서 디자인 시스템 맞춰 부트스트랩 변수를 재정의하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>다크모드 토글 시 focus outline이 사라져 접근성 기준을 놓침 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>CSS 변수로 색상 토큰 통합</li>
       <li>focus-visible 기반 outline 재적용</li>
       <li>Toast 메시지 대비비율을 WCAG AA 이상으로 조정</li>
       <li>이슈 로그: INFO-055 / 스프린트-05</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인 토큰을 먼저 잡아두면 테마 전환과 접근성 대응이 쉬워진다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_ui', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (6,
     'Docker Compose 안정화 기록 #05',
     ' 
     <h3>배경</h3>
     <p>스프린트 5 에서 로컬 개발환경을 Compose로 단일화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>컨테이너 간 DNS 지연으로 애플리케이션 부팅이 랜덤하게 실패 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>healthcheck와 depends_on 조건 강화</li>
       <li>네트워크 모드를 bridge 단일 네트워크로 통일</li>
       <li>환경변수를 .env로 모아 온보딩 속도 개선</li>
       <li>이슈 로그: INFO-056 / 스프린트-05</li>
     </ul>

     <h3>배운 점</h3>
     <p>헬스체크를 설계에 포함시키면 팀 전체 개발 경험이 안정된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_docker', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (7,
     '배포 자동화 회고 #05',
     ' 
     <h3>배경</h3>
     <p>스프린트 5 에서 배포 파이프라인을 blue-green에서 canary로 전환하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>초기 canary 트래픽 분배가 잘못되어 세션 스티키가 깨짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>ALB 타겟 그룹 가중치 재조정 자동화</li>
       <li>배포 단계별 슬랙 알림에 메트릭 링크 포함</li>
       <li>롤백 스크립트에 DB 마이그레이션 검증 추가</li>
       <li>이슈 로그: INFO-057 / 스프린트-05</li>
     </ul>

     <h3>배운 점</h3>
     <p>점진적 배포는 메트릭과 롤백 스크립트가 함께 설계되어야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_deploy', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (8,
     '인덱스 튜닝 실습 메모 #05',
     ' 
     <h3>배경</h3>
     <p>스프린트 5 에서 월간 리포트 쿼리를 최적화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>범위 조건과 정렬 조건이 복합 인덱스를 타지 못해 full scan 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>커버링 인덱스와 힌트를 실험</li>
       <li>gather stats로 최신 통계 반영</li>
       <li>불필요한 함수 사용을 제거해 검색 조건 단순화</li>
       <li>이슈 로그: INFO-058 / 스프린트-05</li>
     </ul>

     <h3>배운 점</h3>
     <p>실행 계획은 데이터 분포가 바뀔 때마다 다시 검증해야 한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'database_tuning', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (9,
     '분류 모델 운영 체험기 #05',
     ' 
     <h3>배경</h3>
     <p>스프린트 5 에서 간단한 분류 모델을 배포해 주간 리포트를 생성하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>피처 스케일이 drift 되어 F1 점수가 스프린트마다 흔들림 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>모니터링에 feature distribution 로그 추가</li>
       <li>베이스라인과 최신 모델을 shadow 테스트</li>
       <li>전처리 파이프라인을 모델 버전과 함께 고정</li>
       <li>이슈 로그: INFO-059 / 스프린트-05</li>
     </ul>

     <h3>배운 점</h3>
     <p>모델 품질은 파이프라인 재현성과 모니터링이 함께 가야 유지된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'ai_ml_classification', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (10,
     '디자인 시스템 QA 로그 #05',
     ' 
     <h3>배경</h3>
     <p>스프린트 5 에서 새로운 UI 컴포넌트 라이브러리를 배포하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>Figma 토큰과 실제 CSS 변수 값이 어긋나 브랜드 컬러가 틀어짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>디자인 토큰 스냅샷을 CI에 추가</li>
       <li>스토리북에 상태별 스크린샷 테스트 도입</li>
       <li>컴포넌트 prop 타입을 문서화하여 FE/디자이너 합의</li>
       <li>이슈 로그: INFO-060 / 스프린트-05</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인-개발 간 소스오브트루스를 정리하면 QA 소요가 크게 준다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'design_ui_component', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (1,
     'Batch Stream 리팩토링 회고 #06',
     ' 
     <h3>배경</h3>
     <p>스프린트 6 에서 대용량 배치 로그를 Stream으로 리팩토링하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>groupingBy 단계에서 Null 값 때문에 NPE와 성능 저하가 동시에 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>null-safe filter와 map 단계 분리</li>
       <li>Collectors.toMap에 merge 함수 지정</li>
       <li>parallel 스트림 대신 sequential로 회귀</li>
       <li>이슈 로그: INFO-061 / 스프린트-06</li>
     </ul>

     <h3>배운 점</h3>
     <p>스트림 설계는 가독성이 좋아도 예외 흐름을 먼저 정의해야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_java', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (2,
     'Spring Boot 운영 이슈 기록 #06',
     ' 
     <h3>배경</h3>
     <p>스프린트 6 에서 신규 REST API를 운영 반영하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>CORS와 Bean Validation 에러가 로드밸런서 뒤에서만 재현 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>SecurityFilterChain에 corsConfigurationSource 주입</li>
       <li>ConstraintViolation 로그를 MDC에 포함</li>
       <li>헬스체크 엔드포인트를 별도 프로필로 분리</li>
       <li>이슈 로그: INFO-062 / 스프린트-06</li>
     </ul>

     <h3>배운 점</h3>
     <p>운영 환경의 체이닝을 그대로 흉내 낸 통합 테스트가 필수임을 체감했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_springboot', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (3,
     'JPA N+1 탈출기 #06',
     ' 
     <h3>배경</h3>
     <p>스프린트 6 에서 조회 API 응답 시간이 스파이크를 치며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>toOne 연관관계가 모두 Lazy라 fetch join 없이 N+1이 폭발 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>Querydsl로 fetch join + batch size 적용</li>
       <li>조회 전용 DTO 프로젝션으로 페이로드 축소</li>
       <li>읽기 전용 트랜잭션으로 2차 캐시 활용</li>
       <li>이슈 로그: INFO-063 / 스프린트-06</li>
     </ul>

     <h3>배운 점</h3>
     <p>toOne fetch 전략과 조회 전용 쿼리를 초기에 설계했어야 했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_jpa', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (4,
     'Toast UI 연동 삽질기 #06',
     ' 
     <h3>배경</h3>
     <p>스프린트 6 에서 Toast UI Editor/Viewer를 공지 작성 페이지에 붙이며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>이미지 업로드 훅이 두 번 호출되고 상태가 꼬이는 문제 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>custom image hook에서 debounce 처리</li>
       <li>unmount 시 editorInstance.destroy로 메모리 정리</li>
       <li>drag&drop 업로드는 presigned URL 응답으로 교체</li>
       <li>이슈 로그: INFO-064 / 스프린트-06</li>
     </ul>

     <h3>배운 점</h3>
     <p>에디터 라이프사이클을 명확히 관리하지 않으면 예상치 못한 렌더링이 발생한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_react', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (5,
     '부트스트랩 테마 튜닝 노트 #06',
     ' 
     <h3>배경</h3>
     <p>스프린트 6 에서 디자인 시스템 맞춰 부트스트랩 변수를 재정의하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>다크모드 토글 시 focus outline이 사라져 접근성 기준을 놓침 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>CSS 변수로 색상 토큰 통합</li>
       <li>focus-visible 기반 outline 재적용</li>
       <li>Toast 메시지 대비비율을 WCAG AA 이상으로 조정</li>
       <li>이슈 로그: INFO-065 / 스프린트-06</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인 토큰을 먼저 잡아두면 테마 전환과 접근성 대응이 쉬워진다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_ui', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (6,
     'Docker Compose 안정화 기록 #06',
     ' 
     <h3>배경</h3>
     <p>스프린트 6 에서 로컬 개발환경을 Compose로 단일화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>컨테이너 간 DNS 지연으로 애플리케이션 부팅이 랜덤하게 실패 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>healthcheck와 depends_on 조건 강화</li>
       <li>네트워크 모드를 bridge 단일 네트워크로 통일</li>
       <li>환경변수를 .env로 모아 온보딩 속도 개선</li>
       <li>이슈 로그: INFO-066 / 스프린트-06</li>
     </ul>

     <h3>배운 점</h3>
     <p>헬스체크를 설계에 포함시키면 팀 전체 개발 경험이 안정된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_docker', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (7,
     '배포 자동화 회고 #06',
     ' 
     <h3>배경</h3>
     <p>스프린트 6 에서 배포 파이프라인을 blue-green에서 canary로 전환하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>초기 canary 트래픽 분배가 잘못되어 세션 스티키가 깨짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>ALB 타겟 그룹 가중치 재조정 자동화</li>
       <li>배포 단계별 슬랙 알림에 메트릭 링크 포함</li>
       <li>롤백 스크립트에 DB 마이그레이션 검증 추가</li>
       <li>이슈 로그: INFO-067 / 스프린트-06</li>
     </ul>

     <h3>배운 점</h3>
     <p>점진적 배포는 메트릭과 롤백 스크립트가 함께 설계되어야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_deploy', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (8,
     '인덱스 튜닝 실습 메모 #06',
     ' 
     <h3>배경</h3>
     <p>스프린트 6 에서 월간 리포트 쿼리를 최적화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>범위 조건과 정렬 조건이 복합 인덱스를 타지 못해 full scan 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>커버링 인덱스와 힌트를 실험</li>
       <li>gather stats로 최신 통계 반영</li>
       <li>불필요한 함수 사용을 제거해 검색 조건 단순화</li>
       <li>이슈 로그: INFO-068 / 스프린트-06</li>
     </ul>

     <h3>배운 점</h3>
     <p>실행 계획은 데이터 분포가 바뀔 때마다 다시 검증해야 한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'database_tuning', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (9,
     '분류 모델 운영 체험기 #06',
     ' 
     <h3>배경</h3>
     <p>스프린트 6 에서 간단한 분류 모델을 배포해 주간 리포트를 생성하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>피처 스케일이 drift 되어 F1 점수가 스프린트마다 흔들림 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>모니터링에 feature distribution 로그 추가</li>
       <li>베이스라인과 최신 모델을 shadow 테스트</li>
       <li>전처리 파이프라인을 모델 버전과 함께 고정</li>
       <li>이슈 로그: INFO-069 / 스프린트-06</li>
     </ul>

     <h3>배운 점</h3>
     <p>모델 품질은 파이프라인 재현성과 모니터링이 함께 가야 유지된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'ai_ml_classification', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (10,
     '디자인 시스템 QA 로그 #06',
     ' 
     <h3>배경</h3>
     <p>스프린트 6 에서 새로운 UI 컴포넌트 라이브러리를 배포하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>Figma 토큰과 실제 CSS 변수 값이 어긋나 브랜드 컬러가 틀어짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>디자인 토큰 스냅샷을 CI에 추가</li>
       <li>스토리북에 상태별 스크린샷 테스트 도입</li>
       <li>컴포넌트 prop 타입을 문서화하여 FE/디자이너 합의</li>
       <li>이슈 로그: INFO-070 / 스프린트-06</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인-개발 간 소스오브트루스를 정리하면 QA 소요가 크게 준다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'design_ui_component', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (1,
     'Batch Stream 리팩토링 회고 #07',
     ' 
     <h3>배경</h3>
     <p>스프린트 7 에서 대용량 배치 로그를 Stream으로 리팩토링하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>groupingBy 단계에서 Null 값 때문에 NPE와 성능 저하가 동시에 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>null-safe filter와 map 단계 분리</li>
       <li>Collectors.toMap에 merge 함수 지정</li>
       <li>parallel 스트림 대신 sequential로 회귀</li>
       <li>이슈 로그: INFO-071 / 스프린트-07</li>
     </ul>

     <h3>배운 점</h3>
     <p>스트림 설계는 가독성이 좋아도 예외 흐름을 먼저 정의해야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_java', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (2,
     'Spring Boot 운영 이슈 기록 #07',
     ' 
     <h3>배경</h3>
     <p>스프린트 7 에서 신규 REST API를 운영 반영하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>CORS와 Bean Validation 에러가 로드밸런서 뒤에서만 재현 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>SecurityFilterChain에 corsConfigurationSource 주입</li>
       <li>ConstraintViolation 로그를 MDC에 포함</li>
       <li>헬스체크 엔드포인트를 별도 프로필로 분리</li>
       <li>이슈 로그: INFO-072 / 스프린트-07</li>
     </ul>

     <h3>배운 점</h3>
     <p>운영 환경의 체이닝을 그대로 흉내 낸 통합 테스트가 필수임을 체감했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_springboot', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (3,
     'JPA N+1 탈출기 #07',
     ' 
     <h3>배경</h3>
     <p>스프린트 7 에서 조회 API 응답 시간이 스파이크를 치며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>toOne 연관관계가 모두 Lazy라 fetch join 없이 N+1이 폭발 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>Querydsl로 fetch join + batch size 적용</li>
       <li>조회 전용 DTO 프로젝션으로 페이로드 축소</li>
       <li>읽기 전용 트랜잭션으로 2차 캐시 활용</li>
       <li>이슈 로그: INFO-073 / 스프린트-07</li>
     </ul>

     <h3>배운 점</h3>
     <p>toOne fetch 전략과 조회 전용 쿼리를 초기에 설계했어야 했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_jpa', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (4,
     'Toast UI 연동 삽질기 #07',
     ' 
     <h3>배경</h3>
     <p>스프린트 7 에서 Toast UI Editor/Viewer를 공지 작성 페이지에 붙이며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>이미지 업로드 훅이 두 번 호출되고 상태가 꼬이는 문제 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>custom image hook에서 debounce 처리</li>
       <li>unmount 시 editorInstance.destroy로 메모리 정리</li>
       <li>drag&drop 업로드는 presigned URL 응답으로 교체</li>
       <li>이슈 로그: INFO-074 / 스프린트-07</li>
     </ul>

     <h3>배운 점</h3>
     <p>에디터 라이프사이클을 명확히 관리하지 않으면 예상치 못한 렌더링이 발생한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_react', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (5,
     '부트스트랩 테마 튜닝 노트 #07',
     ' 
     <h3>배경</h3>
     <p>스프린트 7 에서 디자인 시스템 맞춰 부트스트랩 변수를 재정의하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>다크모드 토글 시 focus outline이 사라져 접근성 기준을 놓침 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>CSS 변수로 색상 토큰 통합</li>
       <li>focus-visible 기반 outline 재적용</li>
       <li>Toast 메시지 대비비율을 WCAG AA 이상으로 조정</li>
       <li>이슈 로그: INFO-075 / 스프린트-07</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인 토큰을 먼저 잡아두면 테마 전환과 접근성 대응이 쉬워진다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_ui', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (6,
     'Docker Compose 안정화 기록 #07',
     ' 
     <h3>배경</h3>
     <p>스프린트 7 에서 로컬 개발환경을 Compose로 단일화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>컨테이너 간 DNS 지연으로 애플리케이션 부팅이 랜덤하게 실패 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>healthcheck와 depends_on 조건 강화</li>
       <li>네트워크 모드를 bridge 단일 네트워크로 통일</li>
       <li>환경변수를 .env로 모아 온보딩 속도 개선</li>
       <li>이슈 로그: INFO-076 / 스프린트-07</li>
     </ul>

     <h3>배운 점</h3>
     <p>헬스체크를 설계에 포함시키면 팀 전체 개발 경험이 안정된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_docker', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (7,
     '배포 자동화 회고 #07',
     ' 
     <h3>배경</h3>
     <p>스프린트 7 에서 배포 파이프라인을 blue-green에서 canary로 전환하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>초기 canary 트래픽 분배가 잘못되어 세션 스티키가 깨짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>ALB 타겟 그룹 가중치 재조정 자동화</li>
       <li>배포 단계별 슬랙 알림에 메트릭 링크 포함</li>
       <li>롤백 스크립트에 DB 마이그레이션 검증 추가</li>
       <li>이슈 로그: INFO-077 / 스프린트-07</li>
     </ul>

     <h3>배운 점</h3>
     <p>점진적 배포는 메트릭과 롤백 스크립트가 함께 설계되어야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_deploy', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (8,
     '인덱스 튜닝 실습 메모 #07',
     ' 
     <h3>배경</h3>
     <p>스프린트 7 에서 월간 리포트 쿼리를 최적화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>범위 조건과 정렬 조건이 복합 인덱스를 타지 못해 full scan 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>커버링 인덱스와 힌트를 실험</li>
       <li>gather stats로 최신 통계 반영</li>
       <li>불필요한 함수 사용을 제거해 검색 조건 단순화</li>
       <li>이슈 로그: INFO-078 / 스프린트-07</li>
     </ul>

     <h3>배운 점</h3>
     <p>실행 계획은 데이터 분포가 바뀔 때마다 다시 검증해야 한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'database_tuning', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (9,
     '분류 모델 운영 체험기 #07',
     ' 
     <h3>배경</h3>
     <p>스프린트 7 에서 간단한 분류 모델을 배포해 주간 리포트를 생성하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>피처 스케일이 drift 되어 F1 점수가 스프린트마다 흔들림 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>모니터링에 feature distribution 로그 추가</li>
       <li>베이스라인과 최신 모델을 shadow 테스트</li>
       <li>전처리 파이프라인을 모델 버전과 함께 고정</li>
       <li>이슈 로그: INFO-079 / 스프린트-07</li>
     </ul>

     <h3>배운 점</h3>
     <p>모델 품질은 파이프라인 재현성과 모니터링이 함께 가야 유지된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'ai_ml_classification', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (10,
     '디자인 시스템 QA 로그 #07',
     ' 
     <h3>배경</h3>
     <p>스프린트 7 에서 새로운 UI 컴포넌트 라이브러리를 배포하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>Figma 토큰과 실제 CSS 변수 값이 어긋나 브랜드 컬러가 틀어짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>디자인 토큰 스냅샷을 CI에 추가</li>
       <li>스토리북에 상태별 스크린샷 테스트 도입</li>
       <li>컴포넌트 prop 타입을 문서화하여 FE/디자이너 합의</li>
       <li>이슈 로그: INFO-080 / 스프린트-07</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인-개발 간 소스오브트루스를 정리하면 QA 소요가 크게 준다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'design_ui_component', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (1,
     'Batch Stream 리팩토링 회고 #08',
     ' 
     <h3>배경</h3>
     <p>스프린트 8 에서 대용량 배치 로그를 Stream으로 리팩토링하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>groupingBy 단계에서 Null 값 때문에 NPE와 성능 저하가 동시에 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>null-safe filter와 map 단계 분리</li>
       <li>Collectors.toMap에 merge 함수 지정</li>
       <li>parallel 스트림 대신 sequential로 회귀</li>
       <li>이슈 로그: INFO-081 / 스프린트-08</li>
     </ul>

     <h3>배운 점</h3>
     <p>스트림 설계는 가독성이 좋아도 예외 흐름을 먼저 정의해야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_java', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (2,
     'Spring Boot 운영 이슈 기록 #08',
     ' 
     <h3>배경</h3>
     <p>스프린트 8 에서 신규 REST API를 운영 반영하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>CORS와 Bean Validation 에러가 로드밸런서 뒤에서만 재현 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>SecurityFilterChain에 corsConfigurationSource 주입</li>
       <li>ConstraintViolation 로그를 MDC에 포함</li>
       <li>헬스체크 엔드포인트를 별도 프로필로 분리</li>
       <li>이슈 로그: INFO-082 / 스프린트-08</li>
     </ul>

     <h3>배운 점</h3>
     <p>운영 환경의 체이닝을 그대로 흉내 낸 통합 테스트가 필수임을 체감했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_springboot', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (3,
     'JPA N+1 탈출기 #08',
     ' 
     <h3>배경</h3>
     <p>스프린트 8 에서 조회 API 응답 시간이 스파이크를 치며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>toOne 연관관계가 모두 Lazy라 fetch join 없이 N+1이 폭발 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>Querydsl로 fetch join + batch size 적용</li>
       <li>조회 전용 DTO 프로젝션으로 페이로드 축소</li>
       <li>읽기 전용 트랜잭션으로 2차 캐시 활용</li>
       <li>이슈 로그: INFO-083 / 스프린트-08</li>
     </ul>

     <h3>배운 점</h3>
     <p>toOne fetch 전략과 조회 전용 쿼리를 초기에 설계했어야 했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_jpa', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (4,
     'Toast UI 연동 삽질기 #08',
     ' 
     <h3>배경</h3>
     <p>스프린트 8 에서 Toast UI Editor/Viewer를 공지 작성 페이지에 붙이며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>이미지 업로드 훅이 두 번 호출되고 상태가 꼬이는 문제 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>custom image hook에서 debounce 처리</li>
       <li>unmount 시 editorInstance.destroy로 메모리 정리</li>
       <li>drag&drop 업로드는 presigned URL 응답으로 교체</li>
       <li>이슈 로그: INFO-084 / 스프린트-08</li>
     </ul>

     <h3>배운 점</h3>
     <p>에디터 라이프사이클을 명확히 관리하지 않으면 예상치 못한 렌더링이 발생한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_react', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (5,
     '부트스트랩 테마 튜닝 노트 #08',
     ' 
     <h3>배경</h3>
     <p>스프린트 8 에서 디자인 시스템 맞춰 부트스트랩 변수를 재정의하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>다크모드 토글 시 focus outline이 사라져 접근성 기준을 놓침 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>CSS 변수로 색상 토큰 통합</li>
       <li>focus-visible 기반 outline 재적용</li>
       <li>Toast 메시지 대비비율을 WCAG AA 이상으로 조정</li>
       <li>이슈 로그: INFO-085 / 스프린트-08</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인 토큰을 먼저 잡아두면 테마 전환과 접근성 대응이 쉬워진다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_ui', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (6,
     'Docker Compose 안정화 기록 #08',
     ' 
     <h3>배경</h3>
     <p>스프린트 8 에서 로컬 개발환경을 Compose로 단일화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>컨테이너 간 DNS 지연으로 애플리케이션 부팅이 랜덤하게 실패 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>healthcheck와 depends_on 조건 강화</li>
       <li>네트워크 모드를 bridge 단일 네트워크로 통일</li>
       <li>환경변수를 .env로 모아 온보딩 속도 개선</li>
       <li>이슈 로그: INFO-086 / 스프린트-08</li>
     </ul>

     <h3>배운 점</h3>
     <p>헬스체크를 설계에 포함시키면 팀 전체 개발 경험이 안정된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_docker', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (7,
     '배포 자동화 회고 #08',
     ' 
     <h3>배경</h3>
     <p>스프린트 8 에서 배포 파이프라인을 blue-green에서 canary로 전환하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>초기 canary 트래픽 분배가 잘못되어 세션 스티키가 깨짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>ALB 타겟 그룹 가중치 재조정 자동화</li>
       <li>배포 단계별 슬랙 알림에 메트릭 링크 포함</li>
       <li>롤백 스크립트에 DB 마이그레이션 검증 추가</li>
       <li>이슈 로그: INFO-087 / 스프린트-08</li>
     </ul>

     <h3>배운 점</h3>
     <p>점진적 배포는 메트릭과 롤백 스크립트가 함께 설계되어야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_deploy', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (8,
     '인덱스 튜닝 실습 메모 #08',
     ' 
     <h3>배경</h3>
     <p>스프린트 8 에서 월간 리포트 쿼리를 최적화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>범위 조건과 정렬 조건이 복합 인덱스를 타지 못해 full scan 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>커버링 인덱스와 힌트를 실험</li>
       <li>gather stats로 최신 통계 반영</li>
       <li>불필요한 함수 사용을 제거해 검색 조건 단순화</li>
       <li>이슈 로그: INFO-088 / 스프린트-08</li>
     </ul>

     <h3>배운 점</h3>
     <p>실행 계획은 데이터 분포가 바뀔 때마다 다시 검증해야 한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'database_tuning', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (9,
     '분류 모델 운영 체험기 #08',
     ' 
     <h3>배경</h3>
     <p>스프린트 8 에서 간단한 분류 모델을 배포해 주간 리포트를 생성하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>피처 스케일이 drift 되어 F1 점수가 스프린트마다 흔들림 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>모니터링에 feature distribution 로그 추가</li>
       <li>베이스라인과 최신 모델을 shadow 테스트</li>
       <li>전처리 파이프라인을 모델 버전과 함께 고정</li>
       <li>이슈 로그: INFO-089 / 스프린트-08</li>
     </ul>

     <h3>배운 점</h3>
     <p>모델 품질은 파이프라인 재현성과 모니터링이 함께 가야 유지된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'ai_ml_classification', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (10,
     '디자인 시스템 QA 로그 #08',
     ' 
     <h3>배경</h3>
     <p>스프린트 8 에서 새로운 UI 컴포넌트 라이브러리를 배포하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>Figma 토큰과 실제 CSS 변수 값이 어긋나 브랜드 컬러가 틀어짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>디자인 토큰 스냅샷을 CI에 추가</li>
       <li>스토리북에 상태별 스크린샷 테스트 도입</li>
       <li>컴포넌트 prop 타입을 문서화하여 FE/디자이너 합의</li>
       <li>이슈 로그: INFO-090 / 스프린트-08</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인-개발 간 소스오브트루스를 정리하면 QA 소요가 크게 준다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'design_ui_component', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (1,
     'Batch Stream 리팩토링 회고 #09',
     ' 
     <h3>배경</h3>
     <p>스프린트 9 에서 대용량 배치 로그를 Stream으로 리팩토링하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>groupingBy 단계에서 Null 값 때문에 NPE와 성능 저하가 동시에 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>null-safe filter와 map 단계 분리</li>
       <li>Collectors.toMap에 merge 함수 지정</li>
       <li>parallel 스트림 대신 sequential로 회귀</li>
       <li>이슈 로그: INFO-091 / 스프린트-09</li>
     </ul>

     <h3>배운 점</h3>
     <p>스트림 설계는 가독성이 좋아도 예외 흐름을 먼저 정의해야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_java', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (2,
     'Spring Boot 운영 이슈 기록 #09',
     ' 
     <h3>배경</h3>
     <p>스프린트 9 에서 신규 REST API를 운영 반영하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>CORS와 Bean Validation 에러가 로드밸런서 뒤에서만 재현 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>SecurityFilterChain에 corsConfigurationSource 주입</li>
       <li>ConstraintViolation 로그를 MDC에 포함</li>
       <li>헬스체크 엔드포인트를 별도 프로필로 분리</li>
       <li>이슈 로그: INFO-092 / 스프린트-09</li>
     </ul>

     <h3>배운 점</h3>
     <p>운영 환경의 체이닝을 그대로 흉내 낸 통합 테스트가 필수임을 체감했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_springboot', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (3,
     'JPA N+1 탈출기 #09',
     ' 
     <h3>배경</h3>
     <p>스프린트 9 에서 조회 API 응답 시간이 스파이크를 치며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>toOne 연관관계가 모두 Lazy라 fetch join 없이 N+1이 폭발 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>Querydsl로 fetch join + batch size 적용</li>
       <li>조회 전용 DTO 프로젝션으로 페이로드 축소</li>
       <li>읽기 전용 트랜잭션으로 2차 캐시 활용</li>
       <li>이슈 로그: INFO-093 / 스프린트-09</li>
     </ul>

     <h3>배운 점</h3>
     <p>toOne fetch 전략과 조회 전용 쿼리를 초기에 설계했어야 했다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'backend_jpa', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (4,
     'Toast UI 연동 삽질기 #09',
     ' 
     <h3>배경</h3>
     <p>스프린트 9 에서 Toast UI Editor/Viewer를 공지 작성 페이지에 붙이며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>이미지 업로드 훅이 두 번 호출되고 상태가 꼬이는 문제 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>custom image hook에서 debounce 처리</li>
       <li>unmount 시 editorInstance.destroy로 메모리 정리</li>
       <li>drag&drop 업로드는 presigned URL 응답으로 교체</li>
       <li>이슈 로그: INFO-094 / 스프린트-09</li>
     </ul>

     <h3>배운 점</h3>
     <p>에디터 라이프사이클을 명확히 관리하지 않으면 예상치 못한 렌더링이 발생한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_react', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (5,
     '부트스트랩 테마 튜닝 노트 #09',
     ' 
     <h3>배경</h3>
     <p>스프린트 9 에서 디자인 시스템 맞춰 부트스트랩 변수를 재정의하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>다크모드 토글 시 focus outline이 사라져 접근성 기준을 놓침 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>CSS 변수로 색상 토큰 통합</li>
       <li>focus-visible 기반 outline 재적용</li>
       <li>Toast 메시지 대비비율을 WCAG AA 이상으로 조정</li>
       <li>이슈 로그: INFO-095 / 스프린트-09</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인 토큰을 먼저 잡아두면 테마 전환과 접근성 대응이 쉬워진다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'frontend_ui', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (6,
     'Docker Compose 안정화 기록 #09',
     ' 
     <h3>배경</h3>
     <p>스프린트 9 에서 로컬 개발환경을 Compose로 단일화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>컨테이너 간 DNS 지연으로 애플리케이션 부팅이 랜덤하게 실패 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>healthcheck와 depends_on 조건 강화</li>
       <li>네트워크 모드를 bridge 단일 네트워크로 통일</li>
       <li>환경변수를 .env로 모아 온보딩 속도 개선</li>
       <li>이슈 로그: INFO-096 / 스프린트-09</li>
     </ul>

     <h3>배운 점</h3>
     <p>헬스체크를 설계에 포함시키면 팀 전체 개발 경험이 안정된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_docker', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (7,
     '배포 자동화 회고 #09',
     ' 
     <h3>배경</h3>
     <p>스프린트 9 에서 배포 파이프라인을 blue-green에서 canary로 전환하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>초기 canary 트래픽 분배가 잘못되어 세션 스티키가 깨짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>ALB 타겟 그룹 가중치 재조정 자동화</li>
       <li>배포 단계별 슬랙 알림에 메트릭 링크 포함</li>
       <li>롤백 스크립트에 DB 마이그레이션 검증 추가</li>
       <li>이슈 로그: INFO-097 / 스프린트-09</li>
     </ul>

     <h3>배운 점</h3>
     <p>점진적 배포는 메트릭과 롤백 스크립트가 함께 설계되어야 안전하다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'devops_deploy', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (8,
     '인덱스 튜닝 실습 메모 #09',
     ' 
     <h3>배경</h3>
     <p>스프린트 9 에서 월간 리포트 쿼리를 최적화하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>범위 조건과 정렬 조건이 복합 인덱스를 타지 못해 full scan 발생 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>커버링 인덱스와 힌트를 실험</li>
       <li>gather stats로 최신 통계 반영</li>
       <li>불필요한 함수 사용을 제거해 검색 조건 단순화</li>
       <li>이슈 로그: INFO-098 / 스프린트-09</li>
     </ul>

     <h3>배운 점</h3>
     <p>실행 계획은 데이터 분포가 바뀔 때마다 다시 검증해야 한다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'database_tuning', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (9,
     '분류 모델 운영 체험기 #09',
     ' 
     <h3>배경</h3>
     <p>스프린트 9 에서 간단한 분류 모델을 배포해 주간 리포트를 생성하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>피처 스케일이 drift 되어 F1 점수가 스프린트마다 흔들림 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>모니터링에 feature distribution 로그 추가</li>
       <li>베이스라인과 최신 모델을 shadow 테스트</li>
       <li>전처리 파이프라인을 모델 버전과 함께 고정</li>
       <li>이슈 로그: INFO-099 / 스프린트-09</li>
     </ul>

     <h3>배운 점</h3>
     <p>모델 품질은 파이프라인 재현성과 모니터링이 함께 가야 유지된다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'ai_ml_classification', SYSDATE, SYSDATE);

INSERT INTO km_coding.info_post
(member_id, title, content, category_id, created_at, updated_at)
VALUES
    (10,
     '디자인 시스템 QA 로그 #09',
     ' 
     <h3>배경</h3>
     <p>스프린트 9 에서 새로운 UI 컴포넌트 라이브러리를 배포하며 겪은 기록입니다.</p>

     <h3>문제</h3>
     <p>Figma 토큰과 실제 CSS 변수 값이 어긋나 브랜드 컬러가 틀어짐 상황을 재현하며 팀원들과 실시간으로 디버깅했습니다.</p>

     <h3>해결</h3>
     <ul>
       <li>디자인 토큰 스냅샷을 CI에 추가</li>
       <li>스토리북에 상태별 스크린샷 테스트 도입</li>
       <li>컴포넌트 prop 타입을 문서화하여 FE/디자이너 합의</li>
       <li>이슈 로그: INFO-100 / 스프린트-09</li>
     </ul>

     <h3>배운 점</h3>
     <p>디자인-개발 간 소스오브트루스를 정리하면 QA 소요가 크게 준다.</p>
     <p>자료 공유용 메모라 나중에 리딩할 때 리마인드 카드로 활용할 수 있습니다.</p>
',
     'design_ui_component', SYSDATE, SYSDATE);

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

-- INFO_POST 1번에 대한 스토리형 댓글 100개 (깊이 최대 3)
-- 01. 킥오프
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,3,'[1-본댓글] 글 덕분에 자바 스트림 스터디를 킥오프합니다. 4주간 기록 남길게요.',NULL,SYSDATE-5);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,2,'[1-답글1] 자료 공유해줘서 고마워요. 노션 보드 열었어요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[1-본댓글] 글 덕분에 자바 스트림 스터디를 킥오프합니다. 4주간 기록 남길게요.' FETCH FIRST 1 ROW ONLY),SYSDATE-4.9);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,5,'[1-답글1-1] 노션 링크 복붙했어요. 체크리스트도 추가!',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[1-답글1] 자료 공유해줘서 고마워요. 노션 보드 열었어요.' FETCH FIRST 1 ROW ONLY),SYSDATE-4.8);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,6,'[1-답글2] 주제별 실습 코드 깃허브에 올릴게요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[1-본댓글] 글 덕분에 자바 스트림 스터디를 킥오프합니다. 4주간 기록 남길게요.' FETCH FIRST 1 ROW ONLY),SYSDATE-4.7);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,8,'[1-답글3] 매주 회고에 스트림 성능 팁도 넣어봅시다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[1-본댓글] 글 덕분에 자바 스트림 스터디를 킥오프합니다. 4주간 기록 남길게요.' FETCH FIRST 1 ROW ONLY),SYSDATE-4.6);

-- 02. 챕터1: map/filter 정복
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,4,'[2-본댓글] map/filter 정리 모임 끝. 예제에서 null 처리 팁 얻었습니다.',NULL,SYSDATE-4.5);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,7,'[2-답글1] Optional.ofNullable 로 바꿔보니 NPE 사라졌어요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[2-본댓글] map/filter 정리 모임 끝. 예제에서 null 처리 팁 얻었습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-4.4);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,1,'[2-답글1-1] 서비스 단에선 guard clause로 선제 차단도 추천!',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[2-답글1] Optional.ofNullable 로 바꿔보니 NPE 사라졌어요.' FETCH FIRST 1 ROW ONLY),SYSDATE-4.3);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,9,'[2-답글2] map 체인 길면 메서드로 분리하는 게 가독성 좋네요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[2-본댓글] map/filter 정리 모임 끝. 예제에서 null 처리 팁 얻었습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-4.2);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,10,'[2-답글3] Stream.peek 디버깅 팁도 노션에 적었어요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[2-본댓글] map/filter 정리 모임 끝. 예제에서 null 처리 팁 얻었습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-4.1);

-- 03. 챕터2: collect와 groupingBy
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,5,'[3-본댓글] groupingBy로 통계 내보며 팀 데일리 리포트 만들었습니다.',NULL,SYSDATE-4);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,2,'[3-답글1] 문자열 key 트림 안 해서 삽질했네요. 지금은 정규화 완료.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[3-본댓글] groupingBy로 통계 내보며 팀 데일리 리포트 만들었습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-3.9);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,3,'[3-답글1-1] trim 공통 util 만들었으니 재사용합시다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[3-답글1] 문자열 key 트림 안 해서 삽질했네요. 지금은 정규화 완료.' FETCH FIRST 1 ROW ONLY),SYSDATE-3.8);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,8,'[3-답글2] parallelStream 썼다가 순서 틀어져서 주의 메모 추가.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[3-본댓글] groupingBy로 통계 내보며 팀 데일리 리포트 만들었습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-3.7);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,6,'[3-답글3] collect(Collectors.toMap) 에 merge 함수 넣으니 깔끔.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[3-본댓글] groupingBy로 통계 내보며 팀 데일리 리포트 만들었습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-3.6);

-- 04. 실습: 파일 로그 처리
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,7,'[4-본댓글] 로그 파일 10만 줄 스트림으로 파싱 성공했습니다. 병목 없어요.',NULL,SYSDATE-3.5);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,4,'[4-답글1] BufferedReader lines() 로 바꾸니 메모리 여유가 확 나네요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[4-본댓글] 로그 파일 10만 줄 스트림으로 파싱 성공했습니다. 병목 없어요.' FETCH FIRST 1 ROW ONLY),SYSDATE-3.4);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,10,'[4-답글1-1] try-with-resources 샘플도 추가했습니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[4-답글1] BufferedReader lines() 로 바꾸니 메모리 여유가 확 나네요.' FETCH FIRST 1 ROW ONLY),SYSDATE-3.3);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,1,'[4-답글2] benchmark 기록 노션에 캡처했습니다. CPU 20% 절감!',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[4-본댓글] 로그 파일 10만 줄 스트림으로 파싱 성공했습니다. 병목 없어요.' FETCH FIRST 1 ROW ONLY),SYSDATE-3.2);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,9,'[4-답글3] mapMulti 활용 버전도 공유할게요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[4-본댓글] 로그 파일 10만 줄 스트림으로 파싱 성공했습니다. 병목 없어요.' FETCH FIRST 1 ROW ONLY),SYSDATE-3.1);

-- 05. 코드리뷰 세션
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,2,'[5-본댓글] 코드리뷰 녹화 링크 올립니다. 변수 네이밍 피드백 많아요.',NULL,SYSDATE-3);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,5,'[5-답글1] 스트림 체이닝 길 때 지역변수로 끊는 패턴 참고하세요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[5-본댓글] 코드리뷰 녹화 링크 올립니다. 변수 네이밍 피드백 많아요.' FETCH FIRST 1 ROW ONLY),SYSDATE-2.9);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,3,'[5-답글1-1] 변수명 사전 업데이트했습니다. 도메인 용어 맞춤!',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[5-답글1] 스트림 체이닝 길 때 지역변수로 끊는 패턴 참고하세요.' FETCH FIRST 1 ROW ONLY),SYSDATE-2.8);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,8,'[5-답글2] 리뷰 중 나온 stream().toList() 전환도 반영 완료.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[5-본댓글] 코드리뷰 녹화 링크 올립니다. 변수 네이밍 피드백 많아요.' FETCH FIRST 1 ROW ONLY),SYSDATE-2.7);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,6,'[5-답글3] 테스트 코드도 람다 가독성 챙겼습니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[5-본댓글] 코드리뷰 녹화 링크 올립니다. 변수 네이밍 피드백 많아요.' FETCH FIRST 1 ROW ONLY),SYSDATE-2.6);

-- 06. 버그헌팅
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,9,'[6-본댓글] 특정 케이스에서 skip/limit 잘못 써서 데이터 빠지는 버그 찾음.',NULL,SYSDATE-2.5);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,1,'[6-답글1] limit 전에 sorted 추가하니 재현 안 됩니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[6-본댓글] 특정 케이스에서 skip/limit 잘못 써서 데이터 빠지는 버그 찾음.' FETCH FIRST 1 ROW ONLY),SYSDATE-2.4);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,4,'[6-답글1-1] stable sort 확인했어요. Comparator 바꿨습니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[6-답글1] limit 전에 sorted 추가하니 재현 안 됩니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-2.3);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,7,'[6-답글2] 회의록에 재현 시나리오 적어두었어요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[6-본댓글] 특정 케이스에서 skip/limit 잘못 써서 데이터 빠지는 버그 찾음.' FETCH FIRST 1 ROW ONLY),SYSDATE-2.2);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,10,'[6-답글3] 스트림 대신 for 루프 비교 결과도 첨부.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[6-본댓글] 특정 케이스에서 skip/limit 잘못 써서 데이터 빠지는 버그 찾음.' FETCH FIRST 1 ROW ONLY),SYSDATE-2.1);

-- 07. 성능 튜닝
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,6,'[7-본댓글] profiling 결과 filter 중복 호출로 15% 손실 발견.',NULL,SYSDATE-2);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,8,'[7-답글1] predicate 합치는 util 만들었습니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[7-본댓글] profiling 결과 filter 중복 호출로 15% 손실 발견.' FETCH FIRST 1 ROW ONLY),SYSDATE-1.9);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,3,'[7-답글1-1] 병렬 스트림 시 predicate thread-safe 확인 완료.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[7-답글1] predicate 합치는 util 만들었습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-1.8);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,2,'[7-답글2] collectors.toUnmodifiableList 써도 퍼포먼스 동일했어요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[7-본댓글] profiling 결과 filter 중복 호출로 15% 손실 발견.' FETCH FIRST 1 ROW ONLY),SYSDATE-1.7);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,5,'[7-답글3] warm-up 후 JIT 최적화 그래프 첨부합니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[7-본댓글] profiling 결과 filter 중복 호출로 15% 손실 발견.' FETCH FIRST 1 ROW ONLY),SYSDATE-1.6);

-- 08. 테스트 커버리지
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,10,'[8-본댓글] 스트림 유틸 테스트 커버리지 95% 달성.',NULL,SYSDATE-1.5);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,9,'[8-답글1] parameterized test 로 입력 케이스 늘렸어요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[8-본댓글] 스트림 유틸 테스트 커버리지 95% 달성.' FETCH FIRST 1 ROW ONLY),SYSDATE-1.4);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,4,'[8-답글1-1] Mockito 대신 stub 객체로 교체한 버전 참고.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[8-답글1] parameterized test 로 입력 케이스 늘렸어요.' FETCH FIRST 1 ROW ONLY),SYSDATE-1.3);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,1,'[8-답글2] mutation testing 결과도 공유할까요?',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[8-본댓글] 스트림 유틸 테스트 커버리지 95% 달성.' FETCH FIRST 1 ROW ONLY),SYSDATE-1.2);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,7,'[8-답글3] IDE live template 정리해서 단축키 공유합니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[8-본댓글] 스트림 유틸 테스트 커버리지 95% 달성.' FETCH FIRST 1 ROW ONLY),SYSDATE-1.1);

-- 09. 문서화
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,3,'[9-본댓글] 스트림 가이드 PDF 초안 올렸어요. 피드백 주세요.',NULL,SYSDATE-1);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,2,'[9-답글1] 챕터 순서만 조금 바꾸면 흐름 더 좋을 듯!',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[9-본댓글] 스트림 가이드 PDF 초안 올렸어요. 피드백 주세요.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.9);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,8,'[9-답글1-1] 용어집 표까지 추가했습니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[9-답글1] 챕터 순서만 조금 바꾸면 흐름 더 좋을 듯!' FETCH FIRST 1 ROW ONLY),SYSDATE-0.8);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,6,'[9-답글2] 코드 스니펫에 주석 번역도 넣었어요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[9-본댓글] 스트림 가이드 PDF 초안 올렸어요. 피드백 주세요.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.7);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,5,'[9-답글3] 표지 디자인 간단히 넣어봤습니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[9-본댓글] 스트림 가이드 PDF 초안 올렸어요. 피드백 주세요.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.6);

-- 10. 발표 리허설
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,7,'[10-본댓글] 사내 점심 세미나 리허설 완료. 20분 안에 끝!',NULL,SYSDATE-0.5);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,1,'[10-답글1] 데모에서 toList() 변환 시점 강조 부탁.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[10-본댓글] 사내 점심 세미나 리허설 완료. 20분 안에 끝!' FETCH FIRST 1 ROW ONLY),SYSDATE-0.4);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,9,'[10-답글1-1] 추가한 슬라이드 확인했습니다. 타이밍 굿.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[10-답글1] 데모에서 toList() 변환 시점 강조 부탁.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.35);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,4,'[10-답글2] QA 질문 리스트 만들어 둘게요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[10-본댓글] 사내 점심 세미나 리허설 완료. 20분 안에 끝!' FETCH FIRST 1 ROW ONLY),SYSDATE-0.3);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,10,'[10-답글3] 발표 후 설문 링크도 세팅해둘게요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[10-본댓글] 사내 점심 세미나 리허설 완료. 20분 안에 끝!' FETCH FIRST 1 ROW ONLY),SYSDATE-0.25);

-- 11. 라이브 데모 후
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,6,'[11-본댓글] 라이브 데모 끝! 질문 12개 나왔습니다.',NULL,SYSDATE-0.2);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,8,'[11-답글1] 녹화 영상 링크 댓글에 남겼어요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[11-본댓글] 라이브 데모 끝! 질문 12개 나왔습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.18);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,2,'[11-답글1-1] Q&A 문서에 답변 정리 완료.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[11-답글1] 녹화 영상 링크 댓글에 남겼어요.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.16);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,5,'[11-답글2] 질문 중 스트림 종료 연산 관련은 따로 글 써볼게요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[11-본댓글] 라이브 데모 끝! 질문 12개 나왔습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.14);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,3,'[11-답글3] 사내 게시판에도 공유 완료했습니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[11-본댓글] 라이브 데모 끝! 질문 12개 나왔습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.12);

-- 12. 피드백 반영
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,1,'[12-본댓글] 피드백 반영해서 샘플 코드에 주석 추가했습니다.',NULL,SYSDATE-0.1);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,9,'[12-답글1] stream API 버전별 차이도 표로 넣었어요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[12-본댓글] 피드백 반영해서 샘플 코드에 주석 추가했습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.09);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,4,'[12-답글1-1] JDK21 예제 링크도 배치 완료.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[12-답글1] stream API 버전별 차이도 표로 넣었어요.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.08);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,7,'[12-답글2] 테스트에 record 타입 케이스 추가했어요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[12-본댓글] 피드백 반영해서 샘플 코드에 주석 추가했습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.07);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,10,'[12-답글3] PDF 다시 빌드해서 공유 링크 교체.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[12-본댓글] 피드백 반영해서 샘플 코드에 주석 추가했습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.06);

-- 13. 실무 적용
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,3,'[13-본댓글] 사내 배치 코드에 스트림 적용했더니 40줄 줄었습니다.',NULL,SYSDATE-0.05);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,6,'[13-답글1] NPE 보호막 덕분에 장애 알림도 안 울렸어요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[13-본댓글] 사내 배치 코드에 스트림 적용했더니 40줄 줄었습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.045);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,8,'[13-답글1-1] 배포 로그에 before/after 비교 남겼습니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[13-답글1] NPE 보호막 덕분에 장애 알림도 안 울렸어요.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.04);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,2,'[13-답글2] 캐시 적용 부분도 스트림으로 합치니 더 깔끔.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[13-본댓글] 사내 배치 코드에 스트림 적용했더니 40줄 줄었습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.035);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,5,'[13-답글3] 리뷰 승인 완료! 릴리스 티켓 닫습니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[13-본댓글] 사내 배치 코드에 스트림 적용했더니 40줄 줄었습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.03);

-- 14. 추가 학습 아이디어
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,4,'[14-본댓글] 다음엔 reactive-streams 비교 세션 어때요?',NULL,SYSDATE-0.025);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,9,'[14-답글1] Reactor vs Coroutine 사례 모으겠습니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[14-본댓글] 다음엔 reactive-streams 비교 세션 어때요?' FETCH FIRST 1 ROW ONLY),SYSDATE-0.02);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,7,'[14-답글1-1] 토이 프로젝트로 실험해봐요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[14-답글1] Reactor vs Coroutine 사례 모으겠습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.018);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,10,'[14-답글2] 스케줄링 이슈도 같이 다루면 좋겠어요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[14-본댓글] 다음엔 reactive-streams 비교 세션 어때요?' FETCH FIRST 1 ROW ONLY),SYSDATE-0.016);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,1,'[14-답글3] 슬라이드 템플릿 그대로 재사용할게요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[14-본댓글] 다음엔 reactive-streams 비교 세션 어때요?' FETCH FIRST 1 ROW ONLY),SYSDATE-0.014);

-- 15. 팀 합류자 온보딩
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,8,'[15-본댓글] 신입 두 명 온보딩하면서 이 글 링크 바로 줬습니다.',NULL,SYSDATE-0.012);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,2,'[15-답글1] 온보딩 퀴즈도 만들면 재미있겠네요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[15-본댓글] 신입 두 명 온보딩하면서 이 글 링크 바로 줬습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.01);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,6,'[15-답글1-1] 퀴즈 초안 올렸습니다. 10문항.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[15-답글1] 온보딩 퀴즈도 만들면 재미있겠네요.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.009);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,5,'[15-답글2] 멘토링 일정 캘린더에 등록 완료.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[15-본댓글] 신입 두 명 온보딩하면서 이 글 링크 바로 줬습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.008);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,3,'[15-답글3] 교육 후 피드백 받으면 여기 업데이트할게요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[15-본댓글] 신입 두 명 온보딩하면서 이 글 링크 바로 줬습니다.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.007);

-- 16. 회고 준비
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,7,'[16-본댓글] 회고 문항 5개 정리했습니다. 모두 답변 부탁!',NULL,SYSDATE-0.006);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,9,'[16-답글1] 익명 설문 링크 만들어서 전달했어요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[16-본댓글] 회고 문항 5개 정리했습니다. 모두 답변 부탁!' FETCH FIRST 1 ROW ONLY),SYSDATE-0.005);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,4,'[16-답글1-1] 응답 수집하면 대시보드로 시각화할게요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[16-답글1] 익명 설문 링크 만들어서 전달했어요.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.0045);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,10,'[16-답글2] 회고 인터뷰도 2명 진행 예정.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[16-본댓글] 회고 문항 5개 정리했습니다. 모두 답변 부탁!' FETCH FIRST 1 ROW ONLY),SYSDATE-0.004);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,1,'[16-답글3] 회고 결과는 PDF로 묶어서 사내 공유.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[16-본댓글] 회고 문항 5개 정리했습니다. 모두 답변 부탁!' FETCH FIRST 1 ROW ONLY),SYSDATE-0.0035);

-- 17. 회고 완료
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,2,'[17-본댓글] 회고 끝! 스트림 학습이 실무 적용까지 이어진 게 최고.',NULL,SYSDATE-0.003);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,5,'[17-답글1] next action: reactive 비교, 온보딩 퀴즈 정식 배포.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[17-본댓글] 회고 끝! 스트림 학습이 실무 적용까지 이어진 게 최고.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.0025);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,3,'[17-답글1-1] 일정은 다음 분기 OKR에 넣겠습니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[17-답글1] next action: reactive 비교, 온보딩 퀴즈 정식 배포.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.0022);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,8,'[17-답글2] 덕분에 스트림 공포증 사라졌어요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[17-본댓글] 회고 끝! 스트림 학습이 실무 적용까지 이어진 게 최고.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.002);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,6,'[17-답글3] 회고록 링크 북마크 완료.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[17-본댓글] 회고 끝! 스트림 학습이 실무 적용까지 이어진 게 최고.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.0018);

-- 18. 오픈 커뮤니티 공유
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,9,'[18-본댓글] 이 글과 자료를 커뮤니티에 공유했더니 북마크 폭발!',NULL,SYSDATE-0.0016);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,4,'[18-답글1] 댓글로 추가 질문 들어오면 여기에도 정리할게요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[18-본댓글] 이 글과 자료를 커뮤니티에 공유했더니 북마크 폭발!' FETCH FIRST 1 ROW ONLY),SYSDATE-0.0014);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,7,'[18-답글1-1] 커뮤니티 질문 3건 답변 완료.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[18-답글1] 댓글로 추가 질문 들어오면 여기에도 정리할게요.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.0013);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,2,'[18-답글2] 슬라이드 공유 링크 클릭수 200 넘었네요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[18-본댓글] 이 글과 자료를 커뮤니티에 공유했더니 북마크 폭발!' FETCH FIRST 1 ROW ONLY),SYSDATE-0.0012);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,10,'[18-답글3] 실습 코드 repo 스타도 30 찍었습니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[18-본댓글] 이 글과 자료를 커뮤니티에 공유했더니 북마크 폭발!' FETCH FIRST 1 ROW ONLY),SYSDATE-0.0011);

-- 19. 유지보수 플랜
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,3,'[19-본댓글] 자료 유지보수 플랜: 분기별 업데이트로 정리.',NULL,SYSDATE-0.001);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,5,'[19-답글1] changelog 템플릿 만들어 둘게요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[19-본댓글] 자료 유지보수 플랜: 분기별 업데이트로 정리.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.0009);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,1,'[19-답글1-1] release tag 네이밍 규칙도 제안했습니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[19-답글1] changelog 템플릿 만들어 둘게요.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.0008);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,8,'[19-답글2] 번역 버전 요청 들어오면 슬랙으로 공유할게요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[19-본댓글] 자료 유지보수 플랜: 분기별 업데이트로 정리.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.0007);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,6,'[19-답글3] 라이선스 표기 추가했습니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[19-본댓글] 자료 유지보수 플랜: 분기별 업데이트로 정리.' FETCH FIRST 1 ROW ONLY),SYSDATE-0.0006);

-- 20. 마무리 감사
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,2,'[20-본댓글] 긴 스레드였네요. 다들 덕분에 완주했습니다!',NULL,SYSDATE-0.0005);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,7,'[20-답글1] 함께 달려서 즐거웠습니다. 다음 주제 기대!',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[20-본댓글] 긴 스레드였네요. 다들 덕분에 완주했습니다!' FETCH FIRST 1 ROW ONLY),SYSDATE-0.0004);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,4,'[20-답글1-1] 후속 글 쓰면 여기에도 공유해주세요.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[20-답글1] 함께 달려서 즐거웠습니다. 다음 주제 기대!' FETCH FIRST 1 ROW ONLY),SYSDATE-0.00035);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,10,'[20-답글2] PDF 북마크하고 회사 위키에도 추가했습니다.',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[20-본댓글] 긴 스레드였네요. 다들 덕분에 완주했습니다!' FETCH FIRST 1 ROW ONLY),SYSDATE-0.0003);
INSERT INTO km_coding.info_comment (post_id, member_id, content, parent_id, created_at) VALUES (1,9,'[20-답글3] 모두 고생했습니다. 커피 사드릴게요!',(SELECT comment_id FROM km_coding.info_comment WHERE post_id=1 AND content='[20-본댓글] 긴 스레드였네요. 다들 덕분에 완주했습니다!' FETCH FIRST 1 ROW ONLY),SYSDATE-0.0002);
commit;
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
