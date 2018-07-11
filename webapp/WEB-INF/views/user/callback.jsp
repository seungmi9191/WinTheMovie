<!doctype html>
<html lang="ko">
<head>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<form action="/user/callback" method="post">
    <input type="hidden" id="access_token" name="access_token" value="">
    <div>
        <input type="submit" id = "abcd" >
    </div>
</form>
<script type="text/javascript">
    var naver_id_login = new naver_id_login("29ED47vcAOiiJdxtOrrS", "http://localhost:8088/callback");
    // 접근 토큰 값 출력
    var access_token = naver_id_login.oauthParams.access_token;

    alert(naver_id_login.oauthParams.access_token);
    // 네이버 사용자 프로필 조회
    naver_id_login.get_naver_userprofile("naverSignInCallback()");

    // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
    function naverSignInCallback() {
        alert(naver_id_login.getProfileData('email'));
        alert(naver_id_login.getProfileData('nickname'));
        alert(naver_id_login.getProfileData('age'));
    }

    $(document).ready(function(){
        $("#access_token").text(access_token);
        console.log(access_token);
    });

</script>
</body>
</html>