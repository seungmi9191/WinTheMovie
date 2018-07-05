<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/include/navi_style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user/register_style.css">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

<div class="register_wrap" align="center">
    <div class="register_box">
        <div class="register_header">
            <h1>
                <p class="logo">회원가입</p>
            </h1>
        </div>
        <div class="register_container">
            <div class="register_content">
                <table>
                    <tr>
                        <td>
                            <input type="text" placeholder="이메일 주소" maxlength="200" name="" id="" required>
                            <p class="email-text">아이디는 10~15자의 영문/숫자를 조합하여 입력하세요.</p>
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
                            <input type="text" placeholder="비밀번호 확인" maxlength="20" name="" id="" required>
                            <p class="pw-check-text">비밀번호를 확인하세요.</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" placeholder="이름" maxlength="20" name="" id="" required>
                            <p class="user-name-text">이름은 한글 10자 이내, 영문 30자 이내 가능</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           <input type="checkbox" class="regist-agree" id="agree" name="" value="1" required>
                            <label for="agree">
                                서비스 이용약관에 동의합니다.
                            </label>
                        </td>
                    </tr>

                </table>
                <div class="register_submit">
                    <input type="submit" value="회원가입">
                </div>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
</body>
</html>