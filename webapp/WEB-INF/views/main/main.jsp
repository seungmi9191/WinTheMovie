<%@ page
	import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>Main Page</title>
</head>

<body>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	
	<!-- main banner -->
  <div class="g-contents">
    <div class="multi-banner">
      <div class="swiper-slide">
       <c:forEach items="${theaterList}" var="theaterList" varStatus="status">
        <div id="m_list{status.index}">
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
              <p class="con2">[남은시간]&nbsp;&nbsp;&nbsp<span class="time" id="nowplayinglist${status.index}"></span></p></div>
            </div>
            <div class="front">
              <div class="front-btn-wrap">
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
        </c:forEach>
       </div>
     </div>
   </div>
 
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
			<li><a href="../user/notice_list.html" class="text02">안드로이드
					태블릿 가로보드 지원 안내</a></li>
		</ul>
	</div>
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<div class="detail"></div>
	<%-- <c:import url="/WEB-INF/views/modal/movie_detail.jsp"></c:import> --%>

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
		
		naver_func();
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


	  // modal function
	  $('.btn-view').on("click",function(){
	      /* $('.modal_body').toggle(400);
	      $('body').css('overflow','hidden');
		  $('body').css('margin-right', (window.innerWidth - $('body').width()) + 'px'); */
		  console.log("확인");
		  detailrender();
	  });	 
		 
		 
	  $('.popup-close').on("click",function(){
		  $('.modal_body').toggle(400);
		  $('body').css('overflow','auto');
	  });	 
		
      // naver_map
      var naver_map = new naver.maps.Map('naver_map', {
    	  center: new naver.maps.LatLng(37.3595704, 127.105399),
    	    zoom: 10
      });
      var marker = new naver.maps.Marker({
    	    position: new naver.maps.LatLng(37.3595704, 127.105399),
    	    map: naver_map
      });
		$('.body').toggle();
	});
	
	$('.btn-address').on("click", function(){
		$('.body-loc').toggle();
	})
	// naver_map
	function naver_func(){
		var $xgps, $ygps, $myxgps, $myygps,
			$markers=[], $infoWindow=[];
		
		$myxgps = $('.setx').val();
		$myygps = $('.sety').val();
		
		console.log($myxgps);
		console.log($myygps);
		/* if( $myxgps && $myygps == null){
			$myxgps = 
			$myygps
		} */
		var naver_map = new naver.maps.Map('naver_map', {
			center : new naver.maps.LatLng(37.3595704, 127.105399),
			zoom : 10
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

	  var infowindow = new naver.maps.InfoWindow({
	      content: contentString
	  });
	
	  naver.maps.Event.addListener(marker, "click", function(e) {
	      if (infowindow.getMap()) {
	          infowindow.close();
	      } else {
	          infowindow.open(naver_map, marker);
	      }
	  });
	  
	  //nowplaying timer
	  function reverse_counter(){
		var list = [];
		  
		  <c:forEach items="${theaterList}" var="theaterList" varStatus="status">
		  		list.push("${theaterList.playingtime}");
		  		console.log("${status.index}" + "-"+ "${theaterList.playingtime}"); 
		  </c:forEach>

		  for (var i = 0; i < list.length; i++) {
			    console.log("js_push:" + list[i]); 
			    /*   var today = new Date();*/
			    var today = new Date();
				var d_day = new Date(list[i]);
				console.log("jstl_list:" + d_day); 
				console.log("sysdate:" + today); 
				  
				  days = (d_day - today) / 1000 / 60 / 60 / 24;
				  daysRound = Math.floor(days);
				  hours = (d_day - today) / 1000 / 60 / 60 - (24 * daysRound);
				  hoursRound = Math.floor(hours);
				  minutes = (d_day - today) / 1000 /60 - (24 * 60 * daysRound) - (60 * hoursRound);
				  minutesRound = Math.floor(minutes);
				  seconds = (d_day - today) / 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound);
				  secondsRound = Math.round(seconds);
				  sec = " "
				  min = " : "
				  hr = " : "
				  dy = " "
				  console.log("남은시간:" + hoursRound + hr + minutesRound + min + secondsRound);
				  
				  /*hh:mm:ss 형태를 유지하기위해 한자리 수 일때는 0 추가*/
				  if(hoursRound < 10) hoursRound = "0" + hoursRound;
				  if(minutesRound < 10) minutesRound = "0" + minutesRound;
				  if(secondsRound < 10) secondsRound = "0" + secondsRound;
				  
				 
				  /*분,초가 60일 때 59로 초기화*/
				  if(minutesRound == 60) minutesRound = 59;
				  if(secondsRound == 60) secondsRound = 59;
				  /*리스트 출력*/
				
		 		
				 $('#nowplayinglist'+i).text(hoursRound + hr + minutesRound + min + secondsRound);
				 
				  /*후에 처리하기*/
				 if(hoursRound==0 && minutesRound==0 && secondsRound==0) {
					alert("??");
					$('#nowplayinglist'+i).html("오잉");
				 }  
				
				 }
		  			newtime = window.setTimeout("reverse_counter();", 1000); 
		  }
	  
	  
	 /*상세페이지 그리기*/
	 function detailrender() {
		 var str = "";
		 str += "<div class='modal_body'>";
		 str += "   <div class='modal-mask' id='movie-detail'>";
		 str += "      <div class='modal-wrapper'>";
		 str += "         <div class='modal-time clearfix'>";
		 str += "			<div id='movieDetailTime'>";
		 str += "				<div class='popup-box-top row1 clearfix'>";
		 str += "				   <div class='center-wrap'>";
		 /* str += "					 <img src='"+${pageContext.request.contextPath}/assets/img/logo/cgv.png+"' class='t-logo'>"; */
		 str += "					 <span class='time-name'>";
		 str += "		           </div>";
		 str += "		             <span class='time-title'>";
		 str += "		             <div class='time-wrap'></div>";
		 str += "	            </div>";
		 str += "            </div>";
		 str += "          </div>";
		 str += "     <div class='modal-container clearfix'>";
		 str += "        <div id='movieDetail'>";
		 str += "          <div class='popup-box row1 clearfix'>";
		 str += "          <div class='left-wrap'>";
		 /* str += "             <img src='"+${pageContext.request.contextPath}/assets/img/movie_poster/ocean.jpg+"' alt=''>"; */
		 str += "          </div>";
		 str += "  <div class='right-wrap'>";
		 str += "	  <div class='text'>";
		 str += "		 <div class='title clearfix'>";
		 str += "		   <h2>";
		 str += "			  <i class='age_l age_12'></i>";
		 str += "		      <span></span>";
		 str += "          </h2>";
		 str += "          <p></p>";	
		 str += "        </div>";
		 str += "     <div class='reservation-wrap'>";
		 str += "        <p class='left-p'>";
		 str += "            <span></span>";
		 str += "            <strong class='strong-big'></strong>";
		 str += "            <span class='span-basic'></span>";
		 str += "            <span class='span-basic'></span>";
		 str += "            <span class='span-sl'> &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp; </span>";
		 str += "        </p>";
		 str += "        <p class='right-p'>";
		 str += "            <span></span>";
		 str += "            <span class='small_star'></i>";
		 str += "              <i class='fas fa-star'></i>";
		 str += "              <i class='fas fa-star'></i>";
		 str += "              <i class='fas fa-star'></i>";
		 str += "              <i class='fas fa-star'></i>";
		 str += "              <i class='far fa-star'></i>";
		 str += "            </span>";
		 str += "            <strong class='strong-big'></strong>";
		 str += "        </p>";
		 str += "     </div>";
		 str += "     </div>";
		 str += "  </div>";
		 
		/*  $(".detail").html(str); */
	    document.getElementBy
		 console.log("html 그림");
	 }
	 
	  
</script>
</html>