<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
          integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/movie/reserve_style.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

    <title>reserve_final</title>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

<div class="final_body">
    <!--영화 상세 모달창 레이아웃-->
    <div class="modal-mask"> <!--팝업 전체 div-->
        <div class="modal-wrapper"> <!--container를 제외한 여백 div-->
            <!--영화관/남은시간 정보-->
            <div class="modal-time clearfix">
                <div id="movieDetailTime">
                    <div class="popup-box-top row1 clearfix">
                        <div class="center-wrap">
                            <span class="time-name">빠른 예매 - 인원/좌석선택</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-container clearfix">
                <div class="left_wrap">
                    <div class="group">
                        <span class="title">일반</span>
                        <ul>
                            <li id="0" class="selectMember select0" data-count="0"
                                onclick="return selectMember($(this).data('count'))">0
                            </li>
                            <li id="1" class="selectMember select1" data-count="1"
                                onclick="return selectMember($(this).data('count'))">1
                            </li>
                            <li id="2" class="selectMember select2" data-count="2"
                                onclick="return selectMember($(this).data('count'))">2
                            </li>
                            <li id="3" class="selectMember select3" data-count="3"
                                onclick="return selectMember($(this).data('count'))">3
                            </li>
                            <li id="4" class="selectMember select4" data-count="4"
                                onclick="return selectMember($(this).data('count'))">4
                            </li>
                        </ul>
                        <span class="contents">인원 선택은 최대 4명까지 가능합니다.</span>
                    </div>
                    <div class="group2">
                        <div class="screen-box" style="text-align:center">
                            <div class="place" style="background-color: #fff; position:relative;">
                                <div class="seat-wrap">
                                    <p class="screen">SCREEN</p>
                                </div>
                            </div>

                            <div class="seat-box">
                                <div class="isview">
                                    <h3>관람 인원을 먼저 선택해주세요.</h3>
                                </div>
                                <div class="isviewUnder">
                                    <ul class="colshead"></ul>
                                    <ul class="rowshead" style="font-weight: bolder"></ul>
                                    <ol class="seat" style="text-align: center"></ol>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="group3">
                        <div class="seats-info-title">
                            <span style="font-size:14px; color:#5a5757;">좌석 안내</span>
                            <div class="seats-info">
                                <div class="box">
                                    <div class="seats-selected"></div>
                                    <div>선택좌석</div>
                                </div>
                                <div class="box">
                                    <div class="seats-soldout"></div>
                                    <div>예매완료</div>
                                </div>
                                <div class="box">
                                    <div class="seats-possible"></div>
                                    <div>일반석</div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="right_wrap">
                    <div class="row1"><img src="${pageContext.request.contextPath}${quickreservevo.poster}"
                                           alt=""></div>
                    <div class="row2">

                            <c:choose>
                                <c:when test="${quickreservevo.grade==1}">
                                    <div class="age"><img
                                            src="${pageContext.request.contextPath}/assets/img/grade/KakaoTalk_Photo_2018-07-31-11-26-18-4.png">
                                    </div>
                                </c:when>
                                <c:when test="${quickreservevo.grade==12}">
                                    <div class="age"><img
                                            src="${pageContext.request.contextPath}/assets/img/grade/KakaoTalk_Photo_2018-07-31-11-26-18-1.png">
                                    </div>
                                </c:when>
                                <c:when test="${quickreservevo.grade==15}">
                                    <div class="age"><img
                                            src='${pageContext.request.contextPath}/assets/img/grade/KakaoTalk_Photo_2018-07-31-11-26-18-2.png'>
                                    </div>
                                </c:when>
                                <c:when test="${quickreservevo.grade==19}">
                                    <div class="age"><img
                                            src="${pageContext.request.contextPath}/assets/img/grade/KakaoTalk_Photo_2018-07-31-11-26-18-3.png">
                                    </div>
                                </c:when>
                            </c:choose>

                        <div class="booking-movie-title">

                            <h4 class="movieTitle">${quickreservevo.koname}</h4>
                        </div>
                        <div class="booking-movie-content">
                            <table style="width:240px;">
                                <tr>
                                    <td style="width:45px; height:25px;">극장&nbsp;&nbsp;|</td>
                                    <td>${quickreservevo.theatername} ${quickreservevo.roomno}</td>

                                </tr>
                                <tr>
                                    <td style="width:45px; height:25px;">일시&nbsp;&nbsp;|</td>
                                    <td class="playingdate">${quickreservevo.playingdate} ${quickreservevo.playingtime}</td>
                                </tr>
                                <tr>
                                    <td style="width:45px; height:25px;">좌석&nbsp;&nbsp;|</td>
                                    <td class="result"></td>
                                </tr>

                            </table>
                        </div>

                        <div class="pay-btn">
                            <button type="button" class="btn-close">취소</button>
                            <button type="button" class="btn-next" onclick="payment()">결제하기</button>
                            <input type="hidden" id="countMembers"/>
                            <input type="hidden" id="tickets"/>
                        </div>

                    </div>
                </div>
                <!--  <button type="button" class="popup-close">
                   <img src="../assets/img/icon/modal-x-mark.png"> 버튼 이미지
                   <span class="blind">닫기</span>
                 </button> -->
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    // var $cols = $('input[name=cols]'),
    //     $rows = $('input[name=rows]'),
    var $result = $('.result'),
        $seat = $('.seat-box .seat'),
        $colsHead = $('.seat-box .colsHead'),
        $rowshead = $('.seat-box .rowshead'),
        colsNum, rowsNum, seatcount =${quickreservevo.seatcount};

    colsNum = parseInt(Math.sqrt(seatcount));
    rowsNum = seatcount / colsNum;

    // Ticket에 표시되는 요일 구하기
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var dayOfWeek = week[new Date(${quickreservevo.playingdate}).getDay()];
    var playingdate = '${quickreservevo.playingdate}' + "(" + dayOfWeek + ")" + ' &nbsp; &nbsp;${quickreservevo.playingtime}';


    <%--for(var i =0; i<${seatVo.};i++){--%>
    <%--var isSeat= ${seatVo[i].isSeat};--%>
    <%--}--%>

    $(".playingdate").html(playingdate);

    var updateView = function () {

        var makeTag = '';
        console.log(colsNum, rowsNum);

        <%--for(var i=0,isSeat=[]; i<seatVoSize;i++){--%>
        <%--var isSeat[i] = ${seatVo[i].isSeat};--%>
        <%--}--%>

        for (var i = 1, leng = colsNum * rowsNum; i <= leng; i++) {     // 좌석 li 태그로 그리기

            var viewCols = i % colsNum != 0 ? i % colsNum : colsNum;
            if (i % colsNum == 1) {
                makeTag += "<li class = 'chairs' style=' clear: both;'>" + viewCols + "</li>";
            } else {
                makeTag += "<li class = 'chairs'>" + viewCols + "</li>";
            }
        }

        $(function () {
            var isSeat = new Array();
            <c:forEach items="${seatVoArrayList}" var="seatInfo">
            var json = new Object();
            json.isSeat = "${seatInfo.isSeat}";
            json.seatName = "${seatInfo.seatname}";
            isSeat.push(json);
            </c:forEach>

            console.log(isSeat);

            for (var i = 0; i < isSeat.length; i++) {       // 예매된 좌석을 '예매됨'으로 바꾸기
                var isSeatList = isSeat[i].isSeat;

                if (isSeatList != 1) {
                    $('.chairs').eq(i).toggleClass('booked');
                } else {
                    console.log("its booked!");
                }
            }
        })

        $seat.html(makeTag);

        // $('.chairs').toggleClass('booked')

        // for (makeTag = '', i = 1, leng = colsNum; i <= leng; i++) {  //좌석 col name header(ex 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
        //     makeTag += '<li>' + i + '</li>';
        // }
        // $colsHead.html(makeTag);


        for (rowlist = '', i = 65, leng = 65 + rowsNum; i < leng; i++) {   //좌석 row name header(ex A, B, C, D, E, F, G, ..)
            rowlist += "<li class='rowList'>" + String.fromCharCode(i) + "</li>";
        }
        $rowshead.html(rowlist);

    }
    var seatList = new Array();
    var clicks = 0;
    var choose = new Array();
    $seat.on('click', 'li', function () {



        var $this = $(this),
            index = $this.index(),
            count = $('.selectedM').data('count');

        console.log($this.attr('class'))

        if($this.hasClass('booked')){
            return false;
        }

        if (!choose.includes(index)) {
            if (clicks < count) {
                choose.push(index);
                clicks++;
                $this.toggleClass('reserve');
            } else {
                alert("관람 인원 수를 확인해주세요.")
                // choose.pop(index);
                return
                // $this.toggleClass('reserve');
            }

        } else {

            if (clicks <= count) {
                clicks--;
                var deleteindex = choose.indexOf(index);
                if (index > 1) {
                    choose.splice(deleteindex, 1);
                }
                $this.toggleClass('reserve');
            }
        }

        choose.sort(function (a, b) {
            return a - b;
        })
        var seatHtml = '';


        for (var i = 0; i < clicks; i++) {
            seatList[i] = getSeatName(choose[i], count);

            if (i + 1 == clicks) {
                seatHtml += seatList[i].row + "열" + seatList[i].col + "번";
            } else {
                seatHtml += seatList[i].row + "열" + seatList[i].col + "번, ";
            }
        }
        $result.html(seatHtml)
    });
    var seatList
    var getSeatName = function (index) {
        var colsIndex = (index % colsNum) + 1,
            rowsIndex = Math.ceil((index + 1) / colsNum) - 1,
            rowsName = String.fromCharCode((65 + rowsIndex));
        var seatListobj = {row: rowsName, col: colsIndex, indexx: index};

        // var result = seatList.sort(function(a,b){return a.indexx - b.indexx})
        // seatList.indexx.sort(function (a, b) { return a.indexx-b.indexx });
        // console.log(result)
        return seatListobj;
    };

    var selTmp = false;
    var selMemNum = 0;
    var saveCount = 0;
    $('.group ul li').on('click', function () {

        var $this = $(this);
        var memberCount = $this.data('count');

        selMemNum = memberCount;
        // $this.toggleClass("selectedM");

        if (selTmp == false) {

            if (selMemNum == '0') {
                // $this.toggleClass("selectedM");
                $(".isView").show();
                saveCount = 0;
                selTmp = true;
            } else if (selMemNum == '1') {
                $this.toggleClass("selectedM");
                $("#0").toggleClass("selectedM");
                $(".isview").hide();
                saveCount = 1;
                selTmp = true;
            } else if (selMemNum == '2') {
                $this.toggleClass("selectedM");
                $("#0").toggleClass("selectedM");
                $(".isview").hide();
                saveCount = 2
                selTmp = true;
            } else if (selMemNum == '3') {
                $this.toggleClass("selectedM");
                $("#0").toggleClass("selectedM");
                $(".isview").hide();
                saveCount = 3
                selTmp = true;
            } else if (selMemNum == '4') {
                $this.toggleClass("selectedM");
                $("#0").toggleClass("selectedM");
                $(".isview").hide();
                saveCount = 4
                selTmp = true;
            }
        } else {

            if (selMemNum == '0') {
                result = confirmEvent();
                if (result == 1) {
                    choose = new Array();
                    seatList = new Array();
                    clicks = 0;
                    $result.html('')
                    $(".isView").show();
                    console.log("취소된 seatlist가 나와야합니다!!!! " + choose.length + "// " + seatList.length);
                    $("#0").toggleClass("selectMember");
                    $("#0").removeClass("selectedM");
                    $this.toggleClass("selectedM");
                    $("#1").toggleClass("selectMember");
                    $("#1").removeClass("selectedM");
                    $("#2").toggleClass("selectMember");
                    $("#2").removeClass("selectedM");
                    $("#3").toggleClass("selectMember");
                    $("#3").removeClass("selectedM");
                    $("#4").toggleClass("selectMember");
                    $("#4").removeClass("selectedM");
                    $(".reserve").removeClass("reserve");
                    selTmp = false;
                    // selTmp = true;
                } else {

                    saveCount = selMemNum;
                }
            } else {
                choose = new Array();
                seatList = new Array();
                clicks = 0;

                $(".reserve").toggleClass("reserve");
                $result.html('')
                $("#0").toggleClass("selectMember");
                $("#0").removeClass("selectedM");
                $("#1").toggleClass("selectMember");
                $("#1").removeClass("selectedM");
                $("#2").toggleClass("selectMember");
                $("#2").removeClass("selectedM");
                $("#3").toggleClass("selectMember");
                $("#3").removeClass("selectedM");
                $("#4").toggleClass("selectMember");
                $("#4").removeClass("selectedM");
                saveCount = selMemNum;
                $this.toggleClass("selectedM");
            }
            getSelMemNum(selMemNum);
        }
    })

    var getSelMemNum = function (selMemNum) {
        return selMemNum;
    }

    var selectMember = function (count) {
        var $this = $(this);
        var memberCount = count;
        var tmp = {count: memberCount};
        return tmp;
    }

    var tmp = "";
    $(document).ready(function () {
        $('.group ul li:first-child').toggleClass("selectedM");

        updateView();
        var tmp = selectMember();
        if (tmp.count == null || tmp.count == '0') {

        } else {

        }
    })

    function confirmEvent() {
        if (confirm("선택된 인원 정보가 삭제됩니다. 계속 진행하시겠습니까?") == true) {
            return 1;
        } else {
            return 0;
        }
    }

    function payment() {
        if (choose.length == selMemNum && selMemNum != 0) {
            alert(selMemNum + choose.length + "선택한 좌석=" + choose + "결제가 완료되었습니다.");
            location.href = "${pageContext.request.contextPath}/main"
        } else {
            alert("예매 인원 수를 다시 확인해주세요.")
            return false;
        }
    }

</script>
<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
</body>
</html>