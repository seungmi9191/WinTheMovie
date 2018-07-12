<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/include/navi_style.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
          integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user/register_prev_style.css">

    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

    <title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

<div class="register_prev_wrap" align="center">
    <div class="register_prev_box">
        <div class="register_prev_header">
            <h1>
                <p class="logo">회원가입</p>
            </h1>
        </div>
        <div class="registe_prev_container">
            <div class="regist_content">
                <div class="email_reg">
                    <input type="submit" value="이메일로 회원가입" onclick="window.location.href='${pageContext.request.contextPath}/user/join'">
                </div>
                <span class="or-line"> 또는 </span>
            </div>
        </div>
        <div class="registe_prev_sns">
            <div class="registe_prev_sns_con">
                <ul>
                    <li>
                        <a href="#">
                            <img onclick="showPopup();" width="223"
                                 src="${pageContext.request.contextPath}/assets/img/user/naver.png"/>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="${pageContext.request.contextPath}/assets/img/user/kakao.png">
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="${pageContext.request.contextPath}/assets/img/user/facebook.png">
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="${pageContext.request.contextPath}/assets/img/user/google.png">
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
</body>
<script type="text/javascript">
    function showPopup() {
        window.open("${pageContext.request.contextPath}/users/naverlogin", "a", "width=400, height=300, left=100, top=50");
    }
</script>
</html>