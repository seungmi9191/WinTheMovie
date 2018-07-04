<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- navigation -->
<div id="header_wrap">
 <div class="header">
    <h1 class="logo"><a href="../main/main.html"><img src="${pageContext.request.contextPath}/assets/img/logo/logo2.png" style="margin-top:1px;"></a></h1>
    <ul class="header_left">
      <li><a href="../moive/reservepage.html">예매</a></li>
      <li><a href="../movie/analysis.html">평점분석</a></li>
      <li><a href="../movie/current_movie.html">상영작/예정작</a></li>
      <li><a href="../movie/recommend.html">추천영화</a></li>
    </ul>
    <!--로그인 전-->
    <!-- <ul class="header_right">
      <li>
        <a>
          <i class="fa fa-map-marker-alt"></i>
          위치 검색
        </a>
      </li>
      <li class="myinfo">
          <div class="before_login">
          <a href="../user/login.html">
            <i>로그인</i>
          </a>
          <a href="../user/register.html">
            <i>회원가입</i>
          </a>
        </div>
      </li>
    </ul> -->

    <!--로그인 후-->
    <ul class="header_login">
      <li>
        <a>
          <i class="fa fa-map-marker-alt"></i>
          위치 검색
        </a>
      </li>
      <div class="after_login">
      <li class="myinfo2">
          <!-- <div class="before_login2"> -->
            <a class="aa"><i class="fas fa-user"></i>&nbsp;&nbsp;
           윈더무비님&nbsp;&nbsp;<i class="fas fa-angle-down"></i></a>
        <!-- </div> -->
      </li>
    </ul>
    </div>
          <!-- <a>
             <i class="fas fa-user"></i>
             JIIMY 고객님<i class="fas fa-angle-down"></i>
           </a>-->
            <ul class="dropdown-content">
             <li><a href="#">예매내역</a></li>
             <li><a href="#">회원정보</a></li>
             <li><a href="#">나의 영화관</a></li>
             <li><a href="#">1:1 문의</a></li>
             <li><a href="#">로그아웃</a></li>
           </ul>
  </div>
</div>