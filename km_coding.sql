-- DROP USER km_coding CASCADE;

-- 0. 유저 생성 및 권한

-- 0. USER / SCHEMA 생성
CREATE USER km_coding IDENTIFIED BY km_codingpw
    DEFAULT TABLESPACE users
    TEMPORARY TABLESPACE temp
    QUOTA UNLIMITED ON users;

GRANT CONNECT, RESOURCE TO km_coding;




-- -- 1. 해시 태그

CREATE TABLE km_coding.TAG (
                               TAG_ID          VARCHAR2(50) PRIMARY KEY
);

-- -- 1. 카테고리

CREATE TABLE km_coding.CATEGORY (
                                    CATEGORY_ID     VARCHAR2(50) PRIMARY KEY,   -- 직접 만드는 코드 (예: DEV_BACK_JAVA)
                                    NAME            VARCHAR2(100) NOT NULL,     -- 한글 이름
                                    PARENT_ID       VARCHAR2(50),               -- 부모 카테고리 (NULL이면 대분류)

                                    CONSTRAINT FK_CATEGORY_PARENT
                                        FOREIGN KEY (PARENT_ID)
                                            REFERENCES km_coding.CATEGORY(CATEGORY_ID)
);


-- 2. 멤버

CREATE TABLE km_coding.MEMBER (
                                  MEMBER_ID      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                  EMAIL          VARCHAR2(200) UNIQUE NOT NULL,
                                  PASSWORD       VARCHAR2(200) NOT NULL,
                                  NICKNAME       VARCHAR2(100) NOT NULL,
                                  CREATED_AT     TIMESTAMP NOT NULL,
                                  UPDATED_AT     TIMESTAMP
);




-- 3. 정보공유 게시판

-- 3-1. 정보공유 글

CREATE TABLE km_coding.INFO_POST (
                                     POST_ID       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                     TITLE         VARCHAR2(200) NOT NULL,
                                     CONTENT       CLOB NOT NULL,
                                     CREATED_AT    TIMESTAMP NOT NULL,
                                     UPDATED_AT    TIMESTAMP,
                                     MEMBER_ID     NUMBER NOT NULL,
                                     CATEGORY_ID     VARCHAR2(50) NOT NULL,
                                     CONSTRAINT FK_INFO_POST_CATEGORY
                                        Foreign Key (CATEGORY_ID) References km_coding.CATEGORY(CATEGORY_ID),
                                     CONSTRAINT FK_INFO_POST_MEMBER
                                         FOREIGN KEY (MEMBER_ID) REFERENCES km_coding.MEMBER(MEMBER_ID)
);
CREATE TABLE km_coding.INFO_LIKE (
                                     LIKE_ID      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                     POST_ID      NUMBER NOT NULL,
                                     MEMBER_ID    NUMBER NOT NULL,
                                     CONSTRAINT FK_INFO_LIKE_POST
                                         FOREIGN KEY (POST_ID) REFERENCES km_coding.INFO_POST(POST_ID),
                                     CONSTRAINT FK_INFO_LIKE_MEMBER
                                         FOREIGN KEY (MEMBER_ID) REFERENCES km_coding.MEMBER(MEMBER_ID),
                                     CONSTRAINT UQ_INFO_LIKE UNIQUE (POST_ID, MEMBER_ID)
);

-- 3-2. 정보공유 댓글

CREATE TABLE km_coding.INFO_COMMENT (
                                        COMMENT_ID    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                        POST_ID       NUMBER NOT NULL,
                                        CONTENT       VARCHAR2(2000) NOT NULL,
                                        CREATED_AT    TIMESTAMP NOT NULL,
                                        MEMBER_ID     NUMBER NOT NULL,
                                        PARENT_ID     NUMBER NULL,
                                        CONSTRAINT FK_INFO_COMMENT_POST
                                            FOREIGN KEY (POST_ID) REFERENCES km_coding.INFO_POST(POST_ID),
                                        CONSTRAINT FK_INFO_COMMENT_MEMBER
                                            FOREIGN KEY (MEMBER_ID) REFERENCES km_coding.MEMBER(MEMBER_ID),
                                        CONSTRAINT FK_INFO_COMMENT_PARENT
                                            FOREIGN KEY (PARENT_ID) REFERENCES km_coding.INFO_COMMENT(COMMENT_ID)
);

-- 3-3. 정보공유 좋아요
CREATE TABLE km_coding.INFO_COMMENT_LIKE (
                                     LIKE_ID      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                     COMMENT_ID      NUMBER NOT NULL,
                                     MEMBER_ID    NUMBER NOT NULL,
                                     CONSTRAINT FK_INFO_COMMENT_LIKE_POST
                                         FOREIGN KEY (COMMENT_ID) REFERENCES km_coding.INFO_COMMENT(COMMENT_ID),
                                     CONSTRAINT FK_INFO_COMMENT_LIKE_MEMBER
                                         FOREIGN KEY (MEMBER_ID) REFERENCES km_coding.MEMBER(MEMBER_ID),
                                     CONSTRAINT UQ_INFO_COMMENT_LIKE UNIQUE (COMMENT_ID, MEMBER_ID)
);

-- 3-4. 정보공유 태그 매핑

CREATE TABLE km_coding.INFO_POST_TAG (
                                         MAP_ID       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                         POST_ID      NUMBER NOT NULL,
                                         TAG_ID     VARCHAR2(50) NOT NULL,
                                         CONSTRAINT FK_INFO_TAG_POST
                                             FOREIGN KEY (POST_ID) REFERENCES km_coding.INFO_POST(POST_ID),
                                         CONSTRAINT FK_INFO_TAG_TAG
                                             FOREIGN KEY (TAG_ID) REFERENCES km_coding.TAG(TAG_ID),
                                         CONSTRAINT UQ_INFO_TAG UNIQUE (POST_ID, TAG_ID)
);


-- 4. 질문 게시판

-- 4-1. 질문글

CREATE TABLE km_coding.QNA_POST (
                                    POST_ID       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                    TITLE         VARCHAR2(200) NOT NULL,
                                    CONTENT       CLOB NOT NULL,
                                    CREATED_AT    TIMESTAMP NOT NULL,
                                    UPDATED_AT    TIMESTAMP,
                                    MEMBER_ID     NUMBER NOT NULL,
                                    CATEGORY_ID   VARCHAR2(50) NOT NULL,
                                    CONSTRAINT FK_QNA_POST_CATEGORY
                                        Foreign Key (CATEGORY_ID) References km_coding.CATEGORY(CATEGORY_ID),
                                    CONSTRAINT FK_QNA_POST_MEMBER
                                        FOREIGN KEY (MEMBER_ID) REFERENCES km_coding.MEMBER(MEMBER_ID)
);
-- 4-1-1. 질문 공감 EMPATHY','CONFUSING','INTERESTING','HELPFUL'
CREATE TABLE km_coding.QNA_REACTION(
                                            REACTION_ID       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                            REACTION_TYPE VARCHAR2(20) CHECK (REACTION_TYPE IN ('EMPATHY','CONFUSING','INTERESTING','HELPFUL')),
                                            MEMBER_ID     NUMBER NOT NULL,
                                            POST_ID    NUMBER NOT NULL,
                                            CONSTRAINT FK_QNA_REACTION_COMMENT
                                                FOREIGN KEY (POST_ID) REFERENCES km_coding.QNA_POST(POST_ID),
                                            CONSTRAINT FK_QNA_REACTION_MEMBER
                                                FOREIGN KEY (MEMBER_ID) REFERENCES km_coding.MEMBER(MEMBER_ID),
                                            CONSTRAINT UQ_QNA_REACTION UNIQUE (POST_ID, MEMBER_ID)
);

-- 4-2. 질문 댓글/답변

CREATE TABLE km_coding.QNA_COMMENT (
                                       COMMENT_ID     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                       POST_ID        NUMBER NOT NULL,
                                       CONTENT        VARCHAR2(2000) NOT NULL,
                                       CREATED_AT     TIMESTAMP NOT NULL,
                                       MEMBER_ID      NUMBER NOT NULL,
                                       PARENT_ID      NUMBER NULL,
                                       CONSTRAINT FK_QNA_COMMENT_POST
                                           FOREIGN KEY (POST_ID) REFERENCES km_coding.QNA_POST(POST_ID),
                                       CONSTRAINT FK_QNA_COMMENT_MEMBER
                                           FOREIGN KEY (MEMBER_ID) REFERENCES km_coding.MEMBER(MEMBER_ID),
                                       CONSTRAINT FK_QNA_COMMENT_PARENT
                                           FOREIGN KEY (PARENT_ID) REFERENCES km_coding.QNA_COMMENT(COMMENT_ID)
);

-- 4-3. 질문 댓글 좋아요

CREATE TABLE km_coding.QNA_COMMENT_LIKE (
                                            LIKE_ID       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                            COMMENT_ID    NUMBER NOT NULL,
                                            MEMBER_ID     NUMBER NOT NULL,
                                            CONSTRAINT FK_QNA_COMMENT_LIKE_COMMENT
                                                FOREIGN KEY (COMMENT_ID) REFERENCES km_coding.QNA_COMMENT(COMMENT_ID),
                                            CONSTRAINT FK_QNA_COMMENT_LIKE_MEMBER
                                                FOREIGN KEY (MEMBER_ID) REFERENCES km_coding.MEMBER(MEMBER_ID),
                                            CONSTRAINT UQ_QNA_COMMENT_LIKE UNIQUE (COMMENT_ID, MEMBER_ID)
);

-- 4-4. 질문 채택

CREATE TABLE km_coding.QNA_ADOPT (
                                     ADOPT_ID      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                     POST_ID       NUMBER NOT NULL UNIQUE,
                                     COMMENT_ID    NUMBER NOT NULL,
                                     CREATED_AT    TIMESTAMP NOT NULL,
                                     CONSTRAINT FK_QNA_ADOPT_POST
                                         FOREIGN KEY (POST_ID) REFERENCES km_coding.QNA_POST(POST_ID),
                                     CONSTRAINT FK_QNA_ADOPT_COMMENT
                                         FOREIGN KEY (COMMENT_ID) REFERENCES km_coding.QNA_COMMENT(COMMENT_ID)
);

-- 4-5. 질문 태그 매핑

CREATE TABLE km_coding.QNA_POST_TAG (
                                        MAP_ID       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                        POST_ID      NUMBER NOT NULL,
                                        TAG_ID     VARCHAR2(50) NOT NULL,
                                        CONSTRAINT FK_QNA_TAG_POST
                                            FOREIGN KEY (POST_ID) REFERENCES km_coding.QNA_POST(POST_ID),
                                        CONSTRAINT FK_QNA_TAG_TAG
                                            FOREIGN KEY (TAG_ID) REFERENCES km_coding.TAG(TAG_ID),
                                        CONSTRAINT UQ_QNA_TAG UNIQUE (POST_ID, TAG_ID)
);

-- DROP TABLE km_coding.INFO_IMAGE CASCADE CONSTRAINTS;
-- DROP TABLE km_coding.QNA_IMAGE CASCADE CONSTRAINTS;

-- 20251203_224523_5721_info.png
CREATE TABLE km_coding.INFO_IMAGE (
                                     IMAGE_ID      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                     POST_ID       NUMBER NOT NULL,
                                     IMAGE_URL     VARCHAR2(40) NOT NULL,
                                     IS_MAJOR NUMBER(1) DEFAULT 0 CHECK (IS_MAJOR IN (0,1)),
                                     CONSTRAINT FK_INFO_IMAGE_POST
                                        FOREIGN KEY (POST_ID) REFERENCES km_coding.INFO_POST(POST_ID)
                                        ON DELETE CASCADE
);

CREATE TABLE km_coding.QNA_IMAGE (
                                     IMAGE_ID      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                     POST_ID       NUMBER NOT NULL,
                                     IMAGE_URL     VARCHAR2(40) NOT NULL,
                                     IS_MAJOR NUMBER(1) DEFAULT 0 CHECK (IS_MAJOR IN (0,1)),
                                     CONSTRAINT FK_QNA_IMAGE_POST
                                        FOREIGN KEY (POST_ID) REFERENCES km_coding.QNA_POST(POST_ID)
                                        ON DELETE CASCADE
);
-- CREATE VIEW km_coding.QNA_REACTION_COUNT AS (
--         SELECT
--             g.POST_ID,
--             CASE WHEN g.REACTION_TYPE='INTERESTING' THEN g.REACTION_COUNT ELSE 0 END AS INTERESTING,
--             CASE WHEN g.REACTION_TYPE='HELPFUL' THEN g.REACTION_COUNT ELSE 0 END AS HELPFUL,
--             CASE WHEN g.REACTION_TYPE='EMPATHY' THEN g.REACTION_COUNT ELSE 0 END AS EMPATHY,
--             CASE WHEN g.REACTION_TYPE='CONFUSING' THEN g.REACTION_COUNT ELSE 0 END AS CONFUSING
--
--         FROM (SELECT
--                   POST_ID,
--                   REACTION_TYPE,
--                   COUNT(REACTION_ID) AS REACTION_COUNT
--               FROM km_coding.QNA_REACTION r
--               GROUP BY r.POST_ID, r.REACTION_TYPE) g
-- );