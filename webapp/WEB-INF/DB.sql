--winthemovie 계정생성, 권한설정
CREATE USER winthemovie IDENTIFIED by winthemovie1;
GRANT RESOURCE, CONNECT TO winthemovie;


--테이블 삭제(제약조건 걸려있으면 삭제안됨)
drop table brand;
drop table theater;
drop table theaterroom;
drop table movie;
drop table nowplaying;
drop table users;
drop table analysis;
drop table dailystar;
drop table wordcloud;

--외래키 상관없이 테이블 삭제하는 쿼리
--생성되있는 모든 테이블 확인
SELECT  'DROP TABLE ' || object_name || ' CASCADE CONSTRAINTS;'
  FROM    user_objects
WHERE   object_type = 'TABLE';


--위의 명령어로 출력된 테이블 명령어를 통해 제약조건 상관없이 모두 삭제
DROP TABLE MOVIE CASCADE CONSTRAINTS;
DROP TABLE NOWPLAYING CASCADE CONSTRAINTS;
DROP TABLE BRAND CASCADE CONSTRAINTS;
DROP TABLE THEATERROOM CASCADE CONSTRAINTS;
DROP TABLE THEATER CASCADE CONSTRAINTS;
DROP TABLE SEAT CASCADE CONSTRAINTS;
DROP TABLE USERS CASCADE CONSTRAINTS;
DROP TABLE TICKET CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE ACTOR CASCADE CONSTRAINTS;
DROP TABLE DIRECTOR CASCADE CONSTRAINTS;
DROP TABLE STILLCUT CASCADE CONSTRAINTS;
DROP TABLE STILLMOVIE CASCADE CONSTRAINTS;
DROP TABLE ANAYSIS CASCADE CONSTRAINTS;
DROP TABLE DAILYSTAR CASCADE CONSTRAINTS;
DROP TABLE WORDCLOUD CASCADE CONSTRAINTS;

--시퀀스 삭제
drop sequence seq_users_no;
drop sequence seq_ticket_no;
drop sequence seq_seat_no;
drop sequence seq_nowplaying_no;
drop sequence seq_theaterroom_no;
drop sequence seq_brand_no;
drop sequence seq_review_no;
drop sequence seq_movie_no;
drop sequence seq_actor_no;
drop sequence seq_director_no;
drop sequence seq_stillcut_no;
drop sequence seq_anaysis_no;
drop sequence seq_dailystar_no;
drop sequence seq_wordcloud_no;


--시퀀스 생성
CREATE SEQUENCE seq_users_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_ticket_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_nowplaying_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_theaterroom_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_brand_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_review_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_movie_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_actor_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_director_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_stillcut_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_stillmovie_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_anaysis_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_dailystar_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_wordcloud_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_wordcloud_no
INCREMENT BY 1
START WITH 1
NOCACHE ;


--테이블 생성
CREATE TABLE users (
    userno          NUMBER,
    email           VARCHAR2(50)    NOT NULL UNIQUE,
    userpw          VARCHAR2(50)    ,
    username        VARCHAR2(30)    NOT NULL,
    phone           VARCHAR2(20)    ,
    regdate         DATE            ,
    authority       NUMBER          DEFAULT 0,
    userxgps        VARCHAR2(100)   ,
    userygps        VARCHAR2(100)   ,
    
    PRIMARY KEY(userno)
);


CREATE TABLE ticket (
    ticketno        NUMBER         ,
    userno          NUMBER         ,
    seatno          NUMBER         ,
    price           NUMBER         NOT NULL,
    selltime        DATE           ,
    selldate        DATE           ,
	nowplayingno    NUMBER         ,
    
    PRIMARY KEY(ticketno)
);

--ticket 제약조건 추가
ALTER TABLE ticket ADD CONSTRAINT wm_userno_fk FOREIGN KEY(userno) 
REFERENCES users(userno);
ALTER TABLE ticket ADD CONSTRAINT wm_seatno_fk FOREIGN KEY(seatno) 
REFERENCES seat(seatno);
ALTER TABLE ticket ADD CONSTRAINT wm_nowplayingnoT_fk FOREIGN KEY(nowplayingno) 
REFERENCES nowplaying(nowplayingno);

CREATE TABLE seat (
    seatno          VARCHAR2(50)  ,
    nowplayingno    NUMBER        ,
    seatname        VARCHAR2(20)  NOT NULL,
    isseat          NUMBER        NOT NULL,
    
    PRIMARY KEY(seatno)
);

--seat 제약조건 추가
ALTER TABLE seat ADD CONSTRAINT wm_nowplayingno_fk FOREIGN KEY(nowplayingno) 
REFERENCES nowplaying(nowplayingno);

CREATE TABLE nowplaying (
    nowplayingno    NUMBER        ,
    movieno         NUMBER        ,
    roomno          NUMBER        NOT NULL,
    playingtime     DATE          NOT NULL,
    playingdate     DATE          NOT NULL,
    
    PRIMARY KEY(nowplayingno)
);

--nowplaying 제약조건 추가
ALTER TABLE nowplaying ADD CONSTRAINT wm_movieno_fk FOREIGN KEY(movieno) 
REFERENCES movie(movieno);
ALTER TABLE nowplaying ADD CONSTRAINT wm_roomno_fk FOREIGN KEY(roomno) 
REFERENCES theaterroom(roomno);

CREATE TABLE theater (
    theaterno      NUMBER        ,
    brandno        NUMBER        ,
    theatername    VARCHAR2(300)  NOT NULL,
    theateraddress VARCHAR2(300)  NOT NULL,
    theaterxgps    VARCHAR2(100) ,
    theaterygps    VARCHAR2(100) ,
    
    PRIMARY KEY(theaterno)
);

--theater 제약조건 추가
ALTER TABLE theater ADD CONSTRAINT wm_brandno_fk FOREIGN KEY(brandno) 
REFERENCES brand(brandno);


CREATE TABLE theaterroom (
    roomno         NUMBER       ,
    theaterno      NUMBER       ,
    seatcount      NUMBER       NOT NULL,
	screen		   NUMBER		,
    
    PRIMARY KEY(roomno)
);

--theaterroom 제약조건 추가
ALTER TABLE theaterroom ADD CONSTRAINT wm_theaterno_fk FOREIGN KEY(theaterno) 
REFERENCES theater(theaterno);


CREATE TABLE brand (
    brandno       NUMBER        ,
    brandname     VARCHAR2(100) NOT NULL,
    brandlogo     VARCHAR2(255) NOT NULL,
    
    PRIMARY KEY(brandno)
);


CREATE TABLE review (
    reviewno      NUMBER            ,  
    userno        NUMBER            ,
    movieno       NUMBER            ,
    content       VARCHAR2(4000)    ,
    reviewstar    NUMBER            ,
	addDate		  DATE				,
    
    PRIMARY KEY(reviewno)
);

--review 제약조건 추가
ALTER TABLE review ADD CONSTRAINT wm_userno_review_fk FOREIGN KEY(userno) 
REFERENCES users(userno);
ALTER TABLE review ADD CONSTRAINT wm_movieno_review_fk FOREIGN KEY(movieno) 
REFERENCES movie(movieno);


CREATE TABLE movie (
    movieno      NUMBER            ,
    directorno   NUMBER            ,
    actorno      NUMBER            ,
    koname       VARCHAR2(100)     ,
    enname       VARCHAR2(100)     ,
    grade        NUMBER            NOT NULL,
    genre        VARCHAR2(50)      NOT NULL,
    story        VARCHAR2(4000)    NOT NULL,
    openning     VARCHAR2(100)     NOT NULL,
    poster      VARCHAR2(255)     NOT NULL,
	runtime		VARCHAR2(100)      ,
    
    PRIMARY KEY(movieno)
);

--movie 제약조건 추가
ALTER TABLE movie ADD CONSTRAINT wm_derectorno_fk FOREIGN KEY(directorno) 
REFERENCES director(directorno);
ALTER TABLE movie ADD CONSTRAINT wm_actorno_fk FOREIGN KEY(actorno) 
REFERENCES actor(actorno);


CREATE TABLE actor (
    actorno     NUMBER             ,
    actorname   VARCHAR2(50)       NOT NULL,
    
    PRIMARY KEY(actorno)
);


CREATE TABLE director (
    directorno      NUMBER         ,
    directorname    VARCHAR2(50)   NOT NULL,
    
    PRIMARY KEY(directorno)
);


CREATE TABLE stillcut (
    stillno     NUMBER             ,
    movieno     NUMBER             ,
    stillname   VARCHAR2(200)      NOT NULL,
    stillurl    VARCHAR2(300)      NOT NULL,
    savename    VARCHAR2(255)      ,
    filesize    LONG               ,
    
    PRIMARY KEY(stillno)
);

--stillcut 제약조건 추가
ALTER TABLE stillcut ADD CONSTRAINT wm_movieno_stillcut_fk FOREIGN KEY(movieno) 
REFERENCES movie(movieno);


--동영상 테이블 생성
CREATE TABLE stillmovie (
	stillmvno	  NUMBER            ,
	movieno	      NUMBER            ,
	stillmvname   VARCHAR2(300)     ,
	stillmvurl    VARCHAR2(500)     NOT NULL,
	stillmvimg	  VARCHAR2(200)     NOT NULL,
	
	PRIMARY KEY(stillmvno)
);

ALTER TABLE stillmovie ADD CONSTRAINT wm_movieno_stillmovie_fk FOREIGN KEY(movieno) 
REFERENCES movie(movieno);

CREATE TABLE analysis (
    anaysisno   NUMBER             ,
    movieno     NUMBER             ,
    colldate    DATE               ,
    bookingrate NUMBER             ,
    totalpeople NUMBER             ,
    
    PRIMARY KEY(anaysisno)
);

--anaysis 제약조건 추가
ALTER TABLE analysis ADD CONSTRAINT wm_movieno_analysis_fk FOREIGN KEY(movieno) 
REFERENCES movie(movieno);


CREATE TABLE dailystar (
    dailypoint  NUMBER             ,
    movieno     NUMBER             ,
    dailydate   DATE               ,
    naverstar   NUMBER             ,
    daumstar    NUMBER             ,
    rottenstar  NUMBER             ,
    imdbstar    NUMBER             ,
    yespeople   NUMBER             ,
    totalmoney  NUMBER             ,
    todaypeople NUMBER             ,
    
    PRIMARY KEY(dailypoint)
);

--dailystar 제약조건 추가
ALTER TABLE dailystar ADD CONSTRAINT wm_movieno_dailystar_fk FOREIGN KEY(movieno) 
REFERENCES movie(movieno);

CREATE TABLE wordcloud (
    col           NUMBER              ,
    movieno       NUMBER              ,
    cloudpath     VARCHAR2(255)       ,
    cloudfile     VARCHAR2(255)       ,
    cloudfilesize LONG                ,
    
    PRIMARY KEY(col)
);

--wordcloud 제약조건 추가
ALTER TABLE wordcloud ADD CONSTRAINT wm_movieno_wordcloud_fk FOREIGN KEY(movieno) 
REFERENCES movie(movieno);



--임시 데이터 테스트

--테이블 조회
select * from users;
select * from ticket;
select * from seat;
select * from brand;
select * from theater;
select * from theaterroom;
select * from movie;
select * from nowplaying;
select * from actor;
select * from stillmovie;
select * from stillcut;
select * from review;


--시간-> 시분초 확인
SELECT TO_CHAR(playingtime,'YYYY-MM-DD HH24:MI:SS') FROM nowplaying;
SELECT nowplayingno, movieno, roomno, TO_CHAR(playingtime,'HH24:MI:SS'), playingdate FROM nowplaying;


--브랜드 데이터
-- 입력 완료
insert into brand values (2, 'CGV', 'cgv.png');
insert into brand values (3, 'LOTTECINEMA', 'lotte.png');
insert into brand values (1, 'MEGABOX', 'megabox.png');


--영화관 데이터
-- 입력 완료
insert into theater values (1, 1, '청담씨네시티', '서울특별시 강남구 도산대로 323 (신사동)', 32, 22); 
insert into theater values (2, 1, '신촌아트레온', '서울특별시 서대문구 신촌로 129 (창천동, 아트레온 2층)', 12, 14); 
insert into theater values (3, 2, '김포공항', '서울특별시 강서구 하늘길 77 (방화동, 롯데몰)', 14, 12); 
insert into theater values (4, 2, '브로드웨이(신사)', '서울특별시 강남구 도산대로8길 8 (논현동)', 121, 122); 
insert into theater values (5, 3, '강남대로씨티', '서울특별시 강남구 강남대로 422(역삼동, 씨티빌딩)', 134, 122); 
insert into theater values (6, 3, '상암월드컵경기장', '서울특별시 마포구 월드컵로 240 월드컵몰 1층', 11, 112); 

--상영관 데이터
-- 입력 완료
insert into theaterroom values (1, 1, 333, 12);
insert into theaterroom values (2, 3, 333, 10);
insert into theaterroom values (3, 4, 333, 8);
insert into theaterroom values (4, 5, 333, 1);
insert into theaterroom values (5, 6, 333, 3);


--영화 데이터
-- 입력 완료
insert into movie values (20183363, 1, 1, '나를 차버린 스파이', 'The Spy Who Dumped Me', 15, 'action,comedy', '세상 제일 무서운 건 초짜다!

구)남친 덕에 스파이계 강제 진출한 오드리
친구 따라 스파이계 대충 입문한 모건
 
생일날 문자 이별 통보도 모자라
엿 같은 미션을 남기고 떠난 CIA 구남친 덕에
오드리(밀라 쿠니스)와 절친 모건(케이트 맥키넌)은 국제적인 범죄에 연루된다.
 
얼떨결에 스파이가 되어버린 이들이 유럽 전역을 누비는 가운데,
정체를 알 수 없는 영국 요원들이 접근하고 최정예 킬러까지 따라붙으며
두 절친의 입담과 액션이 터지기 시작하는데…
 
올여름, 이들의 근본 없는 액션이 당신을 깨운다!', '2018-08-22', 'spy.jpg', 117);

insert into movie values (20182332, 2, 2, '맘마미아2', 'Mamma Mia! Here We Go Again', 12, 'action,comedy', '전세계가 사랑한 최고의 뮤지컬 영화가 돌아온다!
 
“인생은 짧고 세상은 넓어. 멋진 추억을 만들고 싶어!”

엄마 도나(메릴 스트립)의 모든 것이 담긴 호텔 재개장을 준비하며 홀로서기를 결심한 소피. 그녀는 엄마의 영원한 친구 타냐와 로지, 그리고 사랑스러운 세 아빠들 샘, 해리, 빌에게 리오픈 파티 초대장을 보낸다. 한편 소피는 파티 준비 중 엄마의 숨겨진 찬란했던 추억과 비밀을 들여다보게 되고, 뜻밖의 손님까지 방문하는데… 과연 한여름의 파티는 무사히 열릴 수 있을까?

“엄마가 자랑스러워할 인생 최고의 파티를 열게요!"
 
올 여름, 인생 최고의 순간이 찾아옵니다!', '2018-08-08', 'mom.jpg', 114);

insert into movie values (20183412, 3, 3, '공작', 'The Spy Gone North', 12, 'drama', '북으로 간 스파이, 암호명 흑금성

1993년, 북한 핵 개발을 둘러싸고 한반도의 위기가 고조된다.
정보사 소령 출신으로 안기부에 스카우트된 박석영(황정민)은 ‘흑금성’이라는 암호명으로
북핵의 실체를 캐기 위해 북의 고위층 내부로 잠입하라는 지령을 받는다.
안기부 해외실장 최학성(조진웅)과 대통령 외에는 가족조차도 그의 실체를 모르는 가운데
대북사업가로 위장해 베이징 주재 북 고위간부 리명운(이성민)에게 접근한 흑금성.
그는 수 년에 걸친 공작 끝에, 리명운과 두터운 신의를 쌓고
그를 통해서, 북한 권력층의 신뢰를 얻는데 성공한다.
그러나, 1997년. 남의 대선 직전에 흑금성은 남과 북의 수뇌부 사이 은밀한 거래를 감지한다.
조국을 위해 굳은 신념으로 모든 것을 걸고 공작을 수행했던 그는 걷잡을 수 없는 갈등에 휩싸이는데…', '2018-08-08', 'gong.jpg', 137);


--상영영화 데이터
insert into nowplaying values (1, 20183363, 1, to_date('2018-09-05 23:25:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-09-05','yyyy-mm-dd'));
insert into nowplaying values (2, 20182332, 3, to_date('2018-09-05 12:30:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-09-05','yyyy-mm-dd'));
insert into nowplaying values (3, 20183412, 4, to_date('2018-09-05 13:30:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-09-05','yyyy-mm-dd'));
insert into nowplaying values (4, 20183363, 2, to_date('2018-09-05 17:50:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-09-05','yyyy-mm-dd'));
insert into nowplaying values (5, 20182332, 3, to_date('2018-09-05 14:30:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-09-05','yyyy-mm-dd'));
insert into nowplaying values (6, 20183412, 3, to_date('2018-09-05 10:09:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-09-05','yyyy-mm-dd'));
insert into nowplaying values (7, 20183412, 2, to_date('2018-09-05 16:50:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-09-05','yyyy-mm-dd'));
insert into nowplaying values (8, 20183363, 2, to_date('2018-09-05 19:35:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-09-05','yyyy-mm-dd'));

--영화배우
insert into actor values (1, '밀라 쿠니스,케이트 맥키넌,샘 휴건');
insert into actor values (2, '아만다 사이프리드,메릴 스트립');
insert into actor values (3, '황정민,조진웅,이성민,주지훈');

--감독
insert into director values(1, '수잔나 포겔');
insert into director values(2, '올 파커');
insert into director values(3, '윤종빈');

--스틸컷
insert into stillcut values(1, 20183363, '80910157752_727.jpg', 'url', '80910157752_727.jpg', 100);
insert into stillcut values(2, 20183363, '80910158048_727.jpg', 'url', '80910158048_727.jpg', 100);
insert into stillcut values(3, 20182332, '80596157869_727.jpg', 'url', '80596157869_727.jpg', 100);
insert into stillcut values(4, 20182332, '80910158048_727.jpg', 'url', '80910158048_727.jpg', 100);
insert into stillcut values(5, 20183412, '80890158149_727.jpg', 'url', '80890158149_727.jpg', 100);
insert into stillcut values(6, 20183412, '80890157864_727.jpg', 'url', '80890157864_727.jpg', 100);

--동영상
insert into stillmovie values(1, 20183363, '나를차버린스파이1', 'https://www.youtube.com/embed/Wolqpxq-AuQ?rel=0', 'spy_t1.jpg');
insert into stillmovie values(2, 20183363, '나를차버린스파이2', 'https://www.youtube.com/embed/otbNeDczIgo', 'spy_t2.jpg');
insert into stillmovie values(3, 20182332, '맘마이아2-1', 'https://www.youtube.com/embed/Ua4qjmvPJ-M', 'mom_t1.jpg');
insert into stillmovie values(4, 20182332, '맘마이아2-2', 'https://www.youtube.com/embed/vA-LWDW4LVY', 'mom_t2.jpg');
insert into stillmovie values(5, 20183412, '공작1', 'https://www.youtube.com/embed/XyEJxOfKaCw', 'gong_t1.jpg');
insert into stillmovie values(6, 20183412, '공작2', 'https://www.youtube.com/embed/9ThNw8xgfms', 'gong_t2.jpg');

--티켓
insert into ticket values(1, 1, 1, 6000, to_date('2018-09-05 23:25:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-09-05','yyyy-mm-dd'), 1);

--좌석
insert into seat values('E1', 16, 'E1', 0);

--수정
UPDATE movie
SET GRADE='15'
WHERE movieno='3';

--컬럼 삭제
delete from nowplaying where nowplayingno='3';
