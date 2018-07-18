<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/movie/analysis.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- Pi 그래프 Script -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<title>Movie Analysis</title>
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

	<div class="analysis-title">
		<div class="title-box">
			<div class="analysis-box">
				<span class="analysis-date">오늘(<span id="today"></span>)의
					영화분석
				</span>
			</div>
			<div>
				<span>현재 상영되는 영화에 대한 다양한 분석을 보여드립니다!</span>
			</div>
		</div>
	</div>
	<div class="analysis-poster">
		<div class="poster" data-movieno="20180522"><img src="${pageContext.request.contextPath}/assets/img/movie_poster/antman_poster.jpg"style="width: 100%;"></div>
		<div class="poster" data-movieno="20185341"><img src="${pageContext.request.contextPath}/assets/img/movie_poster/witch.jpg" style="width: 100%;"></div>
		<div class="poster" data-movieno="20172469"><img src="${pageContext.request.contextPath}/assets/img/movie_poster/herstory.jpg" style="width: 100%;"></div>
		<div class="poster" data-movieno="20183361"><img src="${pageContext.request.contextPath}/assets/img/movie_poster/incredibles.jpg"style="width: 100%;"></div>
		<div class="poster" data-movieno="20181181"><img src="${pageContext.request.contextPath}/assets/img/movie_poster/mission.jpg"style="width: 100%;"></div>
	</div>
	<div class="analysis-partition">
		<hr width="42%" align="right">
		<div>영화 분석</div>
		<hr width="42%" align="left">
	</div>

	<div class="analysis-list">
		<div class="analysis-list-top">
			<div class="analysis-list-box panel-default">
				<div class="panel-heading">오늘 이 영화에 대한 관객수와 매출액은?
					<div style="float:right;"><img src="${pageContext.request.contextPath}/assets/img/icon/questions.png"></div>
				</div>
				<div class="panel-body">
					<div class="body-left">
						<ul>
							<li class="mini-title" id="person"></li>
							<li class="icon-person"></li>
							<li class="person"></li>
							<li class="person-rating"></li>
						</ul>
					</div>
					<div class="body-right">
						<ul>
							<li class="mini-title" id="money"></li>
							<li class="icon-money"></li>
							<li class="sale"></li>
							<li class="salesChange"></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="analysis-list-box panel-default">
				<div class="panel-heading">오늘 이 영화를 본 사람들의 비율은?
					<div style="float:right;"><img src="${pageContext.request.contextPath}/assets/img/icon/questions.png"></div>
				</div>
				<div class="panel-body" id="middle-rating-movie"></div>
			</div>
			<div class="analysis-list-box panel-default">
				<div class="panel-heading">이 영화의 관객 수는?
					<div style="float:right;"><img src="${pageContext.request.contextPath}/assets/img/icon/questions.png"></div>
				</div>
				<div class="panel-body">
					<div class="body-left">
						<ul>
							<li class="mini-title" id="yesterday"></li>
							<li class="icon-yesterday"></li>
							<li class="audiInten"></li>
						</ul>
					</div>
					<div class="body-right">
						<ul>
							<li class="mini-title" id="total"></li>
							<li class="icon-total"></li>
							<li class="audiAcc"></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="analysis-list-middle">
			<div class="analysis-list-middle-box panel-default">
				<div class="panel-heading">다른 사람들이 생각하는 이 영화는?
					<div style="float:right;"><img src="${pageContext.request.contextPath}/assets/img/icon/questions.png"></div>
				</div>
				<div class="panel-body"></div>
			</div>
		</div>
		<div class="analysis-list-bottom">
			<div class="analysis-list-bottom-box panel-default">
				<div class="panel-heading">현재 평점
					<div style="float:right;"><img src="${pageContext.request.contextPath}/assets/img/icon/questions.png"></div>
				</div>
				<div class="panel-body"></div>
			</div>
			<div class="analysis-list-bottom-box panel-default">
				<div class="panel-heading">일일 평점
					<div style="float:right;"><img src="${pageContext.request.contextPath}/assets/img/icon/questions.png"></div>
				</div>
				<div class="panel-body"></div>
			</div>
		</div>
		<div class="analysis-list-bottom-last panel-default">
			<div class="panel-heading ">영화 흥행 예측
				<div style="float:right;"><img src="${pageContext.request.contextPath}/assets/img/icon/questions.png"></div>
			</div>
			<div class="panel-body"></div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

	<!-- 자바스크립트 -->
	<script type="text/javascript">
		$('#today').text(get_today(1));

		function get_today(number) {
			var today = new Date();
			var year = today.getFullYear(), day = today.getDate(), month = today
					.getMonth() + 1;

			if (number == 1) {
				year = year % 1000;
				if (month < 10)
					month = '0' + month;
				if (day < 10)
					day = '0' + day;

				return year + '.' + month + '.' + day;
			} else if (number == 2) {
				day -= 1;
				if (month < 10)
					month = '0' + month;
				if (day < 10)
					day = '0' + day;
				return year + month + day;
			}
		}

		// 자바스크립트로 데이터 받아오기
		function movieinfo(movieno) {
			var key = "f8c8304f59b2c2708e80a56028caf37f", // 영화진흥위원회 API KEY 값
			today = get_today(2), $url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key="
					+ key + "&targetDt=" + today;
			$.ajax({
				url : $url,
				success : function(result) {
					for (var i = 0; i < result['boxOfficeResult']['dailyBoxOfficeList'].length; i++) {
						if (result['boxOfficeResult']['dailyBoxOfficeList'][i]['movieCd'] == movieno) {
							$('.person').text(addComma(result['boxOfficeResult']['dailyBoxOfficeList'][i]['audiCnt']));
							$('.sale').text(addComma(result['boxOfficeResult']['dailyBoxOfficeList'][i]['salesAmt']));
							$('.audiInten').text(addComma(result['boxOfficeResult']['dailyBoxOfficeList'][i]['audiInten']));
							$('.audiAcc').text(addComma(result['boxOfficeResult']['dailyBoxOfficeList'][i]['audiAcc']));
							
							if(result['boxOfficeResult']['dailyBoxOfficeList'][i]['audiChange'].match('-')){
								$('.person-rating').text(result['boxOfficeResult']['dailyBoxOfficeList'][i]['audiChange']+"%").css("color","red");
							}else{
								$('.person-rating').text(result['boxOfficeResult']['dailyBoxOfficeList'][i]['audiChange']+"%").css("color","green");
							}
							if(result['boxOfficeResult']['dailyBoxOfficeList'][i]['salesChange'].match('-')){
								$('.salesChange').text(result['boxOfficeResult']['dailyBoxOfficeList'][i]['salesChange']+"%").css("color","red");
							}else{
								$('.salesChange').text(result['boxOfficeResult']['dailyBoxOfficeList'][i]['salesChange']+"%").css("color","green");
							}
						}
					}
				}
			});
		};
		
		function analysisOnClickEnvent(movieno){
			$('#person').text('관객수');
			$('#money').text('매출액');
			$('#yesterday').text('전일관객');
			$('#total').text('누적관객');
			$('.icon-person').html('<img src="${pageContext.request.contextPath}/assets/img/icon/money.png">');
			$('.icon-money').html('<img src="${pageContext.request.contextPath}/assets/img/icon/money.png">');
			$('.icon-yesterday').html('<img src="${pageContext.request.contextPath}/assets/img/icon/group.png">');
			$('.icon-total').html('<img src="${pageContext.request.contextPath}/assets/img/icon/group.png">');
		}

		// 포스터 클릭 이벤트
		$('.poster').on("click", function() {
			var $movieno = $(this).data('movieno');
			$('.analysis-poster').children('div').removeClass('on');
			$(this).addClass("on");
			movieinfo($movieno);
			analysisOnClickEnvent($movieno);
			chart($movieno);
		});

		// 콤마 찍는 func
		function addComma(num) {
			var regexp = /\B(?=(\d{3})+(?!\d))/g;
			return num.toString().replace(regexp, ',');
		}
		
		function chart(movieno) {
			var $url = "${pageContext.request.contextPath}/movie/bookingrate",
				$bookingrate, $flag, $slice, $movieno, $enabled;
			
			$.ajax({
				url : $url,
				success : function(analysislist) {
					
					var arr = new Array(analysislist.length);
					for(var i=0;i< arr.length;i++){
						arr[i] = new Array(5);
					}
					
					for (var i = 0; i < analysislist.length; i++) {
						$bookingrate = parseInt(analysislist[i]['bookingrate']);
						$movieno = analysislist[i]['movieno'];
						$flag = false;
						$slice = false;
						$enabled = false;
						if(movieno == $movieno){
							$flag = true;
							$slice = true;
							$enabled = true;
						}
						arr[i][0] = $movieno;
						arr[i][1] = $bookingrate;
						arr[i][2] = $flag;
						arr[i][3] = $slice;
						arr[i][4] = $enabled;
					}
					
					highchart(arr);
				}
			});

		}

		function highchart(arr) {
			Highcharts.chart('middle-rating-movie',{
								chart : {
									plotBackgroundColor : null,
									plotBorderWidth : null,
									ployShadow : false,
									type : 'pie',
									width : 400,
									height : 200
								},
								title : {
									text : null
								},
								plotOptions : {
									pie : {
										allowPointSelect : true,
										cursor : 'pointer',
										dataLabels : {
											enabled : false,
											format : '<b>{point.name} : {point.percentage:.1f}%</b> ',
											style : {
												color : (Highcharts.theme && Highcharts.theme.contrastTextxColor)
														|| 'black'
											}
										}
									}
								},
								series : [ {
									name : 'rating',
									colorByPoint : true,
									data : [ {
										name: arr[0][0],
										y : arr[0][1],
										sliced: arr[0][3],
										selected: arr[0][2],
										dataLabels:{
											enabled : arr[0][4]
										}
 									},{
										name: arr[1][0],
										y : arr[1][1],
										sliced: arr[1][3],
										selected: arr[1][2],
										dataLabels:{
											enabled : arr[1][4]
										}
 									},{
										name: arr[2][0],
										y : arr[2][1],
										sliced: arr[2][3],
										selected: arr[2][2],
										dataLabels:{
											enabled : arr[2][4]
										}
 									},{
										name: arr[3][0],
										y : arr[3][1],
										sliced: arr[3][3],
										selected: arr[3][2],
										dataLabels:{
											enabled : arr[3][4]
										}
 									},{
										name: arr[4][0],
										y : arr[4][1],
										sliced: arr[4][3],
										selected: arr[4][2],
										dataLabels:{
											enabled : arr[4][4]
										}
 									},{
										name: arr[5][0],
										y : arr[5][1],
										sliced: arr[5][3],
										selected: arr[5][2],
										dataLabels:{
											enabled : arr[5][4]
										}
 									},{
										name: arr[6][0],
										y : arr[6][1],
										sliced: arr[6][3],
										selected: arr[6][2],
										dataLabels:{
											enabled : arr[6][4]
										}
 									},{
										name: arr[7][0],
										y : arr[7][1],
										sliced: arr[7][3],
										selected: arr[7][2],
										dataLabels:{
											enabled : arr[7][4]
										}
 									},{
										name: arr[8][0],
										y : arr[8][1],
										sliced: arr[8][3],
										selected: arr[8][2],
										dataLabels:{
											enabled : arr[8][4]
										}
 									},{
										name: arr[9][0],
										y : arr[9][1],
										sliced: arr[9][3],
										selected: arr[9][2],
										dataLabels:{
											enabled : arr[9][4]
										}
 									}]
								}]
							});
				}
	</script>
</body>
</html>
