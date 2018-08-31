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
	
	public List<NowpVo> getTheaterList() {
		return sqlSession.selectList("movie.getTheaterList");
	}
	
	public DetailViewVo detailView(int playingno) {
		return sqlSession.selectOne("movie.detailView", playingno);
	}
	
	//stillcut
	public List<DetailViewVo> detailStillcut(int movieno) {
		List<DetailViewVo> result = sqlSession.selectList("movie.detailStillcut", movieno);
		System.out.println("받아온 스틸컷:" + result);
		return result;
	}
	
	//trailler
	public List<DetailViewVo> detailStillmovie(int movieno) {
		List<DetailViewVo> result = sqlSession.selectList("movie.detailStillmovie", movieno);
		System.out.println("받아온 동영상:" + result);
		return result;
	}
	
	//movieReview
	public MovieReviewVo movieReview(int movieno, String userEmail, int playingno) {
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		reviewMap.put("movieno", movieno);
		reviewMap.put("userEmail", userEmail);
		reviewMap.put("playingno", playingno);
		return sqlSession.selectOne("movie.movieReview", reviewMap);
	}
	
}
