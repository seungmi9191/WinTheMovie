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

    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> <%--kakao --%>
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
<script type="text/javascript">
    function showPopup() {
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
                                    <%--locatoin.href="${pageContext.request.contextPath}/main";--%>
                                } else {                  <%--email(id code)이 이미 존재하는 경우 --%>
                                    var email = res.id;
                                    login(email);
                                    <%--locatoin.href="${pageContext.request.contextPath}/main";--%>
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
                login(email);
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
                location.href = "${pageContext.request.contextPath}/main";

            }, error: function (XHR, status, error) {
                console.error(status + " 123: " + error)
            }
        })
    }
</script>
</html>
