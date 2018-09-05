package kr.co.winthemovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.winthemovie.dao.MovieDao;
import kr.co.winthemovie.vo.DetailViewVo;
import kr.co.winthemovie.vo.MovieReviewVo;
import kr.co.winthemovie.vo.NowpVo;


@Service
public class MovieService {
	
	@Autowired
	private MovieDao movieDao;
	
	// 현재 상영 리스트
	public List<NowpVo> getTheaterList() {
		return movieDao.getTheaterList();
	}
	
	// 상세페이지 기본정보
	public DetailViewVo detailView(int playingno) {
		return movieDao.detailView(playingno);
	}
	
	// 스틸컷
	public List<DetailViewVo> detailStillcut(int movieno) {
		return movieDao.detailStillcut(movieno);
	}
	
	// 동영상
	public List<DetailViewVo> detailStillmovie(int movieno) {
		return movieDao.detailStillmovie(movieno);
	}
	
	// 리뷰팝업체크(리뷰 작성 가능자 판별)
	public MovieReviewVo movieReview(int movieno, String userEmail, int playingno) {
		MovieReviewVo result = movieDao.movieReview(movieno, userEmail, playingno);
		System.out.println("movieReview: " + result);
		return result;
	}
	
	// 리뷰등록
	public MovieReviewVo reviewadd(MovieReviewVo movieReviewVo) {
		int reviewno = movieDao.addReview(movieReviewVo);
		return movieDao.selectReview(reviewno);
	}
	
	// 리뷰리스트 출력
	public List<MovieReviewVo> revieList(int movieno) {
		return movieDao.revieList(movieno);
	}
	
	// 리뷰삭제
	public int reviewdel(int reviewno) {
		int count = movieDao.reviewdel(reviewno);
		if(count>0) {
			count = reviewno; // 삭제된 리뷰리스트번호 
		} else {
			count = 0;
		}
		return count;
	}
}
