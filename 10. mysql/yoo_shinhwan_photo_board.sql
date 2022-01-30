
-- 회원제
-- 사진게시판 의 데이터베이스 테이블을 설계 하시오.

-- 0. 테이블 구성 쿼리
-- 1. 회원가입 쿼리
-- 2. 게시판 리스트 쿼리 (제목/작성자 이름 검색 기능 추가)
-- 3. 게시물 (사진 포함) 등록 쿼리
-- 4. 게시물 삭제 쿼리
-- 5. 게시물 수정 쿼리


-- 0. 테이블 구성 쿼리
-- 0-1. 유저 가입정보 테이블
CREATE TABLE user (
  _id INT AUTO_INCREMENT COMMENT '회원 고유번호', 
  email VARCHAR(30) NOT NULL COMMENT '이메일',
  nickName VARCHAR(30) NOT NULL COMMENT '대화명',
  pw INT NOT NULL COMMENT '비밀번호'
  PRIMARY KEY(_id)
) ENGINE = INNODB default character set utf8 collate utf8_general_ci; 

-- 0-2. 사진 게시물 테이블
CREATE TABLE photo_post (
  _id INT AUTO_INCREMENT COMMENT '게시물 고유번호', 
  title VARCHAR(20) NOT NULL COMMENT '게시물 제목',
  list_id INT NOT NULL COMMENT '리스트 고유번호와 관계 형성',
  img_url VARCHAR(1000) NOT NULL COMMENT '이미지 주소',
  post_status INT NOT NULL COMMENT '게시물 삭제 여부'
  PRIMARY KEY(_id)
) ENGINE = INNODB default character set utf8 collate utf8_general_ci;

-- 0-3. 사진 게시물 리스트 쿼리
CREATE TABLE post_list (
  _id INT AUTO_INCREMENT COMMENT '리스트 고유번호', 
  user_id INT NOT NULL COMMENT '회원 고유번호와 관계 형성',
  date TIMESTAMP NOT NULL COMMENT '사진 업로드 날짜'
  PRIMARY KEY(_id)
) ENGINE = INNODB default character set utf8 collate utf8_general_ci;


-- 1. 회원가입 쿼리
INSERT INTO user
    (email, nickName, pw)
VALUES
    (you889@hanmail.net, 바둑맨, 123456);

-- 2-1. 게시판 리스트 쿼리 (작성자 제목 검색)
select 
    *
from 
    photo_post
where 
    title like '%제목검색어%'
order by photo_post desc 
limit 0, 10;

-- 2-2. 게시판 리스트 쿼리 (작성자 이름 검색)
select
    *
from 
    photo_post
where 
    title like '%이름검색어%'
order by photo_post desc 
limit 0, 10;

-- 3. 게시물 (사진 포함) 등록 쿼리
-- 첫번째 리스트에 '안녕하세요' 라는 제목을 가진 사진을 등록합니다. 
insert into photo_post
    (
        title, 
        list_id, 
        img_url 
    )
values
    (
        안녕하세요,
        1,
        'https://cdn.pixabay.com/photo/2021/12/18/06/01/sunset-6878021__480.jpg'
    );


-- 4. 게시물 삭제 쿼리
-- 유저가 선택한 10번 게시물의 status를 0으로 변경, 유저화면에서 제외처리 합니다. 
UPDATE 
    photo_post
SET 
    post_status = 0
WHERE 
    photo_post._id = 10;

-- 5. 게시물 수정 쿼리
-- 유저가 선택한 20번 게시물의 이미지를 다른 것으로 수정합니다. 
UPDATE 
    photo_post
SET 
    img_url = 'https://cdn.pixabay.com/photo/2021/03/21/15/01/couple-6112296__480.jpg'
WHERE 
    photo_post._id = 20;
