<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/movie/reserve_style.css"> 
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<title>reserve_final</title>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

<div class="final_body"> 
  <!--영화 상세 모달창 레이아웃-->
  <div class="modal-mask"> <!--팝업 전체 div-->
    <div class="modal-wrapper"> <!--container를 제외한 여백 div-->
      <!--영화관/남은시간 정보-->
      <div class="modal-time clearfix">
        <div id="movieDetailTime">
          <div class="popup-box-top row1 clearfix">
            <div class="center-wrap">
              <span class="time-name">빠른 예매 - 인원/좌석선택</span>
            </div>
          </div>
        </div>
      </div>
     <div class="modal-container clearfix">
      <div class="left_wrap">
        <div class="group">
          <span class="title">일반</span>
          <ul>
            <li class="selected" data-count="0"><a href="#" onclick="return false;">0</a></li>
            <li class=""  data-count="1"><a href="#" onclick="return false;">1</a></li>
            <li class=""  data-count="2"><a href="#" onclick="return false;">2</a></li>
            <li class=""  data-count="3"><a href="#" onclick="return false;">3</a></li>
            <li class=""  data-count="4"><a href="#" onclick="return false;">4</a></li>
          </ul>
          <span class="contents">인원 선택은 최대 4명까지 가능합니다.</span>
        </div>
        <div class="group2">
          <div class="screen-box">
            <div class="place" style="background-color: #fff; position:relative;">
              <div class="seat-wrap">
                <p class="screen">SCREEN</p>
              </div>
            </div>
          </div>
        </div>
        <div class="group3">
          <div class="seats-info-title">
            <span style="font-size:14px; color:#5a5757;">좌석 안내</span>
            <div class="seats-info">
            <div class="box">
              <div class="seats-selected"></div>
              <div>선택좌석</div>
            </div>
            <div class="box">
              <div class="seats-soldout"></div>
              <div>예매완료</div>
            </div>
            <div class="box">
              <div class="seats-possible"></div>
              <div>일반석</div>
            </div>
          </div>
          </div>
          
        </div>
      </div>

      <div class="right_wrap">
        <div class="row1"><img src="${pageContext.request.contextPath}/assets/img/movie_poster/ocean.jpg" alt=""></div>
        <div class="row2">
          <div class="booking-movie-title">
            <i class="age age_all">15세관람가</i>
            <h4>쥬라기 공원</h4>
          </div>
          <div class="booking-movie-content">
            <table style="width:240px;">
              <tr>
                <td style="width:45px; height:25px;">극장&nbsp;&nbsp;|</td>
                <td>강남 CGV 3층 4관</td>
              </tr>
              <tr>
                <td style="width:45px; height:25px;">일시&nbsp;&nbsp;|</td>
                <td>2018.06.22(금) 15:20</td>
              </tr>
              <tr>
                <td style="width:45px; height:25px;">좌석&nbsp;&nbsp;| </td>
                <td>h1, h2</td>
              </tr>
            </table>
          </div>
          <div class="pay-btn">
            <button type="button" class="btn-close">취소</button>
            <button type="button" class="btn-next">결제하기</button>
          </div>
        </div>
      </div>
     <!--  <button type="button" class="popup-close">
        <img src="../assets/img/icon/modal-x-mark.png"> 버튼 이미지
        <span class="blind">닫기</span>
      </button> -->
    </div>
    </div>
  </div>
</div>
<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
</body>
</html>