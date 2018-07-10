<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/include/navi_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/movie/analysis.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
		<div class="poster" data-movieno="20185341"></div>
		<div class="poster" data-movieno="20180522"></div>
		<div class="poster"></div>
		<div class="poster"></div>
		<div class="poster"></div>
	</div>
	<div class="analysis-partition">
		<hr width="42%" align="right">
		<div>영화 분석</div>
		<hr width="42%" align="left">
	</div>

	<div class="analysis-list">
		<div class="analysis-list-top">
			<div class="analysis-list-box panel-default">
				<div class="panel-heading" style="width:92%;">오늘 이 영화에 대한 관객수와 매출액은?</div>
				<div class="panel-body" style="width:92%;">
					<div class="body-left">
						<em class="mini-title">관객수</em><br>
						<p class="person"></p>
						<p class="person-rating"></p>
					</div>
					<div class="body-right">
						<em class="mini-title">매출액</em><br>
						<p class="sale"></p>
						<p class="salesChange"></p>
					</div>
				</div>
			</div>
			<div class="analysis-list-box panel-default">
				<div class="panel-heading" style="width:92%;">오늘 이 영화를 본 사람들의 비율은?</div>
				<div class="panel-body" style="width:92%;">
					<div></div>
					<p class="salesShare"></p>
				</div>
			</div>
			<div class="analysis-list-box panel-default">
				<div class="panel-heading" style="width:92%;">이 영화의 관객 수는?</div>
				<div class="panel-body" style="width:92%;">
					<div class="body-left">
						<em class="mini-title">전일관객</em><br>
						<img>
						<em>3,444</em>
					</div>
					<div class="body-right">
						<em class="mini-title">누적관객</em><br>
						<img>
						<em>3,444</em>
					</div>
				</div>
			</div>
		</div>
		<div class="analysis-list-middle">
			<div class="analysis-list-middle-box panel-default">
				<div class="panel-heading">다른 사람들이 생각하는 이 영화는?</div>
				<div class="panel-body">
				11
				</div>
			</div>
		</div>
		<div class="analysis-list-bottom">
			<div class="analysis-list-bottom-box panel-default">
				<div class="panel-heading">현재 평점</div>
				<div class="panel-body">
				11
				</div>
			</div>
			<div class="analysis-list-bottom-box panel-default">
				<div class="panel-heading">일일 평점</div>
				<div class="panel-body">
				11
				</div>
			</div>
		</div>
		<div class="analysis-list-bottom-last panel-default">
			<div class="panel-heading ">영화 흥행 예측</div>
			<div class="panel-body">
			11
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

<!-- 자바스크립트 -->
<script type="text/javascript">
		$('#today').text(get_today(1));
		
		function get_today(number) {
			var today = new Date();
			var year = today.getFullYear(), 
				day = today.getDate(), 
				month = today.getMonth() + 1;
			
			if(number == 1){
				year = year % 1000;
				if (month < 10)
					month = '0' + month;
				if (day < 10)
					day = '0' + day;

				return year + '.' + month + '.' + day;
			}else if(number == 2){
				day -= 1;
				if (month < 10)
					month = '0' + month;
				if (day < 10)
					day = '0' + day;
				return year+month+day;
			}
		}
		
		// 자바스크립트로 데이터 받아오기
		function movieinfo(movieno){
			var key = "f8c8304f59b2c2708e80a56028caf37f", // 영화진흥위원회 API KEY 값
				today = get_today(2),
				$url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key="+key+"&targetDt="+today;
			$.ajax({
				url : $url,
				success: function(result){
					console.log(movieno);
					for (var i=0;i<result['boxOfficeResult']['dailyBoxOfficeList'].length;i++){
						if(result['boxOfficeResult']['dailyBoxOfficeList'][i]['movieCd'] == movieno){
							$('.person').text(result['boxOfficeResult']['dailyBoxOfficeList'][i]['audiCnt']);
							$('.person-rating').text(result['boxOfficeResult']['dailyBoxOfficeList'][i]['audiChange']);
							$('.sale').text(result['boxOfficeResult']['dailyBoxOfficeList'][i]['salesAmt']);
							$('.salesChange').text(result['boxOfficeResult']['dailyBoxOfficeList'][i]['salesChange']);
						}
					}
				}
			});
		};
		
		$('.poster').on("click", function(){
			var $movieno = $(this).data('movieno');
			movieinfo($movieno);
		});
		
</script>	
</body>
</html>
