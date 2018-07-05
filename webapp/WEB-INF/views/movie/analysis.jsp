<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
            <span class="analysis-date">오늘(18.06.22)의 영화분석</span>
          </div>
          <div>
            <span>현재 상영되는 영화에 대한 다양한 분석을 보여드립니다!</span>
          </div>
        </div>
    </div>
    <div class="analysis-poster">
      <div class="poster"></div>
      <div class="poster"></div>
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
        <div class="analysis-list-box">
          <div class="box-detail">
            <h4>어제 이 영화에 대한 관객수와 매출액은?</h4>
          </div>
        </div>
        <div class="analysis-list-box"></div>
        <div class="analysis-list-box"></div>
      </div>
      <div class="analysis-list-middle">
        <div class="analysis-list-middle-box"></div>
      </div>
      <div class="analysis-list-bottom">
        <div class="analysis-list-bottom-box"></div>
        <div class="analysis-list-bottom-box"></div>
      </div>
      <div class="analysis-list-bottom-last">
      </div>
    </div>

     <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

  </div>
  </div>
  <script type="text/javascript">
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1;
    var yyy = today.getFullYear();
  </script>
</body>
</html>
