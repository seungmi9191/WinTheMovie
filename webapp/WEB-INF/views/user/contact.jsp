<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/notice/contact_style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/notice/Service_nav.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<head>
<title>1:1문의하기</title>
</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<div class="top-padding">
		<div class="cs-body" >
			<h3 class="page-title">고객센터</h3>
			<ul class="cs-1depth">
				<li><a href="${pageContext.request.contextPath}/mypage/notice">공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/faq">자주
						묻는 질문 FAQ</a></li>
				<li class="customer-1depth-on"><a
					href="${pageContext.request.contextPath}/mypage/contact">1:1
						문의하기</a></li>
				<li><a
					href="${pageContext.request.contextPath}/mypage/agreement">이용약관</a></li>
			</ul>
		</div>
		<div class="qa-top">
			<h4>1:1 문의하기</h4>
			<p class="qa-ment">서비스 사용시 불편사항이나 문의사항을 보내주시면 신속하게 고쳐드립니다</p>
			<p class="es-text">
				<span class="es-dot"> </span> "항목은 필수 입력 항목입니다"
			</p>
		</div>
		<form action="" id="myFrm" method="post" name="myFrm">
			<div class="qa-table-wrap">

				<table class="qa-table">
					<caption class="blind">1:1문의하기 테이블입니다.</caption>
					<colgroup>
						<col width="280">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><span class="es-dot"></span> 이름</th>
							<td><input type="text" placeholder="이름을 입력해 주세요"
								maxlength="50" name="name" id="name" required></td>
						</tr>
						<tr>
							<th scope="row"><span class="es-dot"></span> 이메일 주소</th>
							<td><input type="text" placeholder="이메일을 입력해 주세요"
								maxlength="200" name="email" id="email" required>
								<p class="qa-table-text">위 이메일로 답변을 드리기 때문에 정확히 입력해 주시길
									바랍니다.</p></td>
						</tr>
						<tr>
							<th scope="row"><span class="es-dot"></span> 연락처</th>
							<td><input type="text" placeholder="연락처를 입력해 주세요" maxlength="13" name="phone" id="phone" required></td>
						</tr>
						<tr>
							<th scope="row"><span class="es-dot"></span> 문의하기</th>
							<td><input type="text" placeholder="문의 제목을 입력해주세요" class="wi100-per" id="title" name="title" maxlength="100" required> 
								<textarea placeholder="문의 내용을 입력해 주세요."class="qa-table-textarea03" id="question" name="question"required></textarea></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="qa-btn-wrap">
				<ul>
					<li><a href="${pageContext.request.contextPath}/mypage/contact" onclick="o" class="qa-cancel">취소</a></li>
					<li><input type="submit" class="qa-submit" onclick="" value="등록"></li>
				</ul>
			</div>
		</form>
	</div>
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
</body>
</html>
