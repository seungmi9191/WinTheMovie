<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/include/navi_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/movie/analysis.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/movie/reservepage_style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>reservepage</title>
</head>
<body>
 	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
 	
 	<div id="reserve-wrap" class="wrap">
    <div id="container">
        <div class="search-box" id="">
            <span class="search-window">
                <input class="input-text" id="query" name="query" type="text" title="검색"
                       placeholder="자주가는 영화관 지점을 입력해주세요.">
            </span>

            <button id="search-btn" type="submit" title="검색버튼" tabindex="3" class="sch-btn">
                <i class="fas fa-search "></i>
            </button>

        </div>

        <div class="total-wrap" id="total-wrap">
            <div class="map-container" id="map-container">
                <div class="map-section-wrap" id="map-section-wrap">
                    <div class="map-section" id="map-section">
                        <%--지도 맵 표시--%>
                    </div>
                </div>


            </div>

            <div class="movie-info-wrap" id="movie-info-wrap">
                <a href="">
                    <div class="movie-info" id="movie-info">
                        <%-- 예매 영화 정보--%>
                    </div>
                </a>
                <a href="">
                    <div class="movie-info" id="movie-info">
                        <%-- 예매 영화 정보--%>
                    </div>
                </a>
                <a href="">
                    <div class="movie-info" id="movie-info">
                        <%-- 예매 영화 정보--%>
                    </div>
                </a>
                <a href="">
                    <div class="movie-info" id="movie-info">
                        <%-- 예매 영화 정보--%>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
 		
 	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

</body>
</html>