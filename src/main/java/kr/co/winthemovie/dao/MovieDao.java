package kr.co.winthemovie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.winthemovie.vo.DetailViewVo;
import kr.co.winthemovie.vo.MovieReviewVo;
import kr.co.winthemovie.vo.NowpVo;


@Repository
public class MovieDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 현재 상영 리스트
	public List<NowpVo> getTheaterList() {
		return sqlSession.selectList("movie.getTheaterList");
	}
	
	// 상세페이지 기본정보
	public DetailViewVo detailView(int playingno) {
		return sqlSession.selectOne("movie.detailView", playingno);
	}
	
	// 스틸컷
	public List<DetailViewVo> detailStillcut(int movieno) {
		List<DetailViewVo> result = sqlSession.selectList("movie.detailStillcut", movieno);
		return result;
	}
	
	// 동영상
	public List<DetailViewVo> detailStillmovie(int movieno) {
		List<DetailViewVo> result = sqlSession.selectList("movie.detailStillmovie", movieno);
		return result;
	}
	
	// 리뷰 팝업 체크(리뷰 작성 가능자 판별)
	public MovieReviewVo movieReview(int movieno, String userEmail, int playingno) {
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		reviewMap.put("movieno", movieno);
		reviewMap.put("userEmail", userEmail);
		reviewMap.put("playingno", playingno);
		return sqlSession.selectOne("movie.movieReview", reviewMap);
	}
	
	// 리뷰등록
	public int addReview(MovieReviewVo movieReviewVo) {
		sqlSession.insert("movie.addReview", movieReviewVo);
		return movieReviewVo.getReviewno();
	}
	
	// 방금 등록한 리뷰 불러오기
	public MovieReviewVo selectReview(int reviewno) {
		MovieReviewVo  movieReviewVo= sqlSession.selectOne("movie.selectReview", reviewno);
		return movieReviewVo;
	}
	
    // 리뷰리스트 출력
	public List<MovieReviewVo> revieList(int movieno) {
		List<MovieReviewVo> result = sqlSession.selectList("movie.ReviewList", movieno);
		return result;
	}
	
	// 리뷰삭제
	public int reviewdel(int reviewno) {
		return sqlSession.delete("movie.ReviewDel", reviewno);
	}
}
