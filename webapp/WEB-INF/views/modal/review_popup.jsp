<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="review-body">
	<div class="modal-review-mask" id="review">
		<div class="modal-review-wrapper">
			<div class="modal-review-container">
				<h2>
					
				</h2>
				<div class="star">
				    <i class="fa-star far" data-reviewstar="1"></i> 
					<i class="fa-star far" data-reviewstar="2"></i> 
					<i class="fa-star far" data-reviewstar="3"></i> 
					<i class="fa-star far" data-reviewstar="4"></i> 
					<i class="fa-star far" data-reviewstar="5"></i> 
				</div>
				<input type="hidden" value="" class="userno">
				<input type="hidden" value="" class="movieno">
				<div class="textarea-input">
					<textarea placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다." id="inputText"></textarea>
				</div>

				<button type="button" class="btn-apply">등록하기</button>
				 <button type="button" class="review-close">
        			 <img src="${pageContext.request.contextPath}/assets/img/icon/review_close.png"> <!--버튼 이미지-->
       				 <span class="blind">닫기</span>
       			 </button>	 
			</div>
		</div>
	</div>
</div>