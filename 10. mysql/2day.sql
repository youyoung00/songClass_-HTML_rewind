




CREATE TABLE selfstudy.commu_user(
    _id INT AUTO_INCREMENT,
    nickname VARCHAR(10) DEFAULT 'guest',
    level_type CHAR(1) DEFAULT 'K',
    level INT,
    PRIMARY KEY (_id)    
) ENGINE = INNODB default character set utf8 collate utf8_general_ci;

DROP TABLE commu_user;

SELECT 
    selfstudy.commu_user.level
FROM 
    selfstudy.commu_user
WHERE 
    level < 19;

SELECT * FROM selfstudy.commu_user;

INSERT INTO commu_user
    (nickname, level_type, level)
SELECT
    nickname, level_type, level
FROM 
    commu_user;

SELECT 
    commu_user.level
FROM 
    commu_user
WHERE 
    commu_user.level < 18;

DELETE  
    
FROM 
    commu_user
WHERE 
    commu_user.level < 18;

SELECT 
    commu_user.level
FROM 
    selfstudy.commu_user
WHERE 
    commu_user.level < 19;

DELETE 
    
FROM 
    selfstudy.commu_user
WHERE 
    commu_user.level < 19;

INSERT INTO selfstudy.commu_user
    (nickname, level_type, level)
SELECT  
    nickname, level_type, level
FROM 
    selfstudy.commu_user;

UPDATE 
    selfstudy.commu_user
SET 
    level= FLOOR(RAND() * 19)
WHERE 
    commu_user.level;

UPDATE 
    selfstudy.commu_user
SET 
    level= FLOOR(RAND() * (28) + 1)
WHERE 
    commu_user._id < 7000;

SELECT 
    selfstudy.commu_user.level
FROM 
    commu_user
WHERE 
    commu_user.level= 29;

SELECT 
    selfstudy.commu_user.level
FROM 
    commu_user
WHERE 
    commu_user.level < 19;

UPDATE 
    selfstudy.commu_user
SET  
    level = 0 
WHERE 
    commu_user.level = < 19; 
    



    

    



