<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/modal/location.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<title>location</title>
<title>location</title>
</head>
<body>
<div class="body">

<button onclick="document.getElementById('location').style.display='block'" class="btn-ans">Open Modal</button>

<div class="modal-location-mask" id="location">
  <div class="modal-location-wrapper">
    <div class="modal-location-container">
      <h2>나의 위치 등록하기</h2>
      <div class="select-location">
      <i class="fas fa-map-marker-alt"></i><span>서울_도봉구</span>
    </div>
      <div class="p-des">
      <p class="description">내가 자주있는 위치를 등록해보세요.<br/>
        더욱 편하게 영화표 정보를 안내받을 수 있어요.</p>
      </div>

     <div class="search">
        <input type="text" placeholder="동을 입력해주세요. 예)서초동" id="search-addr" class ="sh-location-input">
        <button class="btn-search"><i class="fas fa-search "></i></button>
     </div>

     <div class="sh-location-body">
       <div>
       <div class="search-scroll">
        <div class="location-wrap">
            <div class="sh-component01">
                서울특별시 서초구 서초동 <button type="button" class="btn-select">적용하기</button>
            </div>
            <div class="sh-component01">
                서울특별시 동작구 서초동 <button type="button" class="btn-select">적용하기</button>
            </div>
            <div class="sh-component01">
                서울특별시 서초구 서초동 <button type="button" class="btn-select">적용하기</button>
            </div>
            <div class="sh-component01">
                서울특별시 강남구 서초동 <button type="button" class="btn-select">적용하기</button>
            </div>
            <div class="sh-component01">
                서울특별시 서초동 서초동 <button type="button" class="btn-select">적용하기</button>
            </div>
            <div class="sh-component01">
                서울특별시 도봉구 서초동 <button type="button" class="btn-select">적용하기</button>
            </div>
            <div class="sh-component01">
                서울특별시 어디죠 서초동 <button type="button" class="btn-select">적용하기</button>
            </div>
        </div>
      </div>
    </div>
    </div>

<button type="button" class="popup-close" onclick="document.getElementById('location').style.display='none'" >
<img src="${pageContext.request.contextPath}/assets/img/icon/close.png"> <!--버튼 이미지-->
<span class="blind">닫기</span>
</button>
</div>
</div>
</div>
</div>
</body>
</html>