
----------- 설문조사 데이터베이스 설계 ------------- 

-- 1. 설문수집자 테이블
CREATE TABLE survey_collector(
  _id INT AUTO_INCREMENT COMMENT '설문수집자 고유번호', 
  name VARCHAR(30) NOT NULL COMMENT '수집자 이름',
  pw INT NOT NULL COMMENT '비밀번호'
  PRIMARY KEY(_id)
) ENGINE = INNODB default character set utf8 collate utf8_general_ci; 

-- 2. 설문참여자 테이블
CREATE TABLE participant (
  _id INT AUTO_INCREMENT COMMENT '참여자 고유번호', 
  name VARCHAR(10) NOT NULL COMMENT '이름',
  phone_number INT(12) NOT NULL COMMENT '전화번호',
  gender INT NOT NULL COMMENT '성별',
  birth DATE NOT null COMMENT '생년월일',
  
  PRIMARY KEY(_id)
) ENGINE = INNODB default character set utf8 collate utf8_general_ci; 

-- 3. 설문조사 테이블
CREATE TABLE survey(
  _id INT AUTO_INCREMENT COMMENT '설문조사 고유번호', 
  collector_id INT NOT NULL COMMENT '설문수집자 고유번호',
  location VARCHAR(30) NOT NULL COMMENT '위치',
  assent_text VARCHAR(1000) DEFAULT '귀하의 정보수집에 동의하십니까?' COMMENT '정보동의 수집 텍스트',
  survey_status INT DEFAULT 0 COMMENT '설문조사 종료 여부', 
  PRIMARY KEY(_id)
) ENGINE = INNODB default character set utf8 collate utf8_general_ci; 

-- 4. 설문조사 / 설문조사자 M:N 맵핑테이블
CREATE TABLE survey_participant(
  _id INT AUTO_INCREMENT COMMENT '설문조사 고유번호', 
  surveyor_id INT NOT NULL COMMENT '참여 조사자 고유번호',
  collector_id INT NOT NULL COMMENT '설문 수집자 고유번호',
  PRIMARY KEY(_id)
) ENGINE = INNODB default character set utf8 collate utf8_general_ci; 

-- 설문조사 INSERT 문

-- 첫번째 화면 : 위치 지정
-- 노인정, 약국을 선택하면 그대로 입력, 기타를 선택 후 직접 타이핑하여 입력하는 것도 가능. 
INSERT INTO survey (location)
VALUES ('노인정');

-- 두번째 화면 : 설문조사 대상 정보입력1
-- 이름, 전화번호를 participant 테이블에 추가. 
INSERT INTO participant (name,phone_number)
VALUES ('홍길동', 01023456789);


-- 세번째 화면 : 설문조사 대상 정보입력2
-- 성별, 생년월일을 participant 테이블에 추가. 
INSERT INTO participant (gender,birth)
VALUES (1, 1990-01-19);

-- 네번째 화면 : 정보 동의 텍스트 설정.
INSERT INTO survey (assent_text)
VALUES ('향후 6개월간 정보 활용에 동의하십니까?');

-- 완료 화면 : 설문조사 완성. 전송 클릭 시, insert 쿼리들을 DB에 반영.
