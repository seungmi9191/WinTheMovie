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
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <%--kakao --%>

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
            <%--<form name="f" class="join-form" id="join-form" method="post"--%>
            <%--action="${pageContext.request.contextPath}/user/login">--%>

            <div name = "f" class="login_content">
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
                            <p class="checking"></p>
                        </td>
                    </tr>
                </table>
                <div class="login_social">
                    <input class="btn-submit" type="submit" onclick="emailpwcheck()" value="로그인">
                    <span class="or-line"> 또는</span>
                </div>
            </div>

        </div>
        <div class="login_sns">
            <div class="login_sns_con">
                <ul>
                    <li><a href="#">
                        <img onclick="loginbynaver();" width="223"
                             src="${pageContext.request.contextPath}/assets/img/user/naver.png"/>
                    </a>

                    </li>
                    <li>
                        <a id="kakao-login-btn" href="javascript:loginWithKakao()">
                            <img src="${pageContext.request.contextPath}/assets/img/user/kakao.png"/>
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

        var email = $("[name=email]").val();
        if (email.length < 1) {
            $(".email-text").text("이메일을 입력해주세요.");
            return false;
        } else {
            $(".email-text").text("");
            return false;
        }
    }

    function pwForm_check() {

        var userpw = $("[name=userpw]").val();
        if (userpw.length < 1) {
            $(".pw-text").text("비밀번호를 입력해주세요.");
            return false;
        } else {
            $(".pw-text").text("");
            return false;
        }
    }

    function emailpwcheck() {

        var email = $("[name=email]").val();
        var userpw = $("[name=userpw]").val();

        $.ajax({
            url: "${pageContext.request.contextPath}/user/login",
            type: "post",
            data: {email: email, userpw: userpw},
            dataType: "json",
            success: function (result) {
                if (result == true) {
                    alert("반갑습니다.")
                    location.href = "${pageContext.request.contextPath}/main";
                    return false;
                } else if (result == false) {
                    $(".checking").text("이메일 또는 비밀번호를 확인해주세요.");
                    return false;
                }
            }, error: function (XHR, status, error) {
                console.error(status + " 123: " + error)
            }
        })
    }

    function loginbynaver() {
        window.open("${pageContext.request.contextPath}/users/naverlogin", "a", "width=400, height=300, left=100, top=50");

    }

    <%-- kakao login Start--%>
    Kakao.init('75dba51b685ac97d77a9dbaff302ffd6');

    // 카카오 로그인 버튼을 생성합니다.
    function loginWithKakao() {
        Kakao.Auth.login({

            success: function (authObj) {
                Kakao.API.request({
                    url: '/v1/user/me',
                    success: function (res) {

                        // alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
                        // alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
                        // console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
                        // console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력
                        // console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근
                        // // res.properties.nickname으로도 접근 가능 )
                        // console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
                        $.ajax({
                            url: "${pageContext.request.contextPath}/user/emailcheck",
                            type: "post",
                            data: {email: res.id},
                            dataType: "json",
                            async: false,
                            success: function (result) {
                                if (result == true) {      <%--email(id code) 이 없고 회원가입이 가능할 경우 --%>
                                    var email = res.id;
                                    var name = res.properties['nickname'];
                                    regist(email, name);
                                } else {                  <%--email(id code)이 이미 존재하는 경우 --%>
                                    var email = res.id;
                                    login(email);
                                }
                            }
                            , error: function (XHR, status, error) {
                                console.error(status + " : " + error)
                            }
                        })
                    }
                })
            },
            fail: function (error) {
                alert(JSON.stringify(error));
            }
        })
    };
    <%-- kakao login End --%>

    <%-- kakao로 로그인 시도시 회원가입 함수 --%>

    function regist(email, name) {
        console.log("regist함수 = " + email);
        $.ajax({
            url: "${pageContext.request.contextPath}/user/joinbykakao",
            type: "post",
            data: {email: email, username: name},
            dataType: "json",
            success: function () {

            }, error: function (XHR, status, error) {
                // console.error(status+" 123: "+ error)
            }
        })
    }
    <%-- kakao로 로그인  --%>
    function login(email) {
        console.log("login 함수" + email);
        $.ajax({
            url: "${pageContext.request.contextPath}/user/loginbykakao",
            type: "post",
            data: {email: email},
            dataType: "json",
            success: function (result) {
                alert("환영합니다.")
                location.href = "${pageContext.request.contextPath}/main";

            }, error: function (XHR, status, error) {
                console.error(status + " 123: " + error)
            }
        })
    }
</script>
</html>