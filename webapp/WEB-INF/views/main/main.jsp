<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/include/navi_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main/main_style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common/slick.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common/slick-theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/modal/movie_detail_style.css">
<title>Main Page</title>
</head>

<body>

<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

  <!-- main banner -->
  <div class="g-contents">
    <div class="multi-banner">
      <div class="swiper-slide">
        <div>
          <div class="poster-box">
            <img src="${pageContext.request.contextPath}/assets/img/movie_poster/poster_4.jpg" class="poster">
            <div class="location-info">
              <div class="location-logo"><div class="logo-wrap"><img src="${pageContext.request.contextPath}/assets/img/logo/1.png"></div></div>
              <div class="location-name"><p class="con">동대문구</p></div>
            </div>

            <div class="limit-time">
              <div class="detail-time"><p class="con2">[남은시간]&nbsp;&nbsp;01:02:31</p></div>
            </div>
          </img>
            <div class="front">
              <div clas="front-btn-wrap">
                <div style="padding-top:130px;">
                  <a href="" class="btn-reserve" onclick="return false;">예매하기</a>
                </div>
                <div>
                  <a href="" class="btn-view" onclick="return false;">상세보기</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div>
          <div class="poster-box">
            <img src="${pageContext.request.contextPath}/assets/img/movie_poster/poster_3.jpg" class="poster">
            <div class="location-info">
              <div class="location-logo"><div class="logo-wrap"><img src="${pageContext.request.contextPath}/assets/img/logo/3.png"></div></div>
              <div class="location-name"><p class="con">강남구</p></div>
            </div>

            <div class="limit-time">
              <div class="detail-time"><p class="con2">[남은시간]&nbsp;&nbsp;01:02:31</p></div>
            </div>
          </img>
            <div class="front">
              <div clas="front-btn-wrap">
                <div style="padding-top:130px;">
                  <a href="" onclick="return false;">예매하기</a>
                </div>
                <div>
                  <a href="" onclick="return false;">상세보기</a>
                </div>
              </div>
            </div>
          </div>
        </div>
       <div>
         <div class="poster-box">
           <img src="${pageContext.request.contextPath}/assets/img/movie_poster/poster_4.jpg" class="poster">
           <div class="location-info">
             <div class="location-logo"><div class="logo-wrap"><img src="${pageContext.request.contextPath}/assets/img/logo/3.png"></div></div>
             <div class="location-name"><p class="con">서초구</p></div>
           </div>

           <div class="limit-time">
             <div class="detail-time"><p class="con2">[남은시간]&nbsp;&nbsp;01:02:31</p></div>
           </div>
         </img>
           <div class="front">
             <div clas="front-btn-wrap">
               <div style="padding-top:130px;">
                  <a href="" onclick="return false;">예매하기</a>
                </div>
                <div>
                  <a href="" onclick="return false;">상세보기</a>
                </div>
              </div>
            </div>
          </div>
        </div>
         <div>
          <div class="poster-box">
            <img src="${pageContext.request.contextPath}/assets/img/movie_poster/poster_2.jpg" class="poster">
            <div class="location-info">
              <div class="location-logo"><div class="logo-wrap"><img src="${pageContext.request.contextPath}/assets/img/logo/2.png"></div></div>
              <div class="location-name"><p class="con">동대문구</p></div>
            </div>

            <div class="limit-time">
              <div class="detail-time"><p class="con2">[남은시간]&nbsp;&nbsp;01:02:31</p></div>
            </div>
          </img>
            <div class="front">
              <div clas="front-btn-wrap">
                <div style="padding-top:130px;">
                  <a href="" onclick="return false;">예매하기</a>
                </div>
                <div>
                  <a href="" onclick="return false;">상세보기</a>
                </div>
              </div>
            </div>
          </div>
        </div>
         <div>
           <div class="poster-box">
             <img src="${pageContext.request.contextPath}/assets/img/movie_poster/poster_6.jpg" class="poster">
             <div class="location-info">
               <div class="location-logo"><div class="logo-wrap"><img src="${pageContext.request.contextPath}/assets/img/logo/1.png"></div></div>
               <div class="location-name"><p class="con">영등포구</p></div>
             </div>

             <div class="limit-time">
               <div class="detail-time"><p class="con2">[남은시간]&nbsp;&nbsp;01:02:31</p></div>
             </div>
           </img>
             <div class="front">
               <div clas="front-btn-wrap">
                 <div style="padding-top:130px;">
                  <a href="" onclick="return false;">예매하기</a>
                </div>
                <div>
                  <a href="" onclick="return false;">상세보기</a>
                </div>
              </div>
            </div>
          </div>
        </div>
         <div>
           <div class="poster-box">
             <img src="${pageContext.request.contextPath}/assets/img/movie_poster/poster_3.jpg" class="poster">
             <div class="location-info">
               <div class="location-logo"><div class="logo-wrap"><img src="${pageContext.request.contextPath}/assets/img/logo/1.png"></div></div>
               <div class="location-name"><p class="con">도봉구</p></div>
             </div>

             <div class="limit-time">
               <div class="detail-time"><p class="con2">[남은시간]&nbsp;&nbsp;01:02:31</p></div>
             </div>
           </img>
             <div class="front">
               <div clas="front-btn-wrap">
                 <div style="padding-top:130px;">
                  <a href="" onclick="return false;">예매하기</a>
                </div>
                <div>
                  <a href="" onclick="return false;">상세보기</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- middle banner -->
  <div class="middle-banner">
    <div class="middle-banner-title">
      <h2><span>Untitle</span></h2>
    </div>
    <div class="middle-banner-logo">
      <img src="${pageContext.request.contextPath}/assets/img/event/introduce.jpg" alt="">
    </div>

      <div class="boxoffice-box">
        <div class="officeTop">
          <h2>BOX OFFICE</h2>
          <ul class="officeTab">
            <li class="on"><a href="#1">예매순</a></li>
            <li><a href="#2">평점순</a></li>
          </ul>
        </div>
        <div class="officeCont">
          <ol class="officeRk">
            <div class="blind"></div>
            <li>
              <a href="" class="tit">
                <em>1.</em>
                <span class="grade_15">15</span>
                <span class="myTit">탐정: 리턴즈</span>
              </a>
              <span class="memRk">예매율<em>23.9%</em></span>
            </li>
            <li>
              <a href="" class="tit">
                <em>1.</em>
                <span class="grade_15">15</span>
                <span class="myTit">탐정: 리턴즈</span>
              </a>
              <span class="memRk">예매율<em>23.9%</em></span>
            </li>
            <li>
              <a href="" class="tit">
                <em>1.</em>
                <span class="grade_15">15</span>
                <span class="myTit">탐정: 리턴즈</span>
              </a>
              <span class="memRk">예매율<em>23.9%</em></span>
            </li>
            <li>
              <a href="" class="tit">
                <em>1.</em>
                <span class="grade_15">15</span>
                <span class="myTit">탐정: 리턴즈</span>
              </a>
              <span class="memRk">예매율<em>23.9%</em></span>
            </li>
            <li>
              <a href="" class="tit">
                <em>1.</em>
                <span class="grade_15">15</span>
                <span class="myTit">탐정: 리턴즈</span>
              </a>
              <span class="memRk">예매율<em>23.9%</em></span>
            </li>
            <li>
              <a href="" class="tit">
                <em>1.</em>
                <span class="grade_15">15</span>
                <span class="myTit">탐정: 리턴즈</span>
              </a>
              <span class="memRk">예매율<em>23.9%</em></span>
            </li>
          </ol>
        </div>
      </div>
      <div class="map-box" style="text-align: center;">
        <h1 style="margin-top:40%;">지도</h1>
      </div>
      <div class="recommand-box" style="text-align: center;">
        <h1 style="margin-top:70%;">추천 영화</h1>
      </div>
  </div>

  <!--footer-notice -->
  <div class="footer-notice">
    <ul>
      <li><a href="../user/notice_list.html" class="text01">공지사항</a></li>
      <div>
        <li><a href="../user/notice_list.html" class="text02">안드로이드 태블릿 가로보드 지원 안내</a></li>
      </div>
    </ul>
  </div>

  <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

  <!-- madal function -->
  <div class="body">
    <!--영화 상세 모달창 레이아웃-->
    <div class="modal-mask"> <!--팝업 전체 div-->
      <div class="modal-wrapper"> <!--container를 제외한 여백 div-->
        <!--영화관/남은시간 정보-->
        <div class="modal-time clearfix">
          <div id="movieDetailTime">

            <div class="popup-box-top row1 clearfix">
              <div class="center-wrap">
                <img src="../assets/img/logo/cgv.png" class="t-logo">
                <span class="time-name">명동역 씨네라이브러리</span>
              </div>
                <!-- <img src="assets/img/hourglass.png" class="time-logo"> -->
                <span class="time-title">남은시간</span>
              <div class="time-wrap">01 : 01 : 10 </div>
            </div>
          </div>
        </div>

    <!--세부정보시작-->
    <div class="modal-container clearfix">
      <div id="movieDetail">
        <!--기본정보 : 영화포스터-->
          <div class="popup-box row1 clearfix">
            <div class="left-wrap">
              <img src="../assets/img/movie_poster/poster_3.jpg" alt="오션스8">
            </div>
      <!--기본정보 : 영화정보-->
      <div class="right-wrap">
            <div class="text">
            <div class="title clearfix">
              <h2>
              <i class="age_l age_12">전체관람가</i>
            <span>오션스8</span>
              </h2>
              <p>OCEAN'S 8, 2018</p>
            </div>

        <div class="reservation-wrap">
          <p class="left-p">
            <span>평균 예매율</span>
              <strong class="strong-big">2</strong>
              <span class="span-basic"> 위</span>
              <span class="span-basic">(19.6%)</span>
              <span class="span-sl"> &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp; </span>
          </p>
          <p class="right-p">
              <span>평균 별점</span>
              <span class="small_star">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
              </span>
             <strong class="strong-big">7.6</strong>
          </p>
            </div>
            </div>
            <ul class="info-wrap">
              <li>
                <strong>극장위치 &nbsp; </strong>
                서울특별시 중구 퇴계로 123 (명동, 하이해리엇 10층)
              </li>
              <li>
                <strong>영화시간 &nbsp; </strong>
                <font color="red">18시 30분</font>
              </li>
              <li>
                <strong>상영관 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
                6관 8층
              </li>
            </ul>
            <button type="button" class="btn-movie btn-reservation" onclick="#">
              영화관 위치보기</button>
            <button type="button" class="btn-ticket btn-reservation" onclick="#">
              예매하기</button>
            </div>
          </div>
        <!--기본정보 끝-->
        <!--영화 간략 정보-->
        <!--영화분석-->
        <div class="ans-wrap test">
          <h3>영화분석</h3>
          <div class="col-i-2">
            <div class="panel panel-default">
              <div class="panel-heading">
                다른 사람들이 생각하는 이 영화는?
              </div>
            <div class="panel-body">
              <img src="../assets/img/word/a.png" width="100%">
            </div>
            </div>
          </div>

          <div class="col-i-3">
            <div class="panel panel-default">
              <div class="panel-heading">
                일일평점
              </div>
            <div class="panel-body">
              <img src="../assets/img/bigData/b.png" width="100%">
            </div>
            </div>
          </div>

          <div class="col-i-1">
            <div class="panel panel-default">
              <div class="panel-heading">
                이미 이 영화를 본 사람들의 비율은?
              </div>
            <div class="panel-body">
              <img src="../assets/img/bigData/c.png" width="100%">
            </div>
            </div>
        </div>
        <div class="col-i-4">
          <span> 이 영화에 대해 더 알고싶다면? </span>
          <button type="button" class="btn-ans btn-view" onclick="#">
            영화 분석 더 알아보기</button>
        </div>

        </div>

        <div class="popup-box2 row2">
          <h3>영화 간략 정보</h3>
          <ul class="text">
            <li>
              <strong>감독  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
              게리 로스
            </li>
            <li>
              <strong>출연진 &nbsp; </strong>
              산드라 블록 ,  케이트 블란쳇 ,  앤 해서웨이 ,  민디 캘링 ,  사라 폴슨 ,  아콰피나 ,  리한나 ,  헬레나 본햄 카터
            </li>
            <li>
              <strong>개요 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
              액션,범죄 / 110분
            </li>
          </ul>
        </div>
        <!--줄거리-->
        <div class="popup-box row3">
          <h3>줄거리</h3>
            <div class="text">
              1천 5백억원의 다이아몬드 목걸이를 훔쳐라!<br/>
              과연 목표가 그것뿐일까?<br/>
              전 애인의 배신으로 5년간 감옥에서 썩은 ‘데비 오션’(산드라 블록)은 가석방되자마자<br/>
              믿음직한 동료 ‘루’(케이트 블란쳇)와 함께 새로운 작전을 계획한다.<br/>
              그들의 목표는 바로, 뉴욕 메트로폴리탄 박물관에서 열리는 미국 최대 패션 행사인<br/>
              메트 갈라에 참석하는 톱스타 ‘다프네’(앤 해서웨이)의 목에 걸린 1천 5백억 원의 다이아몬드 목걸이를 훔치는 것!<br/>
              디자이너부터 보석전문가, 소매치기와 해커까지, 전격 결성된 각 분야 전문가들이 마침내 실행에 나서는데…<br/>
              <br/>
              기가 막힌 작전, 그 뒤에 또 다른 목적<br/>
              화끈하게 훔치고 시원하게 갚는다!<br/>
            </div>
        </div>

        <!--동영상/스틸컷-->
        <div class="popup-box row4">
          <h3>
              <a class="btn_steelCut active" onclick="#" href="http://www.naver.com" title="스틸컷 보기">
                스틸컷
              <span class="stillCount">7</span>
              </a>

              <span class="line"> &nbsp;&nbsp;|&nbsp;&nbsp; </span>

              <a class="btn_play" onclick="#" href="http://www.naver.com" target="_blank" title="동영상 보기">
                동영상
              <span class="trailerCount">3</span>
              </a>
          </h3>

          <div class="stillcut-list">
              <!--이전&다음 버튼-->
              <div class="still-prevNext">
                <a class="still-prev" href="#" title="이전 스틸컷보기">이전 스틸컷</a>
                <a class="still-next" href="#" title="다음 스틸컷보기">다음 스틸컷</a>
              </div>

              <div class="still-slide">
                <ul style="width: 1143px; left: 0px; right: 0px;">
                    <li class="stillLi" style="display: block;">
                      <div>
                        <a href="#" index="0" title="스틸컷1 선택" class="on">
                          <span class="blind">오션스8 스틸컷1</span>
                        </a>
                        <img src="http://image2.megabox.co.kr/mop/poster/2018/4B/071542-0D54-4776-95AC-C45580621AFC.large.jpg" alt="오션스8 스틸컷1">
                        <em></em>
                      </div>
                    </li>
                    <li class="stillLi" style="display: block;">
                      <div>
                        <a href="#" index="1" title="스틸컷2 선택">
                          <span class="blind">오션스8 스틸컷2</span>
                        </a>
                        <img src="http://image2.megabox.co.kr/mop/still/2018/0F/0006B4-6C42-49F2-9E04-49E617B12792.large.jpg" alt="오션스8 스틸컷2">
                        <em></em>
                      </div>
                    </li>
                    <li class="stillLi" style="display: block;">
                      <div>
                        <a href="#" index="1" title="스틸컷3 선택">
                          <span class="blind">오션스8 스틸컷3</span>
                        </a>
                        <img src="http://image2.megabox.co.kr/mop/still/2018/9A/D57763-D1F4-4422-9E72-AB84D3164B96.large.jpg" alt="오션스8 스틸컷3">
                        <em></em>
                      </div>
                    </li>
                    <li class="stillLi" style="display: block;">
                      <div>
                        <a href="#" index="1" title="스틸컷4 선택">
                          <span class="blind">오션스8 스틸컷4</span>
                        </a>
                        <img src="http://image2.megabox.co.kr/mop/still/2018/36/3C030C-9410-44E2-97E8-350DDEBE9630.large.jpg" alt="오션스8 스틸컷4">
                        <em></em>
                      </div>
                    </li>
                    <li class="stillLi" style="display: block;">
                      <div>
                        <a href="#" index="1" title="스틸컷5 선택">
                          <span class="blind">오션스8 스틸컷5</span>
                        </a>
                        <img src="http://image2.megabox.co.kr/mop/still/2018/62/4AFC81-1857-471E-B134-FAB6A5EB4B5B.large.jpg" alt="오션스8 스틸컷5">
                        <em></em>
                      </div>
                    </li>
                    <li class="stillLi" style="display: block;">
                      <div>
                        <a href="#" index="1" title="스틸컷6 선택">
                          <span class="blind">오션스8 스틸컷6</span>
                        </a>
                        <img src="http://image2.megabox.co.kr/mop/still/2018/76/F3C079-083E-48DE-B0DB-F85BD742BB92.large.jpg" alt="오션스8 스틸컷6">
                        <em></em>
                      </div>
                    </li>
                    <li class="stillLi" style="display: block;">
                      <div>
                        <a href="#" index="1" title="스틸컷7 선택">
                          <span class="blind">오션스8 스틸컷7</span>
                        </a>
                        <img src="http://image2.megabox.co.kr/mop/still/2018/32/FDA39A-0A9B-4F7E-8658-671C1C7EFDC9.large.jpg" alt="오션스8 스틸컷7">
                        <em></em>
                      </div>
                    </li>
                </ul>
              </div>
          </div>
          <div class="still-view-box">
            <!--이전&다음 버튼-->
            <div class="still-prevNext2" style="display: block;">
              <a class="still-prev2" href="#" title="이전 스틸컷 보기">이전 스틸컷</a>
              <a class="still-next2" href="#" title="다음 스틸컷 보기">다음 스틸컷</a>
            </div>
            <div class="still-img" style="display:block;">
              <img alt="오션스8 스틸컷1" src="http://image2.megabox.co.kr/mop/poster/2018/4B/071542-0D54-4776-95AC-C45580621AFC.large.jpg">
            </div>
          </div>
        </div>

        <!--감상평 등록-->
    <div class="popup-box1 row4">
      <div class="review">
        <h3>실관람객 평가</h3>
        <button type="button" class="btn-review btn-review-update" >
          평점작성</button>
      </div>
      <div id="movieCommentList" class="list">
       <div class="item-2block">
        <div class="row">
          <!--반복-->
          <div class="cell">
              <div class="photo-profile">
                  <img src="http://image2.megabox.co.kr/mop/home/user/profile_m.png" alt="프로필 사진없음">
              </div>

              <div class="text">
                  <div class="name">
                      <strong>bit***</strong>
                  </div>
                  <div class="review-active">
                    <a href="#menu" id="toggle"><span></span></a>
                        <div id="menu">
                          <ul>
                            <li><a href="#">스포일러 신고</a></li>
                            <li><a href="#">욕설/비방/광고 신고</a></li>
                          </ul>
                        </div>
                    </div>
                  <div class="dataStarReal">
                      <span>18.06.26</span>
                      <span class="star-2">
                      <i class="fas fa-star"></i>
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i>
                     </span>
                  </div>
                  <p>
                     <span class="comment"> 마이너스 있으면 -로 주고싶을 정도였어요.
                     화려한 배우들로 저정도밖에 못하다니..</span>
                  </p>
            </div>
          </div>

            <div class="cell">
              <div class="photo-profile">
                  <img src="http://image2.megabox.co.kr/mop/home/user/profile_m.png" alt="프로필 사진없음">
              </div>

              <div class="text">
                  <div class="name">
                      <strong>dd***</strong>
                  </div>
                  <div class="review-active">
                    <a href="#menu" id="toggle"><span></span></a>
                      <div id="menu">
                        <ul>
                          <li><a href="#">스포일러 신고</a></li>
                          <li><a href="#">욕설/비방/광고 신고</a></li>
                        </ul>
                      </div>
                  </div>
                  <div class="dataStarReal">
                      <span>18.06.24</span>
                      <span class="star-2">
                      <i class="fas fa-star"></i>
                      <i class="fas fa-star"></i>
                      <i class="fas fa-star"></i>
                      <i class="fas fa-star"></i>
                      <i class="far fa-star"></i>
                     </span>
                  </div>
                  <p>
                     <span class="comment"> 요 근래 본 영화중에서 제일 재밌고 흥미진진하게 봤습니다. 그리고 제발 오역좀^^ 이 번역가 좀 안썼으면.
                       내가 내돈주고 영화 보고서 오역된 부분 찾아서 정리해 논 글을 다시 읽음</span>
                  </p>
            </div></div>
       </div>
    </div>
  </div>
  <div class="pagination">
      <a href="#">&laquo;</a>
      <a href="#">1</a>
      <a class="active" href="#">2</a>
      <a href="#">3</a>
      <a href="#">4</a>
      <a href="#">5</a>
      <a href="#">6</a>
      <a href="#">&raquo;</a>
  </div>
    </div> <!--movieDetail 끝-->

          <button type="button" class="popup-close">
          <img src="${pageContext.request.contextPath}/assets/img/icon/modal-x-mark.png"> <!--버튼 이미지-->
          <span class="blind">닫기</span>
         </button>
       </div><!--modal-container 끝-->
      </div>
    </div>
  </div> <!--body 끝-->
</body>
<script type="text/javascript">
    // slick library
    $('.swiper-slide').slick({
        dots: false,
        infinite: true,
        speed: 500,
        slidesToShow: 5,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        arrows: true,
        dots: true,
        responsive: [{
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        },
        {
           breakpoint: 400,
           settings: {
              arrows: false,
              slidesToShow: 1,
              slidesToScroll: 1
           }
        }]
    });

    // navigation javascript
      $(function(){
        $(document).mouseup(function(e) {
          if ($(e.target).parents('.header_right').length == 0) {
            $('.header_right li').removeClass('expand');
            $('.header_right ul').hide();
          }
        });
        $(".header_right ul li:has(ul)")
          $(".header_right li>a").click(function(){
            var li = $(this).parent();
            var ul = li.parent()
            ul.find('li').removeClass('expand');
            ul.find('ul').not(li.find('ul')).hide();
            li.children('ul').toggle();
            if( li.children('ul').is(':visible') || li.has('ul')) {
              li.addClass('expand');
            }
          });
      });

      // mouseover function
      $(".poster-box").mouseover(function(){
        $(this).children('.front').addClass('hover');
      });
      $('.poster-box').mouseleave(function(){
        $(this).children('.front').removeClass('hover');
      });

      // modal function
      $('.btn-reserve, .popup-close').click(function(){
        $('.body').toggle();
      });
</script>
</html>