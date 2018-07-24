<%@ page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main/main_style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common/slick.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common/slick-theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/modal/movie_detail.css"> 
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=85K3LBTERGnPmOpMLKtu&submodules=geocoder"></script>
<script type="text/javascript">
	var $userX, $userY;
</script>
<title>Main Page</title>
</head>

<body>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	
	<!-- main banner -->
  <div class="g-contents">
    <div class="multi-banner">
     <div class="swiper-slide">
       <c:forEach items="${theaterList}" var="theaterList" >
        <div>
          <div class="poster-box">
            <img src="${pageContext.request.contextPath}/upload/poster/${theaterList.poster}" class="poster">
            <div class="location-info">
              <div class="location-logo"><div class="logo-wrap"><img src="${pageContext.request.contextPath}/upload/${theaterList.brandlogo}"></div></div>
              <c:choose>
              	<c:when test="${fn:length(theaterList.theateraddress) > 1}"> 
	              <div class="location-name">
	              	<p class="con">
		              	<c:set var="splitloc" value="${fn:split(theaterList.theateraddress,' ')[1]}"></c:set> <!--locate에서 공백기준으로 배열 index[1] 받아옴 -->
		              	<c:set var="len" value="${fn:length(splitloc)}"></c:set> <!--받아온 index[1]의 단어길이 확인 -->
						<c:set var="substringloc" value="${fn:substring(splitloc,0,len-1) }"></c:set> <!--'구' 삭제위해 index 전체길이-1 -->
	              		<c:out value="${substringloc}"></c:out>
	              	</p></div>
               	</c:when>
               	<c:otherwise>
	              <div class="location-name">
	              	<p class="con">
	              		<c:out value="${theaterList.theateraddress}"></c:out>
	              	</p></div>
               	</c:otherwise>
              </c:choose>
            </div>

            <div class="limit-time">
              <div class="detail-time">
              <p class="con2" name="time">[남은시간]&nbsp;&nbsp;</p></div>
            </div>
            <div class="front">
              <div class="front-btn-wrap">
                <div style="padding-top:130px;">
                  <a href="" class="btn-reserve" onclick="return false;">예매하기</a>
                </div>
                <div>
                  <a href="" class="btn-view" id="close" onclick="return false;" >상세보기</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
       </div>
     </div>
   </div>
   <p class="con2" id="time2">[남은시간]&nbsp;&nbsp;</p></div>
	<!-- middle banner -->
	<div class="middle-banner">
		<div class="middle-banner-title">
			<h2>
				<span>영화 티켓은 SITE WIN THE MOVIE.</span>
			</h2>
		</div>
		<div class="middle-banner-logo">
			<img src="${pageContext.request.contextPath}/assets/img/event/introduce.jpg" alt="">
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
						items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}"
						var="boxoffice">
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
			<li><a href="../user/notice_list.html" class="text02">안드로이드 태블릿 가로보드 지원 안내</a></li>
		</ul>
	</div>
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/modal/location.jsp"></c:import>
	<c:import url="/WEB-INF/views/modal/movie_detail.jsp"></c:import>
	<!-- madal function -->

</body>
<script type="text/javascript">
	// Box Office
	$(document).ready(function() {
		$('.body-loc').hide();
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
		
		check_geolocation();
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
		responsive : [{
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
		}]
	});

	// modal function
	$('.btn-reserve, .popup-close').click(function() {
		$('.body').toggle();
	});
	
	$('.btn-address').on("click", function(){
		$('.body-loc').toggle();
	})
	
	// geolocation 사용 여부
	function check_geolocation(){
		if(window.navigator.geolocation){
			 navigator.geolocation.getCurrentPosition(current, showError);
		 } else{
			 alert("현재 브라우저는 위치 서비스를 지원하지 않습니다.");
			 naver_func();
		 }
	}
	
	function showError(error){
		switch (error.code) {
			case error.PERMISSION_DENIED:
				break;
			case error.POSITION_UNAVAILABLE:
		   		break;
			case error.TIMEOUT:
		   		break;
			case error.UNKNOWN_ERROR:
		   		break;
		}
		naver_func();
	}
	
	//geolocation 사용할 경우
	function current(position){
		var $xgps, $ygps, $markers=[], $infoWindow=[];
		var lat = position.coords.latitude;
	    var longi = position.coords.longitude;
	    
	    var naver_map = new naver.maps.Map('naver_map', {
			center : new naver.maps.LatLng(lat, longi),
			zoom : 8
		});
	    var my_marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(lat, longi),
			map : naver_map
		});
	    
		$.ajax({
			url : "${pageContext.request.contextPath}/selectTheater",
			success : function(list){
				 for(var i=0;i<list.length;i++){
					 $xgps = Number(list[i].theaterygps),
					 $ygps = Number(list[i].theaterxgps);
					 var marker = new naver.maps.Marker({
						position : new naver.maps.LatLng($xgps , $ygps),
						map : naver_map
					});
					
					var contentString = [
						'<div class="iw_inner">',
						' <h3>'+list[i].theatername+'</h3>',
						'<p>'+list[i].theateraddress+'</p>',
						'</div>'
					].join('');
					var infoWindow = new naver.maps.InfoWindow({
				        content: contentString
					});
					
					$markers.push(marker);
					$infoWindow.push(infoWindow);
				 }
				
				for (var i=0, ii=$markers.length; i<ii; i++) {
				    naver.maps.Event.addListener($markers[i], 'click', getClickHandler(i));
				} 
				naver.maps.Event.addListener(naver_map, 'idle', function() {
				    updateMarkers(naver_map, $markers);
				});

				function updateMarkers(map, markers) {
				    var mapBounds = map.getBounds();
				    var marker, position;

				    for (var i = 0; i < markers.length; i++) {
				        marker = markers[i]
				        position = marker.getPosition();

				        if (mapBounds.hasLatLng(position)) {
				            showMarker(map, marker);
				        } else {
				            hideMarker(map, marker);
				        }
				    }
				}

				function showMarker(map, marker) {
				    if (marker.setMap()) return;
				    marker.setMap(map);
				}

				function hideMarker(map, marker) {
				    if (!marker.setMap()) return;
				    marker.setMap(null);
				}

				function getClickHandler(seq) {
				    return function(e) {
				        var marker = $markers[seq],
				            infoWindow = $infoWindow[seq];

				        if (infoWindow.getMap()) {
				            infoWindow.close();
				        } else {
				            infoWindow.open(naver_map, marker);
				        }
				    }
				} 
			}
		});
	}
	
	// naver_map geolocation을 사용하지 않는 경우
	function naver_func(){
		var bounds, $xgps, $ygps, $markers=[], $infoWindow=[];
		
		if(typeof $userX == "undefined" && typeof $userY == "undefined"){
			$userX = 37.56647;
			$userY = 126.977963;
		} 
		
		var naver_map = new naver.maps.Map('naver_map', {
			center : new naver.maps.LatLng($userX, $userY),
			zoom : 8
		});
		
		var my_marker = new naver.maps.Marker({
			position : new naver.maps.LatLng($userX, $userY),
			map : naver_map
		});
		
		$('#success').on('click', function(){
			bounds = new naver.maps.LatLng($userX, $userY);
			console.log($userX);
			console.log($userY);
			naver_map.panTo(bounds);
			
			var my_marker = new naver.maps.Marker({
				position : new naver.maps.LatLng($userX, $userY),
				map : naver_map
			});
			var contentString = [
				'<div class="iw_inner">',
				' <h3>현재 위치</h3>',
				'</div>'
			].join('');
			
			var infoWindow = new naver.maps.InfoWindow({
		        content: contentString
			});
			
			$('.body-loc').hide();
	    });
		$.ajax({
			url : "${pageContext.request.contextPath}/selectTheater",
			success : function(list){
				 for(var i=0;i<list.length;i++){
					 $xgps = Number(list[i].theaterygps),
					 $ygps = Number(list[i].theaterxgps);
					 var marker = new naver.maps.Marker({
						position : new naver.maps.LatLng($xgps , $ygps),
						map : naver_map
					});
					
					var contentString = [
						'<div class="iw_inner">',
						' <h3>'+list[i].theatername+'</h3>',
						'<p>'+list[i].theateraddress+'</p>',
						'</div>'
					].join('');
					var infoWindow = new naver.maps.InfoWindow({
				        content: contentString
					});
					
					$markers.push(marker);
					$infoWindow.push(infoWindow);
				 }
				
				for (var i=0, ii=$markers.length; i<ii; i++) {
				    naver.maps.Event.addListener($markers[i], 'click', getClickHandler(i));
				} 
				naver.maps.Event.addListener(naver_map, 'idle', function() {
				    updateMarkers(naver_map, $markers);
				});

				function updateMarkers(map, markers) {
				    var mapBounds = map.getBounds();
				    var marker, position;

				    for (var i = 0; i < markers.length; i++) {
				        marker = markers[i]
				        position = marker.getPosition();

				        if (mapBounds.hasLatLng(position)) {
				            showMarker(map, marker);
				        } else {
				            hideMarker(map, marker);
				        }
				    }
				}

				function showMarker(map, marker) {
				    if (marker.setMap()) return;
				    marker.setMap(map);
				}

				function hideMarker(map, marker) {
				    if (!marker.setMap()) return;
				    marker.setMap(null);
				}

				function getClickHandler(seq) {
				    return function(e) {
				        var marker = $markers[seq],
				            infoWindow = $infoWindow[seq];

				        if (infoWindow.getMap()) {
				            infoWindow.close();
				        } else {
				            infoWindow.open(naver_map, marker);
				        }
				    }
				} 
			}
		});
	} 
	
</script>
</html>