CREATE TABLE ITEMS(
ITEM_NO NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
ITEM_NAME VARCHAR2(30) NOT NULL,
ITEM_INFO VARCHAR2(100),
ITEM_PRICE NUMBER(10) DEFAULT 0,
ITEM_IMAGE VARCHAR2(300),
UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
MEMBER_NO NUMBER,
FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
);

CREATE TABLE MEMBER(
MEMBER_NO NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
MEMBER_ID VARCHAR2(15) NOT NULL UNIQUE ,
MEMBER_PW VARCHAR2(15) NOT NULL,
MEMBER_NAME VARCHAR2(30) DEFAULT '이름을 추가해보세요',
MEMBER_ASSET NUMBER(15) DEFAULT 0,
CREATED_AT DATE DEFAULT SYSDATE NOT NULL
);

DROP TABLE MEMBER;
DROP TABLE ITEMS;

COMMIT;

SELECT * FROM ITEMS;
SELECT * FROM MEMBER;

SELECT ITEM_NO, ITEM_NAME, ITEM_INFO, ITEM_PRICE, ITEM_IMAGE, UPLOAD_DATE, MEMBER_NO
FROM ITEMS;

SELECT MEMBER_NO, MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_ASSET, TO_CHAR(CREATED_AT, 'YYYY/DD/MM HH:MI:SS') AS CREATED_AT
FROM MEMBER
WHERE MEMBER_ID = 'ㅎㅇㅎㅇ'
AND MEMBER_PW = '비번';

UPDATE MEMBER SET 
MEMBER_ASSET = (MEMBER_ASSET - (SELECT ITEM_PRICE FROM ITEMS WHERE ITEM_NO = 1))
WHERE MEMBER_NO = 1;

UPDATE MEMBER SET 
MEMBER_NAME = '김유저어엉',
MEMBER_ID = 'user01'
WHERE MEMBER_NO = 1;

DELETE FROM MEMBER WHERE MEMBER_NO = 1;

























