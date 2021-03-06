<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

<div class="modal_body">

  <!--영화 상세 모달창 레이아웃-->
  <div class="modal-mask" id="movie-detail"> <!--팝업 전체 div-->
     <div class="modal-wrapper"> <!--container를 제외한 여백 div-->
        <!--영화관/남은시간 정보-->
        <div class="modal-time clearfix">
           <div id="movieDetailTime">

            <div class="popup-box-top row1 clearfix">
               <div class="center-wrap" id="th-info">
              
                </div>
	            <div class="center-wrap2" >
	              <span class="time-name" id="th-name">명동역 씨네라이브러리</span>
	             </div>
	             
	              <div class="time-view">
	              <span class="time-title">남은시간</span>
	              <div class="time-wrap" id="time-wrap"> </div>
	              </div>
              </div>
            </div>
        </div>

        <!--세부정보시작-->
       <div class="modal-container clearfix">
         <div id="movieDetail">
	      <!--기본정보 : 영화포스터-->
	    <div class="popup-box row1 clearfix">
	      <div class="left-wrap" id="detail-poster">
	          
	      </div>
	      <!--기본정보 : 영화정보-->
	      <div class="right-wrap">
	         <div class="text">
		         <div class="title clearfix">
		           <h2>
			           <i id="age" class=""></i>
			           <span id="title"></span>
		           </h2>
		           <p id="enname"> </p>
		         </div>

		          <div class="reservation-wrap">
		              <p class="left-p">
			              <span>평균 예매율</span>
			              <strong class="strong-big">2</strong>
			              <span class="span-basic"> 위</span>
			              <span class="span-basic">(19.6%)</span>
			              <span class="span-sl"> &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp; </span>
		              </p>
		              <p class="right-p">
			              <span>평균 별점</span>
			              <span class="small_star">
			                <i class="fas fa-star"></i>
			                <i class="fas fa-star"></i>
			                <i class="fas fa-star"></i>
			                <i class="fas fa-star"></i>
			                <i class="far fa-star"></i>
			              </span>
		                  <strong class="strong-big">7.6</strong>
		              </p>
		           </div>
              </div>
              
              <ul class="info-wrap">
	            <li>
	              <strong>극장위치 &nbsp; </strong>
	              <span id="t-address"></span>
	            </li>
	            <li>
	              <strong>영화일시 &nbsp; </strong>
	              <span id="m-time"><font color="red"></font></span>
	            </li>
	            <li>
	              <strong>상영관 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
	              <span id="th-room"></span>
	            </li>
              </ul>
	          <button type="button" class="btn-movie btn-reservation" onclick="" id="test">
	            영화관 위치보기</button>
	          <button type="button" class="btn-ticket btn-reservation" onclick="">
	            예매하기</button>
          </div>
        </div>  <!--기본정보 끝-->
     
       <!--영화 간략 정보-->
       <!--영화분석-->
       <div class="ans-wrap">
          <h3>영화분석</h3>
          <div class="ans-wrap-div">
	          <div class="col-i-2">
	            <div class="panel panel-default">
	              <div class="panel-heading">
	                다른 사람들이 생각하는 이 영화는?
	              </div>
	            <div class="panel-body">
	               <img src="${pageContext.request.contextPath}/assets/img/word/a.png" width="100%">
	            </div>
	            </div>
	          </div>
	
	          <div class="col-i-3">
	            <div class="panel panel-default">
	              <div class="panel-heading">
	               일일평점
	              </div>
	            <div class="panel-body">
	              <img src="${pageContext.request.contextPath}/assets/img/bigData/b.png" width="100%">
	            </div>
	           </div>
	          </div>
	
	          <div class="col-i-1">
	            <div class="panel panel-default">
	              <div class="panel-heading">
	                이미 이 영화를 본 사람들의 비율은?
	              </div>
	            <div class="panel-body_s">
	             <img src="${pageContext.request.contextPath}/assets/img/bigData/c.png" width="100%">
	            </div>
	           </div>
	          </div>
	          
	          <div class="col-i-4">
	            <span> 이 영화에 대해 더 알고싶다면? </span>
	              <button type="button" class="btn-ans btn-ans-view" onclick="location.href='${pageContext.request.contextPath}/movie/analysis'">
	               영화 분석 더 알아보기</button>
	          </div>
          </div>
       </div>

       <div class="popup-box2 row2">
          <h3>영화 간략 정보</h3>
          <ul class="text">
	          <li>
	            <strong>감독  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
	            <span id="m-director">  </span>
	          </li>
	          <li>
	            <strong>주연배우 &nbsp; </strong>
	            <span id="m-actor"> </span>
	          </li>
	          <li>
	            <strong>개요 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
	            <span id="m-genre"> </span>
	          </li>
          </ul>
       </div>
       
       <!--줄거리-->
       <div class="popup-box row3">
          <h3>줄거리</h3>
          <div class="text">
             <pre class="text-pre" id="story"></pre>
          </div>
       </div>

       <!--동영상/스틸컷-->
       <div class="popup-box row4">
          <h3>
            <a href="" class="btn_steelCut active" title="스틸컷 보기" id="btn_steelCut"> 스틸컷
            <span class="stillCount"> </span>
            </a>

            <span class="line"> &nbsp;&nbsp;|&nbsp;&nbsp; </span>

            <a href="" class="btn_play" title="동영상 보기" id="btn_play"> 동영상
            <span class="trailerCount"> </span>
            </a>
        </h3>
     
     	<!-- 스틸컷 -->
		<div class="stillcut-box row4">
          <div class="stillcut-list">
            <!--이전&다음 버튼-->
            <!-- <div class="still-prevNext">
              <a class="still-prev" href="#" title="이전 스틸컷보기">이전 스틸컷</a>
              <a class="still-next" href="#" title="다음 스틸컷보기">다음 스틸컷</a>
              </div> -->

            <div class="still-slide">
              <ul class="stillUl">
                 <!-- 썸네일 그려질 공간 -->
              </ul>
            </div>
          </div>
          <div class="still-view-box">
            <!--이전&다음 버튼-->
            <!-- <div class="still-prevNext2" style="display: block;">
             <a class="still-prev2" href="#" title="이전 스틸컷 보기">이전 스틸컷</a>
             <a class="still-next2" href="#" title="다음 스틸컷 보기">다음 스틸컷</a>
             </div> -->
             
            <div class="still-img" style="display:block;">
               <img src="">
            </div>
          </div>
		</div>
      
        <!-- 동영상 -->
		<div class="stillcut-box-m row4">
          <div class="stillcut-list-m">
      		<!--이전&다음 버튼-->
            <!--  <div class="still-prevNext">
              <a class="still-prev" href="#" title="이전 스틸컷보기">이전 스틸컷</a>
              <a class="still-next" href="#" title="다음 스틸컷보기">다음 스틸컷</a>
              </div> -->
            
            <div class="still-slide-m">
               <ul class="stillUl-m">
                 <!-- 썸네일 그려질 공간 -->
               </ul>
            </div>
          </div>
          <div class="still-view-box-m">
          <div class="still-img-m">
           	 <iframe src="" width="920" height="500" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
          </div>
      	 </div>
		</div>
       </div>
       
       <!--감상평 등록-->
       <div class="popup-box1 row4">
         <div class="review">
            <h3>실관람객 평가</h3>
         <button type="button" class="btn-review" onclick="return false;">평점작성</button>
       </div>
    
       <div id="movieCommentList" class="list">
         <div class="item-2block"> 
            <!-- renderR 반복 -->   
         </div> 
       </div>

       <div class="pagination">
       <!--  <a href="#">&laquo;</a> -->
             <a class="active" href="#">1</a>
        <!-- <a href="#">2</a>
             <a href="#">&raquo;</a> -->
       </div> 
       </div> 

       <button type="button" class="popup-close">
        	<img src="${pageContext.request.contextPath}/assets/img/icon/close.png"> <!--버튼 이미지-->
            <span class="blind">닫기</span>
       </button>
     </div> <!-- movieDetail 끝 -->
    </div><!-- 세부정보시작 끝 -->
  </div> <!--modal-container 끝-->
</div> <!--팝업 전체 div-->
</div>
