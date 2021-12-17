
SHOW DATABASES;

CREATE DATABASE selfstudy;

DROP DATABASE selfstudy;

CREATE TABLE selftable(
    _id INT AUTO_INCREMENT,
    size VARCHAR(5) NOT NULL,
    blackplayer VARCHAR(32) DEFAULT 'player1',
    whiteplayer VARCHAR(32) DEFAULT 'player2',
    contest VARCHAR(32),
    totalmoves INT,
    playdate DATETIME,
    result VARCHAR (12),
    PRIMARY KEY (_id)
) ENGINE = INNODB default character set utf8 collate utf8_general_ci;

use selfstudy;

DROP TABLE selftable;

INSERT INTO selftable
    (_id,size,blackplayer,whiteplayer,contest,totalmoves,playdate,result)
VALUES
    (1,'19*19','권도현18급','이순신9단','AI승강급',210,20211216,'백불계승');

INSERT INTO selftable
    (_id,size,blackplayer,whiteplayer,contest,totalmoves,playdate,result)
VALUES
    -- (1,'19*19','이창호9단','이순신9단','AI승강급',210,20210816,'백불계승'),
    (2,'13*13','박진솔9단','이세돌9단','삼성화재배',120,20210407,'흑불계승'),
    (3,'17*17','홍맑은샘5단','이창호9단','응씨배',110,20211210,'흑2집반승'),
    (4,'17*17','최정9단','조훈현9단','바둑리그',180,20201201,'백0.5집승'),
    (5,'13*13','홍성지9단','박정환9단','중국갑조리그',115,20180316,'흑35집승'),
    (6,'9*9','양딩신9단','커제9단','타이젬대국',48,20151112,'백불계승'),
    (7,'19*19','마샤오춘9단','나현9단','바둑리그',215,20091026,'백22.5집승'),
    (8,'13*13','김재원9단','박선우9단','멘토스리그전',320,20200126,'흑불계승'),
    (9,'15*15','신진서9단','서윤태9단','시도대항전',126,20210101,'백시간승'),
    (10,'19*19','루이나이웨이9단','이현9단','한중일바둑교류전',251,20190505,'흑1.5집승');

SELECT 
    *
FROM 
    selftable;

use selfstudy;

SELECT 
    blackplayer, whiteplayer, result
FROM 
    selftable
WHERE 
    result='흑불계승';

SELECT 
    blackplayer, whiteplayer, totalmoves, result
FROM 
    selftable
WHERE 
    totalmoves < 200;

DELETE

FROM 
    selftable
WHERE 
    result = '백불계승';

DROP TABLE selftable;

TRUNCATE TABLE selftable;

CREATE TABLE baduk_users(
    _id INT AUTO_INCREMENT,
    로그인ID VARCHAR(32) NOT NULL,
    name VARCHAR(32) NOT NULL,
    gender CHAR not null,
    birth DATETIME,
    level INT,
    address VARCHAR(50),
    PRIMARY KEY (_id)   
) ENGINE = INNODB default character set utf8 collate utf8_general_ci;

TRUNCATE TABLE baduk_users;

DROP TABLE baduk_users;

DELETE 
    
FROM 
    baduk_users
WHERE 
    gender = 0;




