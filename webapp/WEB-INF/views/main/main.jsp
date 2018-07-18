<%@ page
	import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main/main_style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/common/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/common/slick-theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/modal/movie_detail_style.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=85K3LBTERGnPmOpMLKtu&submodules=geocoder"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>
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
						<img
							src="${pageContext.request.contextPath}/assets/img/movie_poster/poster_4.jpg"
							class="poster">
						<div class="location-info">
							<div class="location-logo">
								<div class="logo-wrap">
									<img
										src="${pageContext.request.contextPath}/assets/img/logo/1.png">
								</div>
							</div>
							<div class="location-name">
								<p class="con">동대문구</p>
							</div>
						</div>

						<div class="limit-time">
							<div class="detail-time">
								<p class="con2">[남은시간]&nbsp;&nbsp;01:02:31</p>
							</div>
						</div>
						</img>
						<div class="front">
							<div clas="front-btn-wrap">
								<div style="padding-top: 130px;">
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
						<img
							src="${pageContext.request.contextPath}/assets/img/movie_poster/poster_3.jpg"
							class="poster">
						<div class="location-info">
							<div class="location-logo">
								<div class="logo-wrap">
									<img
										src="${pageContext.request.contextPath}/assets/img/logo/3.png">
								</div>
							</div>
							<div class="location-name">
								<p class="con">강남구</p>
							</div>
						</div>

						<div class="limit-time">
							<div class="detail-time">
								<p class="con2">[남은시간]&nbsp;&nbsp;01:02:31</p>
							</div>
						</div>
						</img>
						<div class="front">
							<div clas="front-btn-wrap">
								<div style="padding-top: 130px;">
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
						<img
							src="${pageContext.request.contextPath}/assets/img/movie_poster/poster_4.jpg"
							class="poster">
						<div class="location-info">
							<div class="location-logo">
								<div class="logo-wrap">
									<img
										src="${pageContext.request.contextPath}/assets/img/logo/3.png">
								</div>
							</div>
							<div class="location-name">
								<p class="con">서초구</p>
							</div>
						</div>

						<div class="limit-time">
							<div class="detail-time">
								<p class="con2">[남은시간]&nbsp;&nbsp;01:02:31</p>
							</div>
						</div>
						</img>
						<div class="front">
							<div clas="front-btn-wrap">
								<div style="padding-top: 130px;">
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
						<img
							src="${pageContext.request.contextPath}/assets/img/movie_poster/poster_2.jpg"
							class="poster">
						<div class="location-info">
							<div class="location-logo">
								<div class="logo-wrap">
									<img
										src="${pageContext.request.contextPath}/assets/img/logo/2.png">
								</div>
							</div>
							<div class="location-name">
								<p class="con">동대문구</p>
							</div>
						</div>

						<div class="limit-time">
							<div class="detail-time">
								<p class="con2">[남은시간]&nbsp;&nbsp;01:02:31</p>
							</div>
						</div>
						</img>
						<div class="front">
							<div clas="front-btn-wrap">
								<div style="padding-top: 130px;">
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
						<img
							src="${pageContext.request.contextPath}/assets/img/movie_poster/poster_6.jpg"
							class="poster">
						<div class="location-info">
							<div class="location-logo">
								<div class="logo-wrap">
									<img
										src="${pageContext.request.contextPath}/assets/img/logo/1.png">
								</div>
							</div>
							<div class="location-name">
								<p class="con">영등포구</p>
							</div>
						</div>

						<div class="limit-time">
							<div class="detail-time">
								<p class="con2">[남은시간]&nbsp;&nbsp;01:02:31</p>
							</div>
						</div>
						</img>
						<div class="front">
							<div clas="front-btn-wrap">
								<div style="padding-top: 130px;">
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
						<img
							src="${pageContext.request.contextPath}/assets/img/movie_poster/poster_3.jpg"
							class="poster">
						<div class="location-info">
							<div class="location-logo">
								<div class="logo-wrap">
									<img
										src="${pageContext.request.contextPath}/assets/img/logo/1.png">
								</div>
							</div>
							<div class="location-name">
								<p class="con">도봉구</p>
							</div>
						</div>

						<div class="limit-time">
							<div class="detail-time">
								<p class="con2">[남은시간]&nbsp;&nbsp;01:02:31</p>
							</div>
						</div>
						</img>
						<div class="front">
							<div clas="front-btn-wrap">
								<div style="padding-top: 130px;">
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
			<h2>
				<span>Event</span>
			</h2>
		</div>
		<div class="middle-banner-logo">
			<img
				src="${pageContext.request.contextPath}/assets/img/event/introduce.jpg"
				alt="">
		</div>

		<div class="boxoffice-box">
			<div class="officeTop">
				<h2>BOX OFFICE</h2>
				<ul class="officeTab">
					<li class="sale on"><a href="#1">예매순</a></li>
					<li class="star "><a href="#2">평점순</a></li>
				</ul>
			</div>
			<div class="officeCont">
				<ol class="officeRk salecontent">
					<c:forEach
						items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice">
						<li><a href="" class="tit"> <em>${boxoffice.rank}</em> <span
								class="grade_15">15</span> <span class="myTit">${boxoffice.movieNm}</span>
						</a> <span class="memRk">예매율<em>${boxoffice.salesShare} %</em></span>
						</li>
					</c:forEach>
				</ol>

				<ol class="officeRk starcontent">
					<c:forEach
						items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}"
						var="boxoffice">
						<li><a href="" class="tit"> <em>${boxoffice.rank}</em> <span
								class="grade_15">15</span> <span class="myTit">${boxoffice.movieNm}</span>
						</a> <span class="memRk">예매율<em>${boxoffice.salesShare} </em></span></li>
					</c:forEach>
				</ol>
			</div>
		</div>
		<div class="map-box" id="naver_map" style="text-align: center;">

		</div>

		<div class="recommand-box">
			<div class="plus">
				<a href="${pageContext.request.contextPath}/">+ 더보기</a>
			</div>
			<div class="inner-box">
				<div class="first-movie">
					<div class="inner-poster">
						<img
							src="${pageContext.request.contextPath}/assets/img/movie_poster/poster_2.jpg"
							alt="">
					</div>
					<div class="inner-content">
						<div>제목 : 헤어화</div>
						<div>장르 : 사극</div>
						<div>배우 : 천우희, 한효주, 유연석</div>
					</div>
				</div>
				<div class="second-movie">
					<div class="inner-poster">
						<img
							src="${pageContext.request.contextPath}/assets/img/movie_poster/poster_2.jpg"
							alt="">
					</div>
					<div class="inner-content">
						<div>제목 : 헤어화</div>
						<div>장르 : 사극</div>
						<div>배우 : 천우희, 한효주, 유연석</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--footer-notice -->
	<div class="footer-notice">
		<ul>
			<li><a href="../user/notice_list.html" class="text01">공지사항</a></li>
			<li><a href="../user/notice_list.html" class="text02">안드로이드
					태블릿 가로보드 지원 안내</a></li>
		</ul>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
s	<!--body 끝-->
</body>
<script type="text/javascript">
	// Box Office
	$(document).ready(function() {
		$('.sale').on("click", function() {
			$('.sale').addClass("on");
			$('.salecontent').show();
			$('.star').removeClass("on");
			$('.starcontent').hide();
		});
		$('.star').on("click", function() {
			$('.star').addClass("on");
			$('.starcontent').show();
			$('.sale').removeClass("on");
			$('.salecontent').hide();
		});
	});
	// slick library
	$('.swiper-slide').slick({
		dots : false,
		infinite : true,
		speed : 500,
		slidesToShow : 5,
		slidesToScroll : 1,
		autoplay : true,
		autoplaySpeed : 2000,
		arrows : true,
		dots : true,
		responsive : [ {
			breakpoint : 600,
			settings : {
				slidesToShow : 2,
				slidesToScroll : 1
			}
		}, {
			breakpoint : 400,
			settings : {
				arrows : false,
				slidesToShow : 1,
				slidesToScroll : 1
			}
		} ]
	});

	// mouseover function
	$(".poster-box").mouseover(function() {
		$(this).children('.front').addClass('hover');
	});
	$('.poster-box').mouseleave(function() {
		$(this).children('.front').removeClass('hover');
	});

	// modal function
	$('.btn-reserve, .popup-close').click(function() {
		$('.body').toggle();
	});

	// naver_map
	var naver_map = new naver.maps.Map('naver_map', {
		center : new naver.maps.LatLng(37.3595704, 127.105399),
		zoom : 10
	});
	var marker = new naver.maps.Marker({
		position : new naver.maps.LatLng(37.3595704, 127.105399),
		map : naver_map
	});

	var contentString = [
			'<div class="iw_inner">',
			'   <h3>서울특별시청</h3>',
			'   <p>서울특별시 중구 태평로1가 31 | 서울특별시 중구 세종대로 110 서울특별시청<br />',
			'       <img src="" width="55" height="55" alt="서울시청" class="thumb" /><br />',
			'       02-120 | 공공,사회기관 &gt; 특별,광역시청<br />',
			'       <a href="http://www.seoul.go.kr" target="_blank">www.seoul.go.kr/</a>',
			'   </p>', '</div>' ].join('');

	var infowindow = new naver.maps.InfoWindow({
		content : contentString
	});

	naver.maps.Event.addListener(marker, "click", function(e) {
		if (infowindow.getMap()) {
			infowindow.close();
		} else {
			infowindow.open(naver_map, marker);
		}
	});
</script>
</html>