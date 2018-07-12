<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/notice/notice_list_style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/notice/Service_nav.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>공지사항</title>
</head>
<body style="margin:0;">
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<div class="wrap" >
		<div class="cs-body">
			<h3 class="page-title">고객센터</h3>
			<ul class="cs-1depth">
				<li class="customer-1depth-on"><a href="${pageContext.request.contextPath}/mypage/notice">공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/faq">자주 묻는 질문 FAQ</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/contact">1:1 문의하기</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/agreement">이용약관</a></li>
			</ul>
			<ul class="cs-2depth">
				<li><button type="button" name="button">서비스 공지</button></li>
			</ul>
			<div class="cs-table02-wrap">
				<div class="noti-search">
					<input type="text" placeholder="궁금하신 점을 입력하세요"></input>
					<button class="noti-search-btn">검색</button>
				</div>
				<table class="cs-table-02">
					<caption>공지사항 리스트</caption>
					<colgroup>
						<col width="*">
						<col width="139px">
					</colgroup>
					<thead>
						<tr>
							<th>제목</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<tr class="noti-top">
							<td>벅스 제휴 이용권 서비스 일시중단 안내</td>
							<td><p class="noti-date">2018-06-20</p></td>
						</tr>
						<tr>
							<td>아이패드 가로모드 지원 업데이트</td>
							<td><p class="noti-date">2018-05-18</p></td>
						</tr>
						<tr>
							<td>아이패드 가로모드 지원 업데이트</td>
							<td><p class="noti-date">2018-05-18</p></td>
						</tr>
						<tr>
							<td>아이패드 가로모드 지원 업데이트</td>
							<td><p class="noti-date">2018-05-18</p></td>
						</tr>
						<tr>
							<td>아이패드 가로모드 지원 업데이트</td>
							<td><p class="noti-date">2018-05-18</p></td>
						</tr>
						<tr>
							<td>아이패드 가로모드 지원 업데이트</td>
							<td><p class="noti-date">2018-05-18</p></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
</body>
</html>
