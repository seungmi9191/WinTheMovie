<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/movie/recommend_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/include/navi_style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<title>recommend</title>
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	 <div class="recommend_container">
	      <div class="recommend_content">
	          <div class="recommend-movie-1">
	            <div class="recommend-wrap">
	              <div class="recommend-title">
	                  <div class="h2div">
	                      <span class="recommend-title-h2">
	                        <p style="color:brown; display: inline; font-weight:700;">#가을</p>에 맞는 장르별 추천 TOP 5</span>
	                  </h2>
	              </div>
	          </div>
	        </div>
	          <div class="recommend-list-wrap">
	              <div class="recommend-list">
	                  <div class="thumb-movie">
	                    <a href="">
	                        <div class="thumb-image">
	                            <img src="${pageContext.request.contextPath}/assets/img/common/poster2.jpg" class="thumb-image1">
	                            <span class="ico-grade grade-15">청불</span>
	                        </div>
	                        <div class="sub-title">
	                            <div class="sub-title-left"> 1</div>
	                            <div class="sub-title-right">왕좌의게임</div>
	                        </div>
	                    </a>
	                  </div>
	                  <div class="thumb-movie">
	                    <a href="">
	                        <div class="thumb-image">
	                            <img src="${pageContext.request.contextPath}/assets/img/common/poster2.jpg" class="thumb-image1">
	                            <span class="ico-grade grade-15">청불</span>
	                        </div>
	                        <div class="sub-title">
	                            <div class="sub-title-left"> 1</div>
	                            <div class="sub-title-right">왕좌의게임</div>
	                        </div>
	                    </a>
	                  </div>
	                  <div class="thumb-movie">
	                      <a href="">
	                          <div class="thumb-image">
	                              <img src="${pageContext.request.contextPath}/assets/img/common/poster3.jpg"
	                                   class="thumb-image1">
	                              <span class="ico-grade grade-15">청불</span>
	                          </div>
	                          <div class="sub-title">
	                              <div class="sub-title-left"> 3</div>
	                              <div class="sub-title-right">왕좌의게임:얼음과 불의 노래</div>
	
	                          </div>
	                      </a>
	                  </div>
	                  <div class="thumb-movie">
	                      <a href="">
	                          <div class="thumb-image">
	                              <img src="${pageContext.request.contextPath}/assets/img/common/poster4.jpg"
	                                   class="thumb-image1">
	
	                              <span class="ico-grade grade-15">청불</span>
	                          </div>
	                          <div class="sub-title">
	                              <div class="sub-title-left"> 4</div>
	                              <div class="sub-title-right">왕좌의게임:얼음과 불의 노래</div>
	
	                          </div>
	                      </a>
	                  </div>
	                  <div class="thumb-movie">
	                      <a href="">
	                          <div class="thumb-image">
	                              <img src="${pageContext.request.contextPath}/assets/img/common/poster5.jpg"
	                                   class="thumb-image1">
	                              <span class="ico-grade grade-15">청불</span>
	                          </div>
	                          <div class="sub-title">
	                              <div class="sub-title-left"> 5</div>
	                              <div class="sub-title-right">왕좌의게임:얼음과 불의 노래</div>
	                          </div>
	                      </a>
	                  </div>
	              </div>
	          </div>
	          <div style="clear:both;"></div>
	          <div class="multiwindow-wrap">
	              <div class="multi-wrap">
	                  <div class="multi-title">
	                      <h2> #왕좌의 게임</h2>
	                      <h2> 참 재미있는데</h2>
	                      <h2> 사람들이 잘 몰라</h2>
	                      <p class="mutli-title-p">
	                          존스노우와 대너리스의
	                      </p>
	                      <p class="mutli-title-p1">
	                          얼음과 불의노래
	                      </p>
	                  </div>
	                  <div class="window-img-wrap">
	                      <div class="multiwindow-wrap-wrapper">
	                          <div class="multiwindow-img-wrap">
	                              <a href="">
	                                  <img src="${pageContext.request.contextPath}/assets/img/common/d-1.png">
	                                  <div class="window-thumb-img">
	                                      <p> 왕좌의 게임 시즌1</p>
	                                  </div>
	                              </a>
	                          </div>
	                      </div>
	                      <div class="multiwindow-wrap-wrapper">
	                          <div class="multiwindow-img-wrap">
	                              <a href="">
	                                  <img src="${pageContext.request.contextPath}/assets/img/common/g2.png">
	                                  <div class="window-thumb-img">
	                                      <p> 왕좌의 게임 시즌2</p>
	                                  </div>
	                              </a>
	                          </div>
	                      </div>
	                      <div class="multiwindow-wrap-wrapper">
	                          <div class="multiwindow-img-wrap">
	                              <a href="">
	                                  <img src="${pageContext.request.contextPath}/assets/img/common/got-3-1-resized.png">
	                                  <div class="window-thumb-img">
	                                      <p> 왕좌의 게임 시즌3</p>
	                                  </div>
	                              </a>
	                          </div>
	                      </div>
	                      <div class="multiwindow-wrap-wrapper">
	                          <div class="multiwindow-img-wrap">
	                              <a href="">
	                                  <img src="${pageContext.request.contextPath}/assets/img/common/g3.png">
	                                  <div class="window-thumb-img">
	                                      <p> 왕좌의 게임 시즌4</p>
	                                  </div>
	                              </a>
	                          </div>
	                      </div>
	                  </div>
	              </div>
	          </div>
	
	          <div class="recommend_container">
	                <div class="recommend_content">
	                    <div class="recommend-movie-1">
	                      <div class="recommend-wrap">
	                        <div class="recommend-title">
	                            <div class="h2div">
	                                <span class="recommend-title-h2">
	                                  <p style="color:brown; display: inline; font-weight:700;">#가을</p>에 맞는 장르별 추천 TOP 5</span>
	                            </h2>
	                        </div>
	                    </div>
	                  </div>
	                    <div class="recommend-list-wrap">
	                        <div class="recommend-list">
	                            <div class="thumb-movie">
	                              <a href="">
	                                  <div class="thumb-image">
	                                      <img src="${pageContext.request.contextPath}/assets/img/common/poster2.jpg" class="thumb-image1">
	                                      <span class="ico-grade grade-15">청불</span>
	                                  </div>
	                                  <div class="sub-title">
	                                      <div class="sub-title-left"> 1</div>
	                                      <div class="sub-title-right">왕좌의게임</div>
	                                  </div>
	                              </a>
	                            </div>
	                            <div class="thumb-movie">
	                              <a href="">
	                                  <div class="thumb-image">
	                                      <img src="${pageContext.request.contextPath}/assets/img/common/poster2.jpg" class="thumb-image1">
	                                      <span class="ico-grade grade-15">청불</span>
	                                  </div>
	                                  <div class="sub-title">
	                                      <div class="sub-title-left"> 1</div>
	                                      <div class="sub-title-right">왕좌의게임</div>
	                                  </div>
	                              </a>
	                            </div>
	                            <div class="thumb-movie">
	                                <a href="">
	                                    <div class="thumb-image">
	                                        <img src="${pageContext.request.contextPath}/assets/img/common/poster3.jpg"
	                                             class="thumb-image1">
	                                        <span class="ico-grade grade-15">청불</span>
	                                    </div>
	                                    <div class="sub-title">
	                                        <div class="sub-title-left"> 3</div>
	                                        <div class="sub-title-right">왕좌의게임:얼음과 불의 노래</div>
	
	                                    </div>
	                                </a>
	                            </div>
	                            <div class="thumb-movie">
	                                <a href="">
	                                    <div class="thumb-image">
	                                        <img src="${pageContext.request.contextPath}/assets/img/common/poster4.jpg"
	                                             class="thumb-image1">
	
	                                        <span class="ico-grade grade-15">청불</span>
	                                    </div>
	                                    <div class="sub-title">
	                                        <div class="sub-title-left"> 4</div>
	                                        <div class="sub-title-right">왕좌의게임:얼음과 불의 노래</div>
	
	                                    </div>
	                                </a>
	                            </div>
	                            <div class="thumb-movie">
	                                <a href="">
	                                    <div class="thumb-image">
	                                        <img src="${pageContext.request.contextPath}/assets/img/common/poster5.jpg"
	                                             class="thumb-image1">
	                                        <span class="ico-grade grade-15">청불</span>
	                                    </div>
	                                    <div class="sub-title">
	                                        <div class="sub-title-left"> 5</div>
	                                        <div class="sub-title-right">왕좌의게임:얼음과 불의 노래</div>
	                                    </div>
	                                </a>
	                            </div>
	                        </div>
	                    </div>
	                    <div style="clear:both;"></div>
	                    <div class="multiwindow-wrap">
	                        <div class="multi-wrap">
	                            <div class="multi-title">
	                                <h2> #왕좌의 게임</h2>
	                                <h2> 참 재미있는데</h2>
	                                <h2> 사람들이 잘 몰라</h2>
	                                <p class="mutli-title-p">
	                                    존스노우와 대너리스의
	                                </p>
	                                <p class="mutli-title-p1">
	                                    얼음과 불의노래
	                                </p>
	                            </div>
	                            <div class="window-img-wrap">
	                                <div class="multiwindow-wrap-wrapper">
	                                    <div class="multiwindow-img-wrap">
	                                        <a href="">
	                                            <img src="${pageContext.request.contextPath}/assets/img/common/d-1.png">
	                                            <div class="window-thumb-img">
	                                                <p> 왕좌의 게임 시즌1</p>
	                                            </div>
	                                        </a>
	                                    </div>
	                                </div>
	                                <div class="multiwindow-wrap-wrapper">
	                                    <div class="multiwindow-img-wrap">
	                                        <a href="">
	                                            <img src="${pageContext.request.contextPath}/assets/img/common/g2.png">
	                                            <div class="window-thumb-img">
	                                                <p> 왕좌의 게임 시즌2</p>
	                                            </div>
	                                        </a>
	                                    </div>
	                                </div>
	                                <div class="multiwindow-wrap-wrapper">
	                                    <div class="multiwindow-img-wrap">
	                                        <a href="">
	                                            <img src="${pageContext.request.contextPath}/assets/img/common/got-3-1-resized.png">
	                                            <div class="window-thumb-img">
	                                                <p> 왕좌의 게임 시즌3</p>
	                                            </div>
	                                        </a>
	                                    </div>
	                                </div>
	                                <div class="multiwindow-wrap-wrapper">
	                                    <div class="multiwindow-img-wrap">
	                                        <a href="">
	                                            <img src="${pageContext.request.contextPath}/assets/img/common/g3.png">
	                                            <div class="window-thumb-img">
	                                                <p> 왕좌의 게임 시즌4</p>
	                                            </div>
	                                        </a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
            <div style="clear:both;"></div>
	 	 </div>
       </div>
     </div>
   </div>
  </div>
</div>

	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

</body>
</html>