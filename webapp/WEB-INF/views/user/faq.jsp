<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/notice/Service_nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/notice/faq_style.css">
<title>자주 묻는 질문</title>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
  <div class="wrap">
    <div class="cs-body">
        <h3 class="page-title">고객센터</h3>
      <ul class="cs-1depth">
      	<li><a href="${pageContext.request.contextPath}/mypage/notice">공지사항</a></li>
		<li class="customer-1depth-on"><a href="${pageContext.request.contextPath}/mypage/faq">자주 묻는 질문 FAQ</a></li>
		<li><a href="${pageContext.request.contextPath}/mypage/contact">1:1 문의하기</a></li>
		<li><a href="${pageContext.request.contextPath}/mypage/agreement">이용약관</a></li>
      </ul>
      <div class="cs-top">
        <p class="cs-top-text">무엇을 도와드릴까요?</p>
        <div class="cs-top-input">
          <input type="text" class="cs-top-input" maxlength="30" placeholder="검색 또는 도움말 카테고리를 선택하세요 (최대30자)">
          <button type="button" class="cs-search-btn">검색</button>
        </div>
        <div class="faq-top">
          <p class="faq-top-tit">자주하는 질문</p>
          <ul class="faq-top-list">
            <li><a href="#1">장소 변경하는 방법</a></li>
            <li><a href="#2">보너스는 무엇인가요?</a></li>
          </ul>
        </div>
      </div>
      <ul class="cs-2depth">
        <li class="cs-2depth-on"><button>전체</button></li>
        <li><button>결제</button></li>
        <li><button>로그인/회원</button></li>
        <li><button>장소선택</button></li>
      </ul>
      <ul class="cs-table">
        <li>
          <button class="cs-tit-wrap"><strong class="cs-type">로그인/회원</strong>
            <span class="cs-tit">아이핀 발급 시 신원 확인 방법에는 어떤 것들이 있나요?</span>
          </button>
          <div class="cs-desc">아이핀 발급을 위해서는 신용정보회사를 통해 본인확인을 해야 합니다. 아이핀 발급기관에서는 아래의 본인확인 수단을 지원하고 있으므로, 이중 편리한 인증수단으로 본인확인을 한 후 아이핀을 발급받으시기 바랍니다.</div>
        </li>
        <li>
          <button class="cs-tit-wrap"><strong class="cs-type">로그인/회원</strong>
            <span class="cs-tit">로그인이 안 되요</span>
          </button>
          <div class="cs-desc">POOQ은 N-screen 플랫폼서비스로 다양한 단말에서 이어보기로 이용이 가능하며 PC 웹, 앱, 스마트티비 등 로그인은 중복으로 가능합니다.
            <br>단, 2016년 2월 1일 부터 서비스 이용약관에 의거 아이디 제3자 이용 및 도용을 방지하고자 동시시청이 차단 되었습니다. (1계정당 동시에 1대의 기기만 시청 가능)
            <br>멀티 디바이스를 사용하시거나, 하나의 계정을 가족과 공유하여 사용하고자 하는 분들은 2회선, 혹은 3회선 동시접속 상품을 이용해주시기 바랍니다.
          </div>
        </li>
      </ul>
    </div>
  </div>
  <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
</body>
<script type="text/javascript">
  $(document).ready(function(){
    $(".cs-tit-wrap").click(function(){
      if($(this).next(".cs-desc").is(":visible")){
        $(this).next(".cs-desc").slideUp("fast");
      } else{
        $(this).next(".cs-desc").slideToggle("fast");
      }
    });
  });
</script>
</html>
