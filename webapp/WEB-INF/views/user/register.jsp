<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/include/navi_style.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
          integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
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
            <form action="/winthemovie/user/joinbyemail" method="post" name="f" onsubmit="return check()"class="register-submit" id="register-submit">
                <div class="register_content">
                    <table>
                        <tr>
                            <td>
                                <input type="text" onblur="return check_email();return check_email_db()" placeholder="이메일 주소" maxlength="200"
                                       name="email" id="email"
                                       required>
                                <p class="email-text"></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="password" onblur="return check_pw()" placeholder="비밀번호" maxlength="20"
                                       name="userpw" id="userpw" style="font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif; letter-spacing: 1px;"  required>
                                <p class="pw-text"></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="password" onblur="return check_pw_re()" placeholder="비밀번호 확인" maxlength="20"
                                       name="confirm_pw"
                                       id="confirm_pw" required>
                                <p class="pw-check-text"></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" onblur="return check_name()" placeholder="이름" maxlength="20"
                                       name="username" id="username" style="color: #23212a" required>
                                <p class="user-name-text"></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" class="regist-agree" id="agree" name="agree" value="1" required>
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
            </form>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

<script type="text/javascript">

    var mail_check = 0;
    var pw_check = 0;
    var pw_re_check = 0;
    var name_check = 0;

    function check() {
        if (mail_check == 1 || pw_check == 1 || pw_re_check==1||name_check == 1) {

            alert("회원가입폼을 확인해주세요")

            $("#email").text("");
            $("#pw").text("");
            $("#confirm_pw").text("");
            $("#name").text("");

            return false;
        }
        alert("mail_check="+mail_check)
    }

    function check_email_db(){
        var email=$("#email").val();
        console.log(email)
        $.ajax({
            url:"/winthemovie/user/emailcheck",
            type:"post",
            data:{email:email},
            dataType: "json",
            success: function(result){
                if(result==true) {
                    console.log(email);
                    $(".email-text").text("");
                }else{
                    console.log(email);
                    $(".email-text").text("이미 사용중인 이메일 입니다.");
                }
            }
            ,error: function (XHR, status, error) {
                console.error(status+" : "+ error)

            }
        })
    }

    function check_email() {

        var email = document.f.email.value;
        var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        if (regex.test(email) === false) {
            $(".email-text").text("올바른 이메일 주소를 입력해주세요.");

            mail_check = 1;
            return false;
        }
        if (!(regex.test(email) === false)) {
            check_email_db();
            // $(".email-text").text("");
            mail_check = 0;
            return false;
        }
    }
    function check_pw() {
        if (document.f.userpw.value.length < 4 || document.f.userpw.value.length > 12) {
            $(".pw-text").text("비밀번호는 4자 이상 12자 이하로 생성하세요");
            pw_check = 1;
            return false;
        }
        if (!(document.f.userpw.value.length < 4 || document.f.userpw.value.length > 12)) {
            $(".pw-text").text("");
            pw_check = 0;
            return false;
        }
    }
    function check_pw_re() {
        var pw = document.f.userpw.value;
        var pw_check = document.f.confirm_pw.value;

        if (pw == pw_check) {
            $(".pw-check-text").text("");
            pw_re_check = 0;
            return false;
        }

        if (!(pw == pw_check)) {
            $(".pw-check-text").text("비밀번호를 다시 확인해주세요.");
            pw_re_check = 1;
            return false;
        }
    }
    function check_name() {
        // var regex_name = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        var regex_name = /^[가-힣a-zA-Z]{2,10}$/;
        if (document.f.username.value.indexOf(" ") >= 0 || regex_name.test(document.f.username.value)==false) {
            name_check = 1;
            $(".user-name-text").text("이름에는 숫자 또는 빈칸을 입력 하실 수 없습니다.");
            return false;
        }
        if (!(document.f.username.value.indexOf(" ") >= 0)) {
            name_check = 0;
            $(".user-name-text").text("");
            return false;
        }
    }

    // $("#email").on("onblur",function(checkemail){
    //     var email=$("#email").val();
    //     console.log(email)
    //     $.ajax({
    //         url:"/winthemovie/user/emailcheck",
    //         type:"post",
    //         data:{email:email},
    //         dataType: "json",
    //         success: function(result){
    //             if(result==true) {
    //                 $(".email-text").text("");
    //             }else{
    //                 $(".email-text").text("이미 사용중인 이메일 입니다.");
    //             }
    //         }
    //         ,error: function (XHR, status, error) {
    //             console.error(status+" : "+ error)
    //
    //         }
    //     })
    // })
</script>


</body>

</html>