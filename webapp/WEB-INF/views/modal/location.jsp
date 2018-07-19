<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/JavaScript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/modal/location.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
          integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <title>location</title>
</head>
<body>
<div class="body">

    <button onclick="document.getElementById('location').style.display='block'" class="btn-ans">Open Modal</button>

    <div class="modal-location-mask" id="location">
        <div class="modal-location-wrapper">
            <div class="modal-location-container">
                <h2>나의 위치 등록하기</h2>
                <div class="select-location">
                    <input type="hidden" id = "userX" value=""/>
                    <input type="hidden" id="userY" value=""/>
                    <i class="fas fa-map-marker-alt"></i><span id="setAddr"></span><span id="setXY"></span>
                </div>
                <div class="p-des">
                    <p class="description-loc">내가 자주있는 위치를 등록해보세요.<br/>
                        더욱 편하게 영화표 정보를 안내받을 수 있어요.</p>
                </div>

                <div class="search">
                    <form name="form" id="form" action="javascript:void(0)">
                        <input type="hidden" name="currentPage" value="1"/>
                        <!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
                        <input type="hidden" name="countPerPage" value="10"/>
                        <!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) -->
                        <input type="hidden" name="resultType" value="json"/>
                        <!-- 요청 변수 설정 (검색결과형식 설정, json) -->
                        <input type="hidden" name="confmKey" value="U01TX0FVVEgyMDE4MDcxNjIwMjkwNzEwODAxMzk="/>
                        <!-- 요청 변수 설정 (승인키) -->
                        <input type="text" placeholder="동을 입력해주세요. 예)서초동" id="search-addr" name="keyword"
                               class="sh-location-input" style="background: white">
                        <%--<button class="btn-search" onclick="getAddr();"><i class="fas fa-search "></i></button>--%>
                        <button class="btn-search" type="button" onclick="getAddr()" value="123"><i class="fas fa-search "></i></button>
                    </form>
                </div>

                <div class="sh-location-body">
                    <div>
                        <div class="search-scroll">
                            <div class="location-wrap">
                                <div class="sh-component01" id="list">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <button type="button" class="popup-close"
                        onclick="document.getElementById('location').style.display='none'">
                    <img src="${pageContext.request.contextPath}/assets/img/icon/x-mark.png"> <!--버튼 이미지-->
                    <span class="blind">닫기</span>
                </button>
            </div>
        </div>
    </div>
</div>
</body>
<script language="javascript">
    function getAddr() {
        // AJAX 주소 검색 요청
        $.ajax({
            url: "http://www.juso.go.kr/addrlink/addrLinkApiJsonp.do"	// 주소검색 OPEN API URL
            , type: "post"
            , data: $("#form").serialize() 								// 요청 변수 설정
            , dataType: "jsonp"											// 크로스도메인으로 인한 jsonp 이용, 검색결과형식 JSON
            , crossDomain: true
            , success: function (jsonStr) {									// jsonStr : 주소 검색 결과 JSON 데이터
                $("#list").html("");									// 결과 출력 영역 초기화
                var errCode = jsonStr.results.common.errorCode;
                var errDesc = jsonStr.results.common.errorMessage;
                if (errCode != "0") {
                    alert(errCode + "=" + errDesc);
                } else {
                    if (jsonStr != null) {
                        makeListJson(jsonStr);							// 결과 JSON 데이터 파싱 및 출력
                    }
                }
            }
            , error: function (xhr, status, error) {
                alert("에러발생");										// AJAX 호출 에러
            }
        });


        function makeListJson(jsonStr) {
            var htmlStr = "";
            htmlStr += "<table>";
            // jquery를 이용한 JSON 결과 데이터 파싱
            $(jsonStr.results.juso).each(function () {
                var setAddress = this.roadAddrPart1;
                var address_xy = this.buldMnnm;
                var admCd = this.admCd;
                var rnMgtSn = this.rnMgtSn;
                var udrtYn = this.udrtYn;
                var buldSlno = this.buldSlno;
                console.log("addreessss=" + setAddress);
                htmlStr += "<tr>";
                // htmlStr += "<td>" + this.roadAddr + "</td>";
                htmlStr += "<td>" + setAddress + "</td>";
                // htmlStr += "<td>" + this.roadAddrPart2 + "</td>";
                // htmlStr += "<td>" + this.jibunAddr + "</td>";
                // htmlStr += "<td>" + this.engAddr + "</td>";
                // htmlStr += "<td>" + this.zipNo + "</td>";
                // htmlStr += "<td>" + this.admCd + "</td>";
                // htmlStr += "<td>" + this.rnMgtSn + "</td>";
                // htmlStr += "<td>" + this.bdMgtSn + "</td>";
                // htmlStr += "<td>" + this.detBdNmList + "</td>";
                // /** API 서비스 제공항목 확대 (2017.02) **/
                // htmlStr += "<td>" + this.bdNm + "</td>";
                // htmlStr += "<td>" + this.bdKdcd + "</td>";
                // htmlStr += "<td>" + this.siNm + "</td>";
                // htmlStr += "<td>" + this.sggNm + "</td>";
                // htmlStr += "<td>" + this.emdNm + "</td>";
                // htmlStr += "<td>" + this.liNm + "</td>";
                // htmlStr += "<td>" + this.rn + "</td>";
                // htmlStr += "<td>" + this.udrtYn + "</td>";
                // htmlStr += "<td>" + this.buldMnnm + "</td>";
                // htmlStr += "<td>" + this.buldSlno + "</td>";
                // htmlStr += "<td>" + this.mtYn + "</td>";
                // htmlStr += "<td>" + this.lnbrMnnm + "</td>";
                // htmlStr += "<td>" + this.lnbrSlno + "</td>";
                // htmlStr += "<td>" + this.emdNo + "</td>";
                // htmlStr += "</tr>";
                // htmlStr += <button type="button" class="btn-select">적용하기</button>
                htmlStr += "<form name=\"form_xy\" id=\"form_xy\" method=\"post\">";
                htmlStr += "<td>";
                htmlStr += "<input type=\"hidden\" name=\"resultType\" value=\"json\"/>"
                htmlStr += "</td>";
                htmlStr += "<td>";
                htmlStr += "<input type=\"hidden\" name=\"confmKey\" value=\"U01TX0FVVEgyMDE4MDcxODEwMDczMjEwODAxNzM=\"/>";
                htmlStr += "</td>";
                htmlStr += "<td>";
                htmlStr += "<input type=\"hidden\" name=\"admCd\" value=\"" + admCd + "\"/>";
                htmlStr += "</td>";
                htmlStr += "<td>";
                htmlStr += "<input type=\"hidden\" name=\"rnMgtSn\" value=\"" + rnMgtSn + "\"/>";
                htmlStr += "</td>";
                htmlStr += "<td>";
                htmlStr += "<input type=\"hidden\" name=\"udrtYn\" value=\"" + udrtYn + "\"/>";
                htmlStr += "</td>";
                htmlStr += "<td>";
                htmlStr += "<input type=\"hidden\" name=\"buldMnnm\" value=\"" + address_xy + "\"/>";
                htmlStr += "</td>";
                htmlStr += "<td>";
                htmlStr += "<input type=\"hidden\" name=\"buldSlno\" value=\"" + buldSlno + "\"/>";
                htmlStr += "</td>";
                htmlStr += "<td>";
                htmlStr += "<button type ='button' class='btn-select' data-addressxy ='" + address_xy + "' data-address='" + setAddress + "'>적용하기</button>";
                htmlStr += "</td>";
                htmlStr += "</form>";
            });
            htmlStr += "</table>";
            // 결과 HTML을 FORM의 결과 출력 DIV에 삽입
            $("#list").html(htmlStr);


            $(".btn-select").on("click", function () {
                var $address = $(this).data('address').split(" ")[1];
                var $address_xy = $(this).data('addressxy');
                if ($(this).data('address').split(" ")[0].length == 4) {

                    var $front = $(this).data('address').split(" ")[0].substring(0, 1) + $(this).data('address').split(" ")[0].substring(2, 3);

                } else {

                    var $front = $(this).data('address').split(" ")[0].substring(0, 2);
                }
                $('#setAddr').text($front + " _ " + $address + "bulidMnn = " + $address_xy);

                $.ajax({
                    url: "${pageContext.request.contextPath}/juso"
                    , type: "post"
                    , data: {getAddr: $(this).data('address')}					// 요청 변수 설정
                    , dataType: "json"
                    , async: false
                    , success: function(map) {
                        var userX=map.userX;
                        var userY=map.userY;

                        $('#setXY').text(userX + userY);
                    }
                    , error: function (XHR, status, error) {
                        console.error(status + " : " + error)									// AJAX 호출 에러
                    }
                });

            })
        }
    }

</script>
</html>
