<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/include/navi_style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<!-- navigation -->
<div id="header_wrap">
	<div class="header">
		<h1 class="logo">
			<a href="${pageContext.request.contextPath}/main">
			<img src="${pageContext.request.contextPath}/assets/img/logo/logo2.png" style="margin-top: 1px;"></a>
		</h1>
		<ul class="header_left">
			<li><a href="${pageContext.request.contextPath}/movie/reserve">예매</a></li>
			<li><a href="${pageContext.request.contextPath}/movie/analysis">평점분석</a></li>
			<li><a href="${pageContext.request.contextPath}/movie/current_movie">상영작/예정작</a></li>
			<li><a href="${pageContext.request.contextPath}/movie/">추천영화</a></li>
		</ul>

		<ul class="header_login">
			<li><a href="#" onclick="return false;"><i class="fa fa-map-marker-alt"></i>
				<span id = "btn-location"> 위치검색</span> </a>
			</li>
			<c:if test="${sessionScope.authUser == null}">
				<li class="myinfo">
					<div class="before_login">
						<a href="${pageContext.request.contextPath}/user/loginform">로그인</a>
						<a href="${pageContext.request.contextPath}/user/register">회원가입</a>
					</div>
				</li>						
			</c:if>
			<c:if test="${sessionScope.authUser != null}">
				<li class="myinfo2">
					<a href="javascript:void(0)" class="dropbtn"><i class="fas fa-user"></i>
						&nbsp;&nbsp;${authUser.username}님&nbsp;&nbsp;<i class="fas fa-angle-down"></i>
					</a>
					<ul class="hide dropdown-content">
						<li><a href="${pageContext.request.contextPath}/mypage/myinfo">회원정보</a></li>
						<li><a href="${pageContext.request.contextPath}/mypage/myticket">예매내역</a></li>
						<li><a href="${pageContext.request.contextPath}/mypage/contact">1:1 문의</a></li>
						<li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
					</ul>
				</li>	
			</c:if>
		</ul>
	</div>
</div>
<%--<c:import url="/WEB-INF/views/modal/location.jsp"></c:import>--%>
<script>
    $(document).ready(function(){
		$(".dropbtn").on("click", function(){
			var submenu = $(this).next('ul');

			if( submenu.is(":visible")){
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
    });
</script>