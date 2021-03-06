DROP TABLE KEYSEARCH;

DROP SEQUENCE KEY_SEQ;

CREATE SEQUENCE KEY_SEQ;

CREATE TABLE KEYSEARCH(
	SEQ NUMBER PRIMARY KEY,
	USERID VARCHAR2(20),
	WORD VARCHAR2(50)
);

은/는/이/가/을/를/에서/에/의/까지/,

INSERT INTO KEYSEARCH VALUES(KEY_SEQ.NEXTVAL, '김동주', '영주의 맛집');
INSERT INTO KEYSEARCH VALUES(KEY_SEQ.NEXTVAL, '이영주', '이천에서 부산까지');
INSERT INTO KEYSEARCH VALUES(KEY_SEQ.NEXTVAL,'이영주', '서울에서 이천');
INSERT INTO KEYSEARCH VALUES(KEY_SEQ.NEXTVAL,'김동주', '이천에서 제주도');
INSERT INTO KEYSEARCH VALUES(KEY_SEQ.NEXTVAL,'김동주', '맛집 추천');
INSERT INTO KEYSEARCH VALUES(KEY_SEQ.NEXTVAL,'김동주', '군산 맛집');
INSERT INTO KEYSEARCH VALUES(KEY_SEQ.NEXTVAL,'김동주', '군산 숙소');
INSERT INTO KEYSEARCH VALUES(KEY_SEQ.NEXTVAL,'김동주', '군산에서 전북');



SELECT * FROM KEYSEARCH;
SELECT WORD, COUNT(*) FROM KEYSEARCH WHERE USERID='이영주' GROUP BY WORD ORDER BY COUNT(*) DESC;

SELECT A.*, ROWNUM 
FROM (SELECT WORD, COUNT(*) FROM KEYSEARCH WHERE USERID='김동주' GROUP BY WORD ORDER BY COUNT(*) DESC) A 
WHERE ROWNUM <=3;


SELECT SEQ, USERID, SUBSTR(WORD,1,(INSTR(WORD,'에서')-1))
FROM KEYSEARCH;

SELECT COUNT(*)
FROM KEYSEARCH
WHERE USERID='김동주' AND WORD='서울'




