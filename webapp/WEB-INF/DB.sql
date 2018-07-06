/* 영화관 정보 DB */
CREATE TABLE theater(
	theaterno NUMBER PRIMARY KEY,
	brandno NUMBER,
	theatername VARCHAR2(200),
	theaterlocate VARCHAR2(300),
	theaterxgps VARCHAR2(100),
	theaterygps VARCHAR2(100),
	CONSTRAINT b_category_fk FOREIGN KEY (brandno)
	REFERENCES brand(brandno)
)
DROP TABLE theater
CREATE SEQUENCE seq_theater_no
INCREMENT BY 1
START WITH 1
NOCACHE;

/* 브랜드 정보 DB */
CREATE TABLE brand(
	brandno NUMBER PRIMARY KEY,
	brandname VARCHAR2(100),
	brandlogo vARCHAR2(255)
)

INSERT INTO theater(theaterno, brandno, theatername, theaterlocate, theaterxgps, theaterygps) VALUES(seq_theater_no.nextval, 1, '강남점', '서울특별시 강남구 역삼1동 814-6 스타플렉스', '127.0263906', '37.5016210')
INSERT INTO brand(brandno, brandname, brandlogo) VALUES(1, 'CGV', 'no')