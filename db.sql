# DB 생성
DROP DATABASE IF EXISTS textBoard;
CREATE DATABASE textBoard;
USE textBoard;

# 게시물 테이블 생성
CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(200) NOT NULL,
    `body` TEXT NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    boardId INT(10) UNSIGNED NOT NULL
);

# 게시물 데이터 3개 생성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '알기 쉬운 자바',
`body` = '는 다음 이 시간에 만나요',
memberId = 1,
boardId = 1;

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '전혀 어렵지 않은 SQL',
`body` = '은 없습니다.',
memberId = 1,
boardId = 1;

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '하루만에 익히는 Html',
`body` = '하는 사람은 최소 7살부터 C언어 한 사람',
memberId = 1,
boardId = 1;

# 회원 테이블 생성
CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(30) NOT NULL,
    loginPw VARCHAR(50) NOT NULL,
    `name` CHAR(30) NOT NULL
);

# 회원 데이터 생성
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'boyeon Ahn',
loginPw = 'test1',
`name` = 'boyeon Ahn';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = '햄참깨',
loginPw = 'test2',
`name` = '햄참깨';

# 게시판 테이블 생성
CREATE TABLE board (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `name` CHAR(20) NOT NULL,
    `code` CHAR(20) NOT NULL
);

# 공지사항 게시판 추가
INSERT INTO board 
SET regDate = NOW(),
updateDate = NOW(),
`name` = '공지사항',
`code` = 'notice';

# 자유 게시판 추가
INSERT INTO board 
SET regDate = NOW(),
updateDate = NOW(),
`name` = '자유',
`code` = 'free';

UPDATE article
SET boardId = 2
LIMIT 2;

# 각종 함수
/*
SELECT DATE(NOW());
SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT DAY(NOW());
SELECT SUBSTR("안녕하세요.", 1, 2);
SELECT SUBSTR("안녕하세요.", 2, 2);
SELECT CONCAT("안녕", "하세요.");
SELECT RAND() * 100;
*/

# 게시물 랜덤 생성
/*
insert into article
set regDate = NOW(),
updateDate = NOW(),
title = concat("제목_", rand()),
`body` = CONCAT("내용_", RAND()),
memberId = FLOOR(RAND() * 2) + 1,
boardId = FLOOR(RAND() * 2) + 1;
*/

# 3번글 내용을 마크다운 문법으로 수정
UPDATE article SET `body` = '# 공지사항\r\n안녕하세요.\r\n이 사이트는 Bo의 글 연재 공간입니다.\r\n\r\n---\r\n\r\n# 이 사이트는 저의 일상과 공부에 대해 연재될 예정입니다. 기타 문의 사항은 하단바의 이메일로 연락주세요! '
WHERE id = '3';

SELECT * FROM article;

# 2번글 내용에 자바소스코드 넣기
UPDATE article SET `body` = '# 자바란 무엇인가 \r\n```java\r\nint a = 10;\r\nint b = 20;\r\nint c = a + b;\r\n```'
WHERE id = '2'; 