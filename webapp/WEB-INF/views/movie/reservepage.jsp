<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/movie/reserve_page_style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=85K3LBTERGnPmOpMLKtu&submodules=geocoder"></script>
<title>ReservePage</title>
</head>
<body onload="address_arr(this.form);">
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

	<div id="reserve-wrap" class="wrap">
		<div id="container">
			<div class="search-box" id="">
				<select id='si' name="si">
						<option value="0">선택</option>
						<option value="1">서울특별시</option>
						<option value="2">부산광역시</option>
						<option value="3">대구광역시</option>
						<option value="4">인천광역시</option>
						<option value="5">광주광역시</option>
						<option value="6">대전광역시</option>
						<option value="7">울산광역시</option>
						<option value="8">세종시</option>
						<option value="9">경기도</option>
						<option value="10">강원도</option>
						<option value="11">충청북도</option>
						<option value="12">충청남도</option>
						<option value="13">전라북도</option>
						<option value="14">전라남도</option>
						<option value="15">경상북도</option>
						<option value="16">경상남도</option>
						<option value="17">제주도</option>	
					</select>
					<select id='gu' name="gu">
						<option value="0">선택</option>
					</select>
					<span class="search-window">
						<input class="input-text" id="search" name="search" type="text" title="검색" placeholder="자주가는 영화관 지점을 입력해주세요. ex) CGV 강남">
					</span>
					<button id="search-btn" type="button" title="검색버튼" tabindex="3" class="sch-btn">
						<i class="fas fa-search "></i>
					</button>
			</div>

			<div class="total-wrap" id="total-wrap">
				<div class="map-container" id="map-container">
					<div class="map-section-wrap" id="map-section-wrap">
						<div class="map-section" id="naver_map"></div>
					</div>
				</div>
				<div class="movie-info-wrap" id="movie-info-wrap">
					<a href="">
						<div class="movie-info" id="movie-info">
						</div>
					</a> <a href="">
						<div class="movie-info" id="movie-info">
						</div>
					</a> <a href="">
						<div class="movie-info" id="movie-info">
						</div>
					</a> <a href="">
						<div class="movie-info" id="movie-info">
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

	<script type="text/javascript">
	reserve_map();
	function reserve_map(){
		var bounds, $xgps, $ygps, $markers=[], $infoWindow=[];
		
		if(typeof $userX == "undefined" && typeof $userY == "undefined"){
			$userX = 37.56647;
			$userY = 126.977963;
		} 
		var naver_map = new naver.maps.Map('naver_map', {
			center : new naver.maps.LatLng($userX, $userY),
			zoom : 8
		});
		$('.sch-btn').on('click', function(){
			var search = $('[name=search]').val();
			console.log(search);
			
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
			
			$.ajax({
				url : "${pageContext.request.contextPath}/movie/search",
				data : {search : search},
				success : function(list){
					if(list.length == 0){
						alert("해당 지역에 영화관이 없습니다. 다시 검색해 주시기 바랍니다.");
					}else{
						 for(var i=0;i<list.length;i++){
							 $xgps = Number(list[i].theaterygps),
							 $ygps = Number(list[i].theaterxgps);
							 
							 if(i == 0){
								var bounds = new naver.maps.LatLng($xgps, $ygps);
								naver_map.panTo(bounds);
							 }
							 
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
					}
				}
			});
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
			naver.maps.Event.addListener(naver_map, 'idle', function(){
			    updateMarkers(naver_map, $markers);
			});
	    });
	} 
	
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
	
	function address_arr(f){
		var address_gu = new Array();
		address_gu[1] = new Array('선택','종로구', '중구', '용산구', '성동구','광진구', '동대문구', '중랑구', '성북구', '중랑구', '성북구', '강북구', 
				'도봉구', '노원구', '은평구', '서대문구', '마포구', '양천구', '강서구', '구로구', '금천구', '영등포구', '동작구', '관악구', '서초구',
				'강남구', '송파구', '강동구', '기장군');
		address_gu[2] = new Array('선택','중구','서구','동구', '영동구', '부산진구', '동래구', '남구', '북구', '강서구', '해운대구', '사하구', '금정구', '연제구', '수영구', '사상구');
		address_gu[3] = new Array('선택','중구', '동구', '서구', '남구', '북구', '수성구', '달서구', '달성군');
		address_gu[4] = new Array('선택','중구', '동구', '미추홀구', '연수구', '남동구', '부평구', '계양구', '서구', '강화군', '옹진군');
		address_gu[5] = new Array('선택','동구', '서구', '남구', '북구', '광산구');
		address_gu[6] = new Array('선택','동구', '서구', '서구', '유성구', '대덕구');
		address_gu[7] = new Array('선택','중구', '남구', '동구', '북구', '울주군');
		address_gu[8] = new Array('선택','수원시', '성남시', '안양시', '용인시', '광명시', '평택시', '과천시', '오산시', '시흥시', '군포시', '의왕시', '하남시', '이천시', '안성시', '김포시',
				'화성시', '광주시', '여주시', '부천시','양평군');
		address_gu[9] = new Array('선택','고양시', '의정부시', '동두천시', '구리시', '남약주시', '파주시', '양주시', '포천시', '연천군', '가평군');
		address_gu[10] = new Array('선택','춘천시', '원주시', '강릉시', '동해시', '태백시', '속초시', '삼척시', '홍천군','횡성군', '영월군','평창군', '정성군', '철원군','화천군','양구군',
				'인제군', '고성군','양양군');
		address_gu[11] = new Array('선택','청주시','충주시','제천시', '보은군','옥천군', '영동군', '진천군','괴산군','음성군','단양군', '증평군');
		address_gu[12] = new Array('선택','천안시','공주시', '보령시', '아산시', '서산시', '논산시', '계룡시','당진시','금산군','부여군','서천군','청양군','흥성군','예산군','테안군');
		address_gu[13] = new Array('선택','전주시','군산시','익산시','정읍시','남원시','김제시','완주군','진안군','무주군','장수군','임실군','순창군','고창군','부안군');
		address_gu[14] = new Array('선택','목포시','여수시','순천시','나주시','광양시','담양군','곡성군','구례군','고흥군','보성군','화순군','장흥군','강진군','해남군','영암군','무안군',
				'함평군','영광군','장성군','완도군','진도군','신안군');
		address_gu[15] = new Array('선택','포항시','경주시','김천시','구미시','안동시','영주시','영천시','상주시','문경시','경산시', '군위군','의성군','영양군','영덕군','청도군',
				'고령군','성주군','칠곡군','예천군','봉화군','울진군','울릉군');
		address_gu[16] = new Array('선택','창원시','진주시','통영시','사천시','김해시','밀양시','거제시','양산시','의령군','함안군','창녕군','고성군','남해군','하동군','산청군',
				'함양군','거창군','합천군');
		address_gu[17] = new Array('선택','제주시','서귀포시');
		
		var address_si = $('select[name=si]').val();
		var cur_si, cur_gu, si;
		
		$('[name=si]').on('change',function(){
			var value = $(this).val();
			cur_si = $('[name=si] option:selected').text();
			si = cur_si;
			if(cur_si == "선택"){
				$('.input-text').val("");
			}else{
				$('.input-text').val(cur_si);
			}
			$('select[name=gu]').empty();
			for(var i=0;i<address_gu[value].length;i++){
				var option = $('<option value="'+address_gu[value][i]+'">'+address_gu[value][i]+'</option>');
				$('[name=gu]').append(option);
			}
			$('[name=gu]').on('change',function(){
				cur_gu = $(this).val();
				if(cur_gu == "선택"){
					$('.input-text').val(cur_si);
				} else{
					$('.input-text').val(cur_si+" "+cur_gu);
				}
			});
		});
	}
	</script>
</body>
</html>