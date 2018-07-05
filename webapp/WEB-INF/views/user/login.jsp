<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/include/navi_style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user/login_style.css">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<div class="login-wrap" align="center">
    <div class="login-box">
        <div class="login_header">
            <h1>
                <p class="logo">로그인</p>
            </h1>
        </div>
        <div class="login_container">
            <div class="login_content">
                <table>
                    <tr>
                        <td>
                            <input type="text" placeholder="이메일 주소" maxlength="200" name="" id="" required>
                            <p class="email-text">이메일을 입력해주세요</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" placeholder="비밀번호" maxlength="20" name="" id="" required>
                            <p class="pw-text">비밀번호를 입력해주세요.</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="checking">이메일 또는 비밀번호를 확인해주세요.</p>
                        </td>
                    </tr>
                </table>
                <div class="login_social">
                    <input type="submit" value="로그인">
                    <span class="or-line"> 또는</span>
                </div>
            </div>
        </div>
        <div class="login_sns">
            <div class="login_sns_con">
              <ul>
                  <li>
                      <a href="">
                          <img src="${pageContext.request.contextPath}/assets/img/user/naver.png">
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
</html>