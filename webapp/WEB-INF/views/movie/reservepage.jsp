<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/movie/reserve_page_style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=85K3LBTERGnPmOpMLKtu&submodules=geocoder"></script>
<title>ReservePage</title>
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

	<div id="reserve-wrap" class="wrap">
		<div id="container">
			<div class="search-box" id="">
				<form action="${pageContext.request.contextPath}/movie/search"
					id="search-form" method="get">
					<span class="search-window"> <input class="input-text"
						id="search" name="search" type="text" title="검색"
						placeholder="자주가는 영화관 지점을 입력해주세요. ex) CGV 강남">
					</span>
					<button id="search-btn" type="submit" title="검색버튼" tabindex="3" class="sch-btn">
						<i class="fas fa-search "></i>
					</button>
				</form>
			</div>

			<div class="total-wrap" id="total-wrap">
				<div class="map-container" id="map-container">
					<div class="map-section-wrap" id="map-section-wrap">
						<div class="map-section" id="naver_map"></div>
					</div>
				</div>
				<input type="text" id="theaterxgps" class="theaterygps"
					value="${requestScope.theatervo.theaterxgps}"> <input
					type="text" id="theaterygps" class="theaterxgps"
					value="${requestScope.theatervo.theaterygps}">

				<div class="movie-info-wrap" id="movie-info-wrap">
					<a href="">
						<div class="movie-info" id="movie-info">
							<%-- 예매 영화 정보--%>
						</div>
					</a> <a href="">
						<div class="movie-info" id="movie-info">
							<%-- 예매 영화 정보--%>
						</div>
					</a> <a href="">
						<div class="movie-info" id="movie-info">
							<%-- 예매 영화 정보--%>
						</div>
					</a> <a href="">
						<div class="movie-info" id="movie-info">
							<%-- 예매 영화 정보--%>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

	<script type="text/javascript">
		var $xgps = $(".theaterxgps").val(), $ygps = $('.theaterygps').val();
		console.log($xgps)
		console.log($ygps)
		if ($xgps == "" && $ygps == "") {
			$xgps = 37.56647;
			$ygps = 126.977963;
		}
		var naver_map = new naver.maps.Map('naver_map', {
			center : new naver.maps.LatLng($xgps, $ygps),
			zoom : 10
		});

		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng($xgps, $ygps),
			map : naver_map
		});
		
	</script>
</body>
</html>