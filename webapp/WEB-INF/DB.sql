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

CREATE SEQUENCE seq_seat_no
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
    
    PRIMARY KEY(ticketno)
);

--ticket 제약조건 추가
ALTER TABLE ticket ADD CONSTRAINT wm_userno_fk FOREIGN KEY(userno) 
REFERENCES users(userno);
ALTER TABLE ticket ADD CONSTRAINT wm_seatno_fk FOREIGN KEY(seatno) 
REFERENCES seat(seatno);

CREATE TABLE seat (
    seatno          NUMBER        ,
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
    reviewstar    NUMBER            NOT NULL,
    
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
select * from USERS;
select * from TICKET;
select * from SEAT;
select * from brand;
select * from theater;
select * from theaterroom;
select * from movie;
select * from nowplaying;


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
insert into theaterroom values (1, 1, 333);
insert into theaterroom values (2, 3, 333);
insert into theaterroom values (3, 4, 333);
insert into theaterroom values (4, 5, 333);
insert into theaterroom values (5, 6, 333);


--영화 데이터
-- 입력 완료
insert into movie values (20183361, 1, 1, '인크레더블', 'incredibles2', 0, 'action,comedy', '엄마 ‘헬렌’이 국민 히어로 ‘일라스티걸’로 활약하고 아빠 ‘밥’은 삼남매와 고군분투하며 육아 히어로로 거듭난 가운데,
정체불명의 악당이 등장해 위기 상황이 발생하면서 슈퍼파워 가족이 다시 한번 ‘인크레더블’한 능력을 발휘하는 이야기.', '2018-07-18', 'incredibles2.jpg');

insert into movie values (20180522, 1, 1, '앤트맨과 와스프', 'Ant-Man and the Wasp', 12, 'action', '“이제 믿을 건 자네 둘 뿐이야”,
사이즈부터 다른 마블의 히든카드가 온다.

‘시빌 워’ 사건 이후 은둔하며 히어로와 가장의 역할 사이에서 고민 중이던 
‘앤트맨’과 새로운 파트너 ‘와스프’ 앞에 정체불명의 빌런 ‘고스트’가 등장한다. 
시공간의 개념이 사라진 양자 영역으로 들어갈 수 있는 기술을 훔쳐 달아난 
고스트를 쫓던 앤트맨과 와스프는 상상도 못했던 상황에 직면하는데…', '2018-07-04', 'antman.jpg');

insert into movie values (20181181, 1, 1, '미션 임파서블: 폴아웃', 'Mission:Impossible- Fallout', 15, 'action', '예측 할 수 없는 미션. 피할 수 없는 선택
전 세계 최강의 스파이 기관 IMF의 최고 요원 에단 헌트(톰 크루즈)와 그의 팀은 테러조직의 핵무기 소지를 막기 위해 미션에 착수한다.
에단 헌트는 작전 수행 중 예상치 못한 결단을 내리게 되고, 중앙정보국 CIA는 그를 견제하기 위해 상급 요원 어거스트 워커(헨리 카빌)를 파견한다.
최악의 테러 위기와 라이벌의 출현 속, 팀이 행한 모든 선의의 선택들이 최악의 결과로 돌아오면서 미션은 점점 더 예측할 수 없는 상황으로 치닫게 되는데…
사상 가장 불가능한 미션, 피할 수 없다면 끝내야 한다!', '2018-07-25', 'mission.jpg');


--상영영화 데이터
insert into nowplaying values (11, 20183361, 1, to_date('2018-08-21 14:40:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-08-21','yyyy-mm-dd'));
insert into nowplaying values (12, 20183361, 3, to_date('2018-08-21 12:30:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-08-21','yyyy-mm-dd'));
insert into nowplaying values (13, 20180522, 4, to_date('2018-08-21 13:30:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-08-21','yyyy-mm-dd'));
insert into nowplaying values (14, 20181181, 2, to_date('2018-08-21 17:50:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-08-21','yyyy-mm-dd'));
insert into nowplaying values (16, 20181181, 3, to_date('2018-08-21 14:30:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-08-21','yyyy-mm-dd'));
insert into nowplaying values (17, 20183361, 3, to_date('2018-08-21 10:09:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-08-21','yyyy-mm-dd'));
insert into nowplaying values (18, 20183361, 2, to_date('2018-08-21 16:50:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-08-21','yyyy-mm-dd'));
insert into nowplaying values (19, 20183361, 2, to_date('2018-08-21 19:35:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-08-21','yyyy-mm-dd'));
insert into nowplaying values (20, 20183361, 3, to_date('2018-08-22 23:35:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-08-22','yyyy-mm-dd'));

--영화배우
insert into actor values (1, '테스트배우');

--감독
insert into director values(1, '테스트감독');


--수정
UPDATE movie
SET GRADE='15'
WHERE movieno='3';

--컬럼 삭제
delete from nowplaying where nowplayingno='3';

--체크
select t.theaterno, t.brandno, t.theatername, t.theaterlocate, t.theatergps, b.brandname, b.brandlogo
from theater t, brand b
where t.brandno = b.brandno;

select n.nowplayingno, n.roomno, n.movieno, TO_CHAR(n.playingtime,'YYYY-MM-DD HH24:MI:SS'), TO_CHAR(n.playingdate,'YYYY-MM-DD HH24:MI:SS'), m.poster, tr.theaterno, t.brandno, t.theatername,
t.theaterlocate, t.theaterxgps, t.theaterygps, b.brandlogo, b.brandname
from nowplaying n, movie m, THEATERROOM tr, theater t, brand b
where n.movieno = m.movieno and n.roomno = tr.roomno and tr.theaterno = t.theaterno and t.brandno = b.brandno;

select sysdate from dual;

select * from theater;

SELECT TO_DATE('20180722') - TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD')) FROM DUAL; 

SELECT ( TO_DATE('2011/12/28/ 18/00/00','yyyy/mm/dd/ hh24/mi/ss') - TO_DATE('2011/12/28/ 14/00/00','yyyy/mm/dd/ hh24/mi/ss') ) * (24*60*60) AS RemainSecond
FROM DUAL;
commit
 select n.nowplayingno, n.roomno, n.movieno, TO_CHAR(n.playingtime,'yyyy-mm-dd HH24:MI:SS') as playingtime, TO_CHAR(n.playingdate, 'yyyy-mm-dd') as playingdate, m.poster, tr.theaterno, t.brandno, t.theatername,
				t.theateraddress, t.theaterxgps, t.theaterygps, b.brandlogo, b.brandname
		from nowplaying n, movie m, THEATERROOM tr, theater t, brand b
		where n.movieno = m.movieno and n.roomno = tr.roomno and tr.theaterno = t.theaterno and t.brandno = b.brandno;
SELECT *
FROM NOWPLAYING
commit

SELECT c.theaterno, c.brandname, c.brandlogo, c.theatername, c.theateraddress, c.playingtime, c.playingdate, m.koname
FROM(SELECT b.theaterno, b.brandname, b.brandlogo, b.theatername, b.theateraddress, n.playingtime, n.playingdate, n.movieno
	FROM(SELECT a.theaterno, a.brandname, a.brandlogo, a.theatername, a.theateraddress, r.roomno
		FROM (SELECT b.brandname, b.brandlogo, t.theatername, t.theaterno, t.theateraddress
				FROM brand b, theater t
				WHERE b.brandno = t.brandno) a, theaterroom r
		WHERE r.theaterno = a.theaterno) b, nowplaying n
	WHERE b.roomno = n.roomno) c, movie m
WHERE c.movieno = m.movieno
AND c.theaterno = 8

select  n.nowplayingno, 
    				n.roomno, 
    				n.movieno, 
    				to_char(n.playingtime,'YYYY-MM-DD HH24:MI:SS') as playingtime, 
    				to_char(n.playingdate,'YYYY-MM-DD') as playingdate, 
    				m.poster, 
    				tr.theaterno, 
    				t.brandno, 
    				t.theatername,
					t.theateraddress, 
					t.theaterxgps, 
					t.theaterygps, 
					b.brandlogo, 
					b.brandname
			from nowplaying n, movie m, THEATERROOM tr, theater t, brand b
			where  n.movieno = m.movieno and n.roomno = tr.roomno and tr.theaterno = t.theaterno and t.brandno = b.brandno
			and (n.playingtime - sysdate) *24*60*60 > 0 
			and n.playingtime between to_date(concat(to_char(sysdate, 'yyyy-mm-dd'), '04:00:01'), 'yyyy-mm-dd hh24:mi:ss')
			and to_date(concat(to_char(sysdate+1, 'yyyy-mm-dd'), '04:00:00'), 'yyyy-mm-dd hh24:mi:ss')
			and to_char(n.playingtime,'YYYY-MM-DD') = to_char(n.playingdate,'YYYY-MM-DD')
			order by n.playingtime asc