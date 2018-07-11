<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/include/navi_style.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
          integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user/login_style.css">


    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

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
            <form name="f" class="join-form" id="join-form" method="post"
                  action="${pageContext.request.contextPath}/user/login">
                <div class="login_content">
                    <table>
                        <tr>
                            <td>
                                <input name="email" type="text" onblur="return emailForm_check()"
                                       onblur="return emailForm_check()" placeholder="이메일 주소" maxlength="200"
                                       name="email" id="email" required>
                                <p class="email-text"></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input name="userpw" type="password"
                                       style="font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif;letter-spacing: 1px;"
                                       onblur="return pwForm_check()" placeholder="비밀번호" maxlength="20" name="userpw"
                                       id="userpw" required>
                                <p class="pw-text"></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p class="checking">이메일 또는 비밀번호를 확인해주세요.</p>
                            </td>
                        </tr>
                    </table>
                    <div class="login_social">
                        <input class="btn-submit" type="submit" value="로그인">
                        <span class="or-line"> 또는</span>
                    </div>
                </div>
            </form>
        </div>
        <div class="login_sns">
            <div class="login_sns_con">
                <ul>
                    <li>
                        <div id="naver_id_login" style="text-align:center">
                            <img onclick="loginbynaver();" width="223"
                                 src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
                        </div>
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
<
<script type="text/javascript">
    function emailForm_check() {

        var email = document.f.email.value;
        if (email.length < 1) {
            console.log("whats up yo");
            $(".email-text").text("이메일을 입력해주세요.");
            return false;
        } else {
            $(".email-text").text("");
            return false;
        }
    }

    function pwForm_check() {

        var userpw = document.f.userpw.value;
        if (userpw.length < 1) {
            console.log("oops");
            $(".pw-text").text("이메일을 입력해주세요.");
            return false;
        } else {
            $(".pw-text").text("");
            return false;
        }
    }

    // var naver_id_login = new naver_id_login("29ED47vcAOiiJdxtOrrS", "http://localhost:8088/callback");
    // var state = naver_id_login.getUniqState();
    // naver_id_login.setButton("white", 2, 40);
    // naver_id_login.setDomain("http://localhost:8088/user/loginform");
    // naver_id_login.setState(state);
    // naver_id_login.setPopup();
    // naver_id_login.init_naver_id_login();

    function loginbynaver(){
        console.log("loginbynaver222")
        window.open("${pageContext.request.contextPath}/users/naverlogin2", "a", "width=400, height=300, left=100, top=50");
    }

</script>
</html>