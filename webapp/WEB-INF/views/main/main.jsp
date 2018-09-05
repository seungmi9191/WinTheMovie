<%@ page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/modal/review_popup.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=85K3LBTERGnPmOpMLKtu&submodules=geocoder"></script>
<script type="text/javascript">
	var $userX, $userY;
</script>
<title>Main Page</title>
</head>
<body>
<div class="banner">
	<img src="${pageContext.request.contextPath}/assets/img/event/banner.jpg">
	<div class="banner_close">
		<img src="${pageContext.request.contextPath}/assets/img/icon/close.png">
	</div>
</div>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

 <!-- main banner start-->
  <div class="g-contents">
    <div class="multi-banner">
      <div class="swiper-slide">	
       <c:forEach items="${theaterList}" var="theaterList" varStatus="status">
        <div id="m_list">
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
		              	
		              	<c:choose>
		              		<c:when test="${len eq 2}">
		              		<c:set var="substringloc" value="${fn:substring(splitloc,0,len) }"></c:set> 
	              			<c:out value="${substringloc}"></c:out>
		              		</c:when>
		              		
		              		<c:otherwise>
		              		<c:set var="substringloc" value="${fn:substring(splitloc,0,len-1) }"></c:set> <!--'구' 삭제위해 index 전체길이-1 -->
	              		<c:out value="${substringloc}"></c:out>
		              		</c:otherwise>
		              	</c:choose>
		             
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
            
            <!--남은시간표시-->
            <div class="limit-time">
              <div class="detail-time">
              <p class="con2">&nbsp;&nbsp;&nbsp;<span class="time" id="nowplayinglist${status.index}"></span></p></div>
            </div>
            <div class="front" id="front${status.index}">
              <div class="front-btn-wrap">
                <div>
                  <a href="" class="btn-reserve" onclick="return false;" id="btn-reserve${status.index}" >예매하기</a>
                </div>
                <div>
                  <a href="" class="btn-view" onclick="return false;" id="btn-view${status.index}" data-playingno="${theaterList.nowplayingno}" data-movieno="${theaterList.movieno}">상세보기</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
       </div>
     </div>
   </div><!--main banner end -->

    <!-- middle banner -->
	<div class="middle-banner">
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
					<c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice">
						<li><a href="" class="tit"> <i>${boxoffice.rank}.</i> 
						<span class="grade" data-movieCd='${boxoffice.movieCd}'><img src="${pageContext.request.contextPath}/assets/img/grade/bg_grade_12.png"></span>
						 <span class="myTit">${boxoffice.movieNm}</span>
						</a> <span class="memRk">예매율<em>${boxoffice.salesShare} %</em></span>
						</li>
					</c:forEach>
				</ol>

				<ol class="officeRk starcontent">
					<c:forEach
						items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}"
						var="boxoffice">
						<li><a href="" class="tit"> <i>${boxoffice.rank}.</i> 
						<span class="grade" data-movieCd='${boxoffice.movieCd}'><img src="${pageContext.request.contextPath}/assets/img/grade/bg_grade_12.png"></span>
						<span class="myTit">${boxoffice.movieNm}</span>
						</a> <span class="memRk">평점 <em>${boxoffice.salesShare} </em></span></li>
					</c:forEach>
				</ol>
			</div>
		</div>
		<div class="map-box" id="naver_map" style="text-align: center;"></div>

		 <div class="recommand-box">
			<div class="plus">
				<span>오늘의 추천 영화</span>
				<a href="${pageContext.request.contextPath}/movie/recommand">+ 더보기</a>
			</div>
			<div class="inner-box">
				<div class="first-movie">
					<div class="inner-poster">
						<img src="${pageContext.request.contextPath}/assets/img/movie_poster/poster_9.jpg" >
					</div>
					<div class="inner-content">
						<div class="m_title">러브,사이먼</div>
						<div class="g_title">[장르]</div>
						<div class="g_con">드라마/로맨스</div>
						<div class="g_title">[배우]</div>
						<div class="g_con">닉 로빈슨, 캐서린 랭퍼드</div>
					</div>
				</div>
				<div class="second-movie">
					<div class="inner-poster">
						<img src="${pageContext.request.contextPath}/assets/img/movie_poster/poser_5.jpg">
					</div>
					<div class="inner-content">
						<div class="m_title">앵커</div>
						<div class="g_title">[장르]</div>
						<div class="g_con">드라마</div>
						<div class="g_title">[배우]</div>
						<div class="g_con">이주영/박수연</div>
					</div>
				</div>
			</div>
		 </div>
	</div>
		
		<div class="middle-banner-sub ">
		<div class="middle-banner-title">
			<h2>
				<span>영화 티켓은 SITE WIN THE MOVIE.</span>
			</h2>
		</div>
		<div class="middle-banner-logo">
			<img src="${pageContext.request.contextPath}/assets/img/event/introduce.jpg" alt="">
		</div> 
	</div>

	<!--footer-notice -->
	<div class="footer-notice">
		<div class="footer-div">
			<div class="footer-notice-title"><i class="fas fa-thumbtack"></i><a href="#" class="text01">&nbsp;공지사항</a></div>
			<ul class="rolling">
				<li><a href="#">[시스템 점검] 9월 정기시스템 안내</a></li>
				<li><a href="#">[이벤트] 1+1의 기회를 잡아라!</a></li>
				<li><a href="#">[기타] WIN THE MOVIE 개인정보처리방침 개정 공지</a></li>
				<li><a href="#">[기타] WIN THE MOVIE 포인트 적립 안내</a></li>
				<li><a href="#">[시스템 점검] SKT휴대폰결제 서비스 점검 안내</a></li>
			</ul>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import> <!-- footer -->
	<c:import url="/WEB-INF/views/modal/movie_detail.jsp"></c:import><!-- detail modal -->
	<c:import url="/WEB-INF/views/modal/review_popup.jsp"></c:import><!-- detail-review modal -->
	<c:import url="/WEB-INF/views/modal/location.jsp"></c:import><!-- location modal -->
</body> 

<!-- script start -->
<script type="text/javascript">
	function rolling(){
		var height = 50, // div 태그 높이를 가져 오면 되는데 약간 높이가 다르게 나와서 이렇게 함 $('footer-notice').height(); << 높이 구하기
			num = $('.rolling li').length,
			max = height * num,
			move = 0;
			
		function noticerolling(){
			move += height;
			$('.rolling').animate({'top':-move}, 600, function(){
				if(move >= max){
					
					$(this).css('top', 0);
					move = 0;
				}
			});
		}
		
		$(".rolling").append($(".rolling li").first().clone());
		setInterval(noticerolling, 4000);
	}
	// Box Office
	$(document).ready(function() {
		$('#header_wrap').css('top', '70px');
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

		rolling();
		reverse_counter();
		check_geolocation();
		
		$(".btn-address").on("click", function(){
			$('.body-loc').toggle();
		});
		$('.popup-close-loc').on('click', function(){
			$('.body-loc').toggle();	   		
	   	});
		
		$('.banner_close').on('click',function(){
			$(".banner").hide();
			$('#header_wrap').css('top', '0');
		});
	});
	
	// slick library
    $('.swiper-slide').slick({
        dots: false,
        infinite: false,
        speed: 500,
        slidesToShow: 5,
        slidesToScroll: 1,
        autoplay: false,
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
			map : naver_map,
			icon :{
				content : '<img src="${pageContext.request.contextPath}/assets/img/logo/loc_etc.png" >',
				anchor : new naver.maps.Point(25,0)
			}
		});
	    
	    $('#success').on('click', function(){
			bounds = new naver.maps.LatLng($userX, $userY);
			naver_map.panTo(bounds);
			
			my_marker = new naver.maps.Marker({
				position : new naver.maps.LatLng($userX, $userY),
				map : naver_map,
				icon :{
					content : '<img src="${pageContext.request.contextPath}/assets/img/logo/loc_etc.png" >',
					anchor : new naver.maps.Point(25,0)
				}
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
					 var $brandno = Number(list[i].brandno),
					 	 logoname, website, logo;
					 
					 if($brandno == 2){
						 logoname = "loc_cgv.png";
						 website = "http://www.cgv.co.kr/";
						 logo = "cgv.png";
					 }else if($brandno == 3){
						 logoname = "loc_lotte.png";
						 website = "http://www.lottecinema.co.kr";
						 logo = "lotte.png";
					 }else if($brandno == 1){
						 logoname = "loc_mega.png";
						 website = "http://www.megabox.co.kr/";
						 logo = "mega.png";
					 }
					 
					 var marker = new naver.maps.Marker({
						position : new naver.maps.LatLng($xgps , $ygps),
						map : naver_map,
						icon : {
							content : '<img src="${pageContext.request.contextPath}/assets/img/logo/'+logoname+'" >',
							anchor : new naver.maps.Point(25,0)
						}
					});
					
					var contentString = [
						'<div style="width:334px; position: absolute; background-color: #fff; padding: 15px 16px 0;" >',
						  '<div style="border-bottom: 2px solid #000000; margin-bottom: 10px;">',
						    '<img src="${pageContext.request.contextPath}/assets/img/logo/'+logo+'" style="margin: -8px 0 0 -60px; position:absolute;width:60px;height:30px;"/>',
						    '<h3 style="padding-left:10px; font-size: 19px; letter-spacing: -1px;margin-bottom:10px; text-align:left;">'+list[i].theatername+'</h3>',
						   '</div>',
						  '<div style="font-size: 12px; text-align:left; height:80px;">',
						    '<div>'+list[i].theateraddress+'</div>',
						    '<div style="margin:0">',
						      '<a href="'+website+'" style="text-decoration:none; color:black;">홈페이지 : '+website+'</a>',
						    '</div>',
						     '<div style="text-align:right; ">',
						    	'<a href="${pageContext.request.contextPath}/movie/reserve?theaterno='+list[i].theaterno+'" style="width:70px;display:inline-block; text-align:center; vertical-align:middle; height:25px; line-height:25px; border:1px solid #000; text-decoration:none; color:black;">예매하기</a>',
						    '</div>', 
						  '</div>',
						  '<div style="text-decoration: none; position: absolute; top: 15px; right: 17px; ">',
						    '<button class="close_btn" style="border: none; backgoround: white; cursor:pointer;"><img style="background-color:white;" src="${pageContext.request.contextPath}/assets/img/icon/x-mark-black.png"/></a>',
						  '</div>',
						'</div>'
					].join('');
					
					var infoWindow = new naver.maps.InfoWindow({
				        content: contentString,
						maxWidth : 334,
				        anchorSize : new naver.maps.Size(20,20)
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
				        
				        $('.close_btn').on('click', function(){
							infoWindow.close();
						});
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
					 var $brandno = Number(list[i].brandno),
					 	 logoname, website, logo;
					 
					 if($brandno == 2){
						 logoname = "loc_cgv.png";
						 website = "http://www.cgv.co.kr/";
						 logo = "cgv.png";
					 }else if($brandno == 3){
						 logoname = "loc_lotte.png";
						 website = "http://www.lottecinema.co.kr";
						 logo = "lotte.png";
					 }else if($brandno == 1){
						 logoname = "loc_mega.png";
						 website = "http://www.megabox.co.kr/";
						 logo = "mega.png";
					 }
					 
					 var marker = new naver.maps.Marker({
						position : new naver.maps.LatLng($xgps , $ygps),
						map : naver_map,
						icon : {
							content : '<img src="${pageContext.request.contextPath}/assets/img/logo/'+logoname+'" >',
							anchor : new naver.maps.Point(25,0)
						}
					});

					var contentString = [
							'<div style="width:334px; position: absolute; background-color: #fff; padding: 15px 16px 0;" >',
							  '<div style="border-bottom: 2px solid #000000; margin-bottom: 10px;">',
							    '<img src="${pageContext.request.contextPath}/assets/img/logo/'+logo+'" style="margin: -8px 0 0 -60px; position:absolute;width:60px;height:30px;"/>',
							    '<h3 style="padding-left:10px; font-size: 19px; letter-spacing: -1px;margin-bottom:10px; text-align:left;">'+list[i].theatername+'</h3>',
							   '</div>',
							  '<div style="font-size: 12px; text-align:left; height:80px;">',
							    '<div>'+list[i].theateraddress+'</div>',
							    '<div style="margin:0">',
							      '<a href="'+website+'" style="text-decoration:none; color:black;">홈페이지 : '+website+'</a>',
							    '</div>',
							    '<div style="text-align:right; ">',
							    	'<a href="${pageContext.request.contextPath}/movie/reserve?theaterno='+list[i].theaterno+'" style="width:70px;display:inline-block; text-align:center; vertical-align:middle; height:25px; line-height:25px; border:1px solid #000; text-decoration:none; color:black;">예매하기</a>',
							    '</div>', 
							  '</div>',
							  '<div style="text-decoration: none; position: absolute; top: 15px; right: 17px; ">',
							    '<button class="close_btn" style="border: none; backgoround: white; cursor:pointer;"><img style="background-color:white;" src="${pageContext.request.contextPath}/assets/img/icon/x-mark-black.png"/></a>',
							  '</div>',
							'</div>'
						].join('');
						
						var infoWindow = new naver.maps.InfoWindow({
					        content: contentString,
							maxWidth : 334,
					        anchorSize : new naver.maps.Size(20,20)
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
				        $('.close_btn').on('click', function(){
							infoWindow.close();
						});
				    }
				}
			}
		});
	} 
	
	//nowplaying timer function
	function reverse_counter(){
		 var list = []; 
			
		 <c:forEach items="${theaterList}" var="theaterList" varStatus="status">
	       list.push("${theaterList.playingtime}"); // jsp data -> input jquery
	     </c:forEach>
	
		 for (var i = 0; i < list.length; i++) {
		       var today = new Date(); //sysdate
			   var d_day = new Date(list[i]); //index time
					  
			   days = (d_day-today)/1000/60/60/24; // 빨간줄 뜨는건 Eclipse error! 
			   daysRound = Math.floor(days);
			   hours = (d_day - today)/1000/60/60-(24*daysRound);
			   hoursRound = Math.floor(hours);
			   minutes = (d_day - today)/1000/60-(24*60*daysRound)-(60*hoursRound);
			   minutesRound = Math.floor(minutes);
			   seconds = (d_day - today)/1000-(24*60*60*daysRound)-(60*60*hoursRound)-(60*minutesRound);
			   secondsRound = Math.round(seconds);
			   sec = " "
			   min = " : "
			   hr = " : "
			   dy = "   "
			   console.log("limit-timer: " + hoursRound + hr + minutesRound + min + secondsRound);

			   // 연산 결과 숫자가 한자리 수가 되면 앞에 0 추가
			   if(hoursRound < 10) hoursRound = "0" + hoursRound;
			   if(minutesRound < 10) minutesRound = "0" + minutesRound;
			   if(secondsRound < 10) secondsRound = "0" + secondsRound;
					  
					 
			   // 연산 결과 분,초가 60이 되면 화면에서 59로 초기화
			   if(minutesRound == 60) minutesRound = 59;
			   if(secondsRound == 60) secondsRound = 59;
					
			
			  // 연산 결과 0:0:0이 됐을 경우
			  if(daysRound < 0) { 
				$('#nowplayinglist'+i).text("예매종료").css("color","#a8a8a8"); 
				$("#btn-reserve"+i).remove("a");
				$("#btn-view"+i).remove ("a");
				$("#front"+i).html("예매 가능한 영화가 아닙니다.");
			  } else {
				$('#nowplayinglist'+i).text("[남은시간]" + dy + hoursRound + hr + minutesRound + min + secondsRound);
			  }
		   }
			    window.setTimeout(reverse_counter, 1000); //second 표시를 위한 timer 설정
    }
	  
    // mouseover function
    $(".poster-box").mouseover(function(){
      $(this).children('.front').addClass('hover');
    });
    $('.poster-box').mouseleave(function(){
      $(this).children('.front').removeClass('hover');
    });

    // detail modal function ajax
	$('.btn-view').on("click",function(){
		
		  var nowNo = $(this).data("playingno");
		  var movieNo = $(this).data("movieno");
		  console.log("영화 : " + movieNo);
		  console.log("현재번호 : " + nowNo);
		  
		  // 상세페이지 기본 정보
		  $.ajax({
			  url : "${pageContext.request.contextPath}/detail/view",
			  type : "post",
			  data : {playingno : nowNo},
			  success : function(result) {
				  
				  console.log(result);
				  var posterHtml = "";
				  
				  // 날짜 계산
				  var timestr = result.playingtime
				  var timestr_s = timestr.split(" ");
				  var week = ['일', '월', '화', '수', '목', '금', '토'];
				  var dayOfWeek = week[new Date(timestr_s[0]).getDay()];
				  
				  posterHtml += "<img src='${pageContext.request.contextPath}/upload/poster/"+result.poster+"' id='m-poster'>";
				  
				  // 브랜드 로고
				  if(result.brandNo==1) {
					  $('#th-info').append("<img src='${pageContext.request.contextPath}/upload/mega_detail.png' class='t-logo' id='t-logo'>");
				  } else if(result.brandNo==2) {
					  $('#th-info').append("<img src='${pageContext.request.contextPath}/upload/cgv_detail.png' class='t-logo' id='t-logo'>");
				  } else if(result.brandNo==3) {
					  $('#th-info').append("<img src='${pageContext.request.contextPath}/upload/lotte_detail.png' class='t-logo' id='t-logo'>");
				  }
				  
				  $('#th-name').text(result.theatername);
				  
				  $('#detail-poster').append(posterHtml);
				
				  // 관람등급
				  if(result.grade == 0) {
					  $('#age').removeClass();
					  $('#age').addClass("age_l age_all");
				  } else if (result.grade == 12) {
					  $('#age').removeClass();
					  $('#age').addClass("age_l age_12");
				  } else if (result.grade == 15) {
					  $('#age').removeClass();
					  $('#age').addClass("age_l age_15");
				  } else if (result.grade == 19) {
					  $('#age').removeClass();
					  $('#age').addClass("age_l age_19");
				  } 
				  
				  $('#title').text(result.koname);
				  $('#enname').text(result.enname);
				  $('#t-address').text(result.theateraddress)
				  
				  $('#m-time').html(timestr_s[0].split("-")[0] + "." + timestr_s[0].split("-")[1] +"." + timestr_s[0].split("-")[2] + " (" + dayOfWeek +") "
						            + "<font color=red>" + timestr_s[1].split(":")[0] + ":" +timestr_s[1].split(":")[1]);
				  $('#th-room').text(result.theatername + " " + result.screen + "관");
				  
				  $('#story').text(result.story);
				  
				  $('#m-director').text(result.directorname);
				  $('#m-actor').text(result.actorname);
				  $('#m-genre').text(result.genre + " / " + result.runtime + "분");
				  
				  $('#btn_steelCut').addClass("active");  
				  $('.stillcut-box').show();
				  $('.btn_play').removeClass("active");
				 
				  // 남은시간
				  var countDownDate = new Date(result.playingtime).getTime();

				  // 1초씩 카운트
				  var x = setInterval(function() {

					    // 오늘날짜
					    var now = new Date().getTime();
					    
					    // 남은시간-오늘날짜
					    var distance = countDownDate - now;
					    
					    // 시,분,초 계산
					    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
					    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
					    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
					    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
					    
					    // 10보다 작으면 앞에 0 붙여줌
					    if(hours < 10) hours = "0" + hours;
					    if(minutes < 10) minutes = "0" + minutes;
					    if(seconds < 10) seconds = "0" + seconds;
					   
					    // 시간종료시 예매종료표시 
					    if (distance < 0) {
					    	clearInterval(x);
					    	$('#time-wrap').text("예매종료");
					    } else {
					    	$('#time-wrap').text(hours + " : " + minutes + " : " + seconds);
					    }
				   }, 1000); 
					
				   // 무한반복 방지 -> x버튼 누를 시 setInterval 초기화
				   $('.popup-close').on("click",function(){
				    	clearInterval(x);
				   });
					 
				   // 스틸컷 토글
				   $(".stillCount").text(result.stillnum);
				   $(".trailerCount").text(result.stillmvnum);
				   $('.stillcut-box-m').hide();
				   
				   $("#btn_steelCut").click(function(event) {
					  $('#btn_steelCut').addClass("active");  
					  $('.stillLi').show();
					  $('.stillcut-box').show();
					  $('#btn_play').removeClass("active"); 
					  $('.stillcut-box-m').hide();
					  event.preventDefault();
				   });
				   
				   //동영상 토글
				   $("#btn_play").click(function(event) {
					   $('#btn_play').addClass("active");  
					   $('.stillcut-box-m').show();
					   $('#btn_steelCut').removeClass("active");
					   $('.stillLi').hide();
					   $('.stillcut-box').hide();
					   event.preventDefault();
				   });
				 	
				   // detail view modal 띄우기
				   $('.modal_body').toggle(400);
				   $('body').css('overflow','hidden');
			       $('body').css('margin-right', (window.innerWidth - $('body').width()) + 'px'); 
			  },
			  error : function(XHR, status, error) {
				   console.error(status + " : " + error);
			  }
	      }); // 상세페이지 기본정보 end
		  
		  // stillcut 불러오기
		  $.ajax({
			  url : "${pageContext.request.contextPath}/detail/stillcut",
			  type : "post",
			  data : {movieno : movieNo},
			  success : function(result_stillcut) {
				  var render_s ="";
				  
				  // stillview render
				  $.each(result_stillcut, function(idx, val) {
					  render_s +=  "<li class='stillLi'>";
					  render_s +=  "<div class='stillDiv'>";
					  render_s +=  "<a href='javascript:void(0);' class=' ' id='stillIdx"+idx+"'>";
					  render_s +=  "<img src=${pageContext.request.contextPath}/upload/stillcut/"+val.stillname+">";
					  render_s +=  "<em></em>";
					  render_s +=  "</div>";
					  render_s +=  "</li>"; 
				  });  
				  
				  $('.stillUl').html(render_s); 
				  
				  // stillcut idx0 기본선택
				  var imgPath = $("#stillIdx"+0).children("img").attr("src");	
				  $("#stillIdx"+0).addClass("on"); 
				  $(".still-img>img").attr({src:imgPath}).hide().fadeIn();
				 
				  // stillcut click event
				  $(".stillLi .stillDiv a").click(function() {
 					    var imgPath = $(this).children("img").attr("src");
				        $(".stillDiv").children("a").removeClass("on");
				        $(this).addClass("on");
				        $(".still-img>img").attr({src:imgPath}).hide().fadeIn();
				  });	
			  },
			  error : function(XHR, status, error) {
				  console.error(status + " : " + error);
		      }  
		  });
		  
		  // movie trailer 불러오기
		  $.ajax({
			  url : "${pageContext.request.contextPath}/detail/stillmovie",
			  type : "post",
			  data : {movieno : movieNo},
			  success : function(result_stillmovie) {
				  var render_m = "";
				 
				  //movie trailer render
			      $.each(result_stillmovie, function(idx, val_m) {
			    	  render_m +=  "<li class='stillLi-m'>";
			    	  render_m +=  "<div class='stillDiv-m'>";
			    	  render_m +=  "<a href='javascript:void(0);' class=' ' id='stillMId"+idx+"'>";
			    	  render_m +=  "<input type='hidden' value='"+val_m.stillmvurl+"'>";
			    	  render_m +=  "<div class='stillDiv-m-play'><i class='far fa-play-circle'></i></div>";
			    	  render_m +=  "<img src=${pageContext.request.contextPath}/upload/stillcut/movie/"+val_m.stillmvimg+">";
			    	  render_m +=  "<em></em>";
			    	  render_m +=  "</div>";
			    	  render_m +=  "</li>"; 
			      });
				  
				  $('.stillUl-m').html(render_m); 
					
				  // movie trailer idx0 기본선택
				  $("#stillMId"+0).addClass("on"); 
				  var moviePath = $(".stillLi-m .stillDiv-m a").children("input").attr("value");
				  $(".still-img-m").children("iframe").attr("src", moviePath);
					 
				  // moive trailer click event
				  $(".stillLi-m .stillDiv-m a").click(function() {
	 				 var moviePath = $(this).children("input").attr("value");
					 $(".stillDiv-m").children("a").removeClass("on");
					 $(this).addClass("on");
					 $(".still-img-m").children("iframe").attr("src", moviePath);
					      
				  });
				  
			  },
			  error : function(XHR, status, error) {
				  console.error(status + " : " + error);
			  }  
		  });
		  
		  // review write modal
		  $('.btn-review').off().on("click",function() {
		     var userEmail = $('#userEamil').val(); 
			 
		     reviewVo =  { movieno : movieNo, userEmail:userEmail, playingno : nowNo };
			
		     // login check
		     <c:if test="${sessionScope.authUser == null}">
			   var logresult = confirm('리뷰평가는 로그인 후 작성하실 수 있습니다. 로그인 페이지로 이동하시겠습니까?');
			   if(logresult) {
			 	  location.href =  '${pageContext.request.contextPath}/user/loginform';
			   } else { 
			      return false;	 
			   }
		     </c:if>	
		  
			  // 실관람객 확인
			  $.ajax({
				  url : "${pageContext.request.contextPath}/detail/reviewpop",
				  type : "post",
				  data : reviewVo,
				  success : function(result_review) { 
					 
					  if(result_review.movieno == movieNo && result_review.reviewnum == 0) {
						  $('.userno').attr("value", result_review.userno);
						  $('.movieno').attr("value", result_review.movieno);
				    	  $('.review-body').show();
						  $('.modal-review-container h2').html("<strong>"+result_review.koname+"</strong>" + " 평가 등록");
	
				      } else if(result_review.reviewnum > 0) {
					      alert("이미 리뷰를 작성하셨습니다.");
				      } else {
					      alert("윈더무비에서 관람하신 영화가 아닙니다.");
				      }
				  },
				  error : function(XHR, status, error) {
					  console.error(status + " : " + error);
				  }  
			  });  
		  
			  // 별점평가
			  var reviewstar; //지역변수해줘야 다른 함수에서도 사용 가능!
			  $('.star i').off().on("click", function() {
		    	  $(this).parent().children('i').removeClass("fas").addClass("far");
		    	  $(this).removeClass("far").addClass("fas").prevAll("i").removeClass("far").addClass("fas"); 
		    	  reviewstar = $(this).data("reviewstar");
	          });
		  
			 // 평가작성
			 $('.btn-apply').off().on("click",function() {
				  var userNo = $(".userno").attr("value");
				  var content = $("#inputText").val();
				  var movieNo = $(".movieno").attr("value");
				  
			  	  if(content == "") {
			  		  alert("평가내용을 입력해주세요!");
			  		  return;
			  	  } else if(reviewstar == null) {
			  		  alert("별점을 평가해주세요!");
			  		  return;
			  	  };
			  	  
			  	  if(content.length > 101){  
			        alert("글자수는 한글100, 영문200자까지 입력가능합니다.");  
			        content= content.substring(0,100);  
			        content.focus();  
			      } 
			  	  
			  	MovieReviewVo = {userno : userNo, content:content, movieno:movieNo, reviewstar:reviewstar};
			  
		        // 평가등록
				$.ajax({
					url : "${pageContext.request.contextPath}/detail/reviewadd",
					type : "post",
					data : MovieReviewVo,
					success : function(movieReview) { 
						 console.log(movieReview);
						 alert("평가가 등록되었습니다.");
						   
						 render(movieReview, "up");
				    		 
						 $('#inputText').val('').attr("placeholder","운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다.");
						 $(".star i").removeClass("fas").addClass("far");
						 $('.review-body').hide();
					},
					error : function(XHR, status, error) {
					     alert("등록에 실패하였습니다.");
						 $('#inputText').val('').attr("placeholder","운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다.");
						 $(".star i").removeClass("fas").addClass("far");
						 $('.review-body').hide();
						 console.error(status + " : " + error);
					}  
				 }); //평가등록 end 
			  }); //평가작성 end
		  }); // review write modal end
		  
		 // review part
		 var user = "${authUser.email}";
		 
		 // review list
	     $.ajax({
	    	 url : "${pageContext.request.contextPath}/detail/reviewlist",
	    	 type : "post",
	    	 data : {movieno : movieNo},
	    	 success : function(revieList) { 
	    		 
	    		 // list 출력
	    		 if (revieList.length > 0) {
	    		     for(var i=0; i<revieList.length; i++) {
	    			    render(revieList[i], "down");
	    		     } 
	    		 
	    		 // 내가 쓴 글이 아닌 경우 스포일러 신고 접수
	    		 $('.item-2block .spolier').off().on("click",function() {
	    		     <c:choose>
	    		        <c:when test="${sessionScope.authUser == null}">
	    		    	    alert("로그인 후  이용가능한 서비스입니다.");
	    		    	</c:when>
	    		    	<c:otherwise>
	    		    	    alert("스포일러 신고가 접수되었습니다.");
	    		    	</c:otherwise>
	    		     </c:choose>
	    		  });
	    		  
	    		 // 내가 쓴 글이 아닌 경우 욕설/비방 신고 접수
	    		 $('.item-2block .dirty').off().on("click",function() {
	    		     <c:choose>
	    		    	<c:when test="${sessionScope.authUser == null}">
	    		    	    alert("로그인 후  이용가능한 서비스입니다.");
	    		    	</c:when>
	    		    	<c:otherwise>
	    		    	    alert("욕설/비방 신고가 접수되었습니다.");
	    		    	</c:otherwise>
	    		     </c:choose>
	    		 }); 
	    		    
	    		 } else if (revieList.length == 0){ 
	    			 $('.item-2block').html(" "); 
	    		 }  	 
	         },
			 error : function(XHR, status, error) {
				  console.error(status + " : " + error);
			 }  
	     }); 
	     
		 // review delete
	     $('.item-2block').off().on("click",".del", function() {
			var reviewno = $(this).data("reviewno");
			var delresult = confirm('삭제하시겠습니까?');
			
			if(delresult) {
			   $.ajax({
				   url : "${pageContext.request.contextPath}/detail/reviewdel",
				   type : "post",
				   data : {reviewno : reviewno},
				   success : function(revieList) { 	
					   if(revieList>0) {
						  $("#"+revieList).remove(); //동일한 listNo 삭제
						  alert("삭제되었습니다.");
						} else {
						  alert("삭제에 실패하였습니다.");
						}
				    },
					error : function(XHR, status, error) {
						  console.error(status + " : " + error);
					}  
			   }); 
			 } else {
				return false;
			 }		
		 });	
		 
		 // render function
		 function render(MovieReviewVo,updown) {
			  var renderR ="";
			  
    		  renderR += "<div class='row' id='"+MovieReviewVo.reviewno+"'>";
    		  renderR += "  <div class='cell'>";
    		  renderR += "    <div class='photo-profile'>";
    		  renderR += "      <div class='dataStarReal'>";
    		  if(MovieReviewVo.reviewstar==1) {
    		  	  renderR += "      <span class='star-2'>";
	    		  renderR += "         <i class='fas fa-star'></i>";
    			  renderR += "         <i class='far fa-star'></i>";
    			  renderR += "         <i class='far fa-star'></i>";
    			  renderR += "         <i class='far fa-star'></i>";
    			  renderR += "         <i class='far fa-star'></i>";
    		  renderR += "          </span><br>";
    		  renderR += "            <span class='starM'>괜히봤어요.</span>";
    		  } else if(MovieReviewVo.reviewstar==2) {
    			  renderR += "      <span class='star-2'>";
	    		  renderR += "         <i class='fas fa-star'></i>";
    			  renderR += "         <i class='fas fa-star'></i>";
    			  renderR += "         <i class='far fa-star'></i>";
    			  renderR += "         <i class='far fa-star'></i>";
    			  renderR += "         <i class='far fa-star'></i>";
    		  renderR += "          </span><br>";
    		  renderR += "            <span class='starM'>그냥그래요.</span>";
    		  } else if(MovieReviewVo.reviewstar==3) {
    			  renderR += "      <span class='star-2'>";
	    		  renderR += "         <i class='fas fa-star'></i>";
    			  renderR += "         <i class='fas fa-star'></i>";
    			  renderR += "         <i class='fas fa-star'></i>";
    			  renderR += "         <i class='far fa-star'></i>";
    			  renderR += "         <i class='far fa-star'></i>";
    		  renderR += "          </span><br>";
    		  renderR += "            <span class='starM'>무난했어요.</span>";
    		  } else if(MovieReviewVo.reviewstar==4) {
    			  renderR += "      <span class='star-2'>";
	    		  renderR += "         <i class='fas fa-star'></i>";
    			  renderR += "         <i class='fas fa-star'></i>";
    			  renderR += "         <i class='fas fa-star'></i>";
    			  renderR += "         <i class='fas fa-star'></i>";
    			  renderR += "         <i class='far fa-star'></i>";
    		  renderR += "          </span><br>";
    		  renderR += "            <span class='starM'>괜찮았어요.</span>";
    		  } else if(MovieReviewVo.reviewstar==5) {
    			  renderR += "      <span class='star-2'>";
	    		  renderR += "         <i class='fas fa-star'></i>";
    			  renderR += "         <i class='fas fa-star'></i>";
    			  renderR += "         <i class='fas fa-star'></i>";
    			  renderR += "         <i class='fas fa-star'></i>";
    			  renderR += "         <i class='fas fa-star'></i>";
    		  renderR += "          </span><br>";
    		  renderR += "            <span class='starM'>최고였어요.</span>";
    		  }
    		  renderR += "     </div>";
    		  renderR += "    </div>";
    		  renderR += "  <div class='text'>";
    		  renderR += "    <p>";
    		  renderR += "       <span class='comment'>"+MovieReviewVo.content+"</span>";
    		  renderR += "    </p>";
    		  renderR += "     <div class='nickname'>";
    		  renderR += "       <span>"+MovieReviewVo.username+"</span>";
    		  renderR += "       <span class='info'> | </span>";
    		  renderR += "       <span>"+MovieReviewVo.addDate+"</span>";
    		  renderR += "     </div>";
    		  renderR += "  </div>";
    		  renderR += "  <div class='buttons'>";
    		  renderR += "    <ul>";
	    		  if(user == MovieReviewVo.email) {
	    			  renderR += " <li><i class='fas fa-minus-circle'></i> 수정하기</li>";
	    			  renderR += " <li class='del' data-reviewno='"+MovieReviewVo.reviewno+"'><i class='fas fa-times-circle'></i> 삭제하기</li>";
	    		  } else if(user != MovieReviewVo.email){
	    			  renderR += " <li class='spolier'><i class='fas fa-exclamation-triangle'></i> 스포일러 신고</li>";
	    			  renderR += " <li class='dirty'><i class='fas fa-exclamation-triangle'></i> 욕설/비방 신고</li>";
	    		  }
    		  renderR += "    </ul>";
    		  renderR += "  </div>";
    		  renderR += " </div>";
    		  renderR += "</div>";
	    		  
    		  if(updown=="up"){
    		    	$(".item-2block").prepend(renderR);
    		  }else if(updown=="down"){
    		    	$(".item-2block").append(renderR);
    		  }else{
    		    	console.log("error!");
    		  }  
    		  
		 } // render function end
   		     
		 // review write modal close 처리
	 	 $('.review-close').on("click",function(){
	 		 $('#inputText').val('').attr("placeholder","운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다.");
	 		 $(".star i").removeClass("fas").addClass("far");
	 		 $('.review-body').hide();
	 	 });	
		 
	  }); // detail modal function end 	 
      
	  // detail modal close function
	  $('.popup-close').on("click",function(){
		  $('#t-logo').remove("img"); // teather logo reset
		  $('#m-poster').remove("img"); // poster reset
		  $('.item-2block').empty(); // review list reset
		  $('.modal_body').toggle(400);
		  $('body').css('overflow','auto');
	  });	
	  
	  $('.review-body').hide();	// 상세페이지 누르기 전 미리 숨김 
</script>
</html>