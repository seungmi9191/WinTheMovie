<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/movie/current_movie_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/include/navi_style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>current_movie</title>
</head>
<body>

	 <c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	 
	 <div class="current_movie_container" class="">
      <div class="current_movie_contents" class="">
          <div class="wrap-movie-chart">
              <div class="tit-heading-wrap">
                  <h3>현재 상영작</h3>
                  <div class="current_submenu">
                      <ul>
                          <li class="on">
                              <a href="#" title="선택">현재 상영작</a>
                          </li>
                          <li>
                              |
                          </li>
                          <li>
                              <a href="#">상영 예정작</a>
                          </li>

                      </ul>
                  </div>
              </div>
              <div class="sect-movie-chart">
                  <h4 class="hidden">
                  </h4>
                  <ol>
                      <li>
                          <div class="box-image">
                              <strong class="rank">No.1</strong>
                              <a href="#">
                                  <span class="thumb-image">
                                      <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80740/80740_185.jpg"
                                           alt="탐정: 리턴즈 포스터" onerror="errorImage(this)">
                                      <span class="ico-grade grade-15">청불</span>
                                  </span>
                              </a>
                              <span class="screentitle">
                              </span>

                          </div>


                          <div class="box-contents">
                              <a href="/movies/detail-vies/?midx=<%--영화코드--%>">
                                  <strong class="title">상세보기</strong>

                              </a>
                          </div>
                      </li>
                      <li>
                          <div class="box-image">
                              <strong class="rank">No.2</strong>
                              <a href="/movies/detail-view/?midx=">
                                  <span class="thumb-image">
                                      <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80740/80740_185.jpg"
                                           alt="탐정: 리턴즈 포스터" onerror="errorImage(this)">
                                      <span class="ico-grade grade-15">청불</span>
                                  </span>
                              </a>
                              <span class="screentitle">
                              </span>

                          </div>
                          <div class="box-contents">
                              <a href="/movies/detail-vies/?midx=<%--영화코드--%>">
                                  <strong class="title">상세보기</strong>
                              </a>
                          </div>
                      </li>
                      <li>
                          <div class="box-image">
                              <strong class="rank">No.3</strong>
                              <a href="/movies/detail-view/?midx=">
                                  <span class="thumb-image">
                                      <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80740/80740_185.jpg"
                                           alt="탐정: 리턴즈 포스터" onerror="errorImage(this)">
                                      <span class="ico-grade grade-15">청불</span>
                                  </span>
                              </a>
                              <span class="screentitle">
                              </span>

                          </div>
                          <div class="box-contents">
                              <a href="/movies/detail-vies/?midx=<%--영화코드--%>">
                                  <strong class="title">상세보기</strong>
                              </a>
                          </div>
                      </li>
                      <li>
                          <div class="box-image">
                              <strong class="rank">No.4</strong>
                              <a href="/movies/detail-view/?midx=">
                                  <span class="thumb-image">
                                      <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80740/80740_185.jpg"
                                           alt="탐정: 리턴즈 포스터" onerror="errorImage(this)">
                                      <span class="ico-grade grade-15">청불</span>
                                  </span>
                              </a>
                              <span class="screentitle">
                              </span>

                          </div>
                          <div class="box-contents">
                              <a href="/movies/detail-vies/?midx=<%--영화코드--%>">
                                  <strong class="title">탐정: 리턴즈</strong>
                              </a>
                          </div>
                      </li>
                      <li>
                          <div class="box-image">
                              <strong class="rank">No.5</strong>
                              <a href="/movies/detail-view/?midx=">
                                  <span class="thumb-image">
                                      <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80740/80740_185.jpg"
                                           alt="탐정: 리턴즈 포스터" onerror="errorImage(this)">
                                      <span class="ico-grade grade-15">청불</span>
                                  </span>
                              </a>
                              <span class="screentitle">
                              </span>

                          </div>
                          <div class="box-contents">
                              <a href="/movies/detail-vies/?midx=<%--영화코드--%>">
                                  <strong class="title">상세보기</strong>
                              </a>
                          </div>
                      </li>
                  </ol>
                  <ol>
                      <li>
                          <div class="box-image">
                              <strong class="rank">No.6</strong>
                              <a href="/movies/detail-view/?midx=">
                                  <span class="thumb-image">
                                      <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80740/80740_185.jpg"
                                           alt="탐정: 리턴즈 포스터" onerror="errorImage(this)">
                                      <span class="ico-grade grade-15">청불</span>
                                  </span>
                              </a>
                              <span class="screentitle">
                              </span>

                          </div>
                          <div class="box-contents">
                              <a href="/movies/detail-vies/?midx=<%--영화코드--%>">
                                  <strong class="title">상세보기</strong>
                              </a>
                          </div>
                      </li>
                      <li>
                          <div class="box-image">
                              <strong class="rank">No.7</strong>
                              <a href="/movies/detail-view/?midx=">
                                  <span class="thumb-image">
                                      <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80740/80740_185.jpg"
                                           alt="탐정: 리턴즈 포스터" onerror="errorImage(this)">
                                      <span class="ico-grade grade-15">청불</span>
                                  </span>
                              </a>
                              <span class="screentitle">
                              </span>

                          </div>
                          <div class="box-contents">
                              <a href="/movies/detail-vies/?midx=<%--영화코드--%>">
                                  <strong class="title">상세보기</strong>
                              </a>
                          </div>
                      </li>
                      <li>
                          <div class="box-image">
                              <strong class="rank">No.8</strong>
                              <a href="/movies/detail-view/?midx=">
                                  <span class="thumb-image">
                                      <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80740/80740_185.jpg"
                                           alt="탐정: 리턴즈 포스터" onerror="errorImage(this)">
                                      <span class="ico-grade grade-15">청불</span>
                                  </span>
                              </a>
                              <span class="screentitle">
                              </span>

                          </div>
                          <div class="box-contents">
                              <a href="/movies/detail-vies/?midx=<%--영화코드--%>">
                                  <strong class="title">상세보기</strong>
                              </a>
                          </div>
                      </li>
                      <li>
                          <div class="box-image">
                              <strong class="rank">No.9</strong>
                              <a href="/movies/detail-view/?midx=">
                                  <span class="thumb-image">
                                      <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80740/80740_185.jpg"
                                           alt="탐정: 리턴즈 포스터" onerror="errorImage(this)">
                                      <span class="ico-grade grade-15">청불</span>
                                  </span>
                              </a>
                              <span class="screentitle">
                              </span>

                          </div>
                          <div class="box-contents">
                              <a href="/movies/detail-vies/?midx=<%--영화코드--%>">
                                  <strong class="title">상세보기</strong>
                              </a>
                          </div>
                      </li>
                      <li>
                          <div class="box-image">
                              <strong class="rank">No.10</strong>
                              <a href="/movies/detail-view/?midx=">
                                  <span class="thumb-image">
                                      <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80740/80740_185.jpg"
                                           alt="탐정: 리턴즈 포스터" onerror="errorImage(this)">
                                      <span class="ico-grade grade-15">청불</span>
                                  </span>
                              </a>
                              <span class="screentitle">
                              </span>

                          </div>
                          <div class="box-contents">
                              <a href="/movies/detail-vies/?midx=<%--영화코드--%>">
                                  <strong class="title">상세보기</strong>
                              </a>
                          </div>
                      </li>
                  </ol>
                  <button id="moreMovieList" type="button" class="view_more full_width" onclick="MovieList.getMore()">
                      더보기
                  </button>

              </div>
          </div>
      </div>
  </div>
	 
	 <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

</body>
</html> 