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
	
	public List<NowpVo> getTheaterList() {
		return movieDao.getTheaterList();
	}
	
	public DetailViewVo detailView(int playingno) {
		return movieDao.detailView(playingno);
	}
	
	//stillcut
	public List<DetailViewVo> detailStillcut(int movieno) {
		return movieDao.detailStillcut(movieno);
	}
	
	//trailler
	public List<DetailViewVo> detailStillmovie(int movieno) {
		return movieDao.detailStillmovie(movieno);
	}
	
	//movieReview
	public MovieReviewVo movieReview(int movieno, String userEmail, int playingno) {
		
		MovieReviewVo result = movieDao.movieReview(movieno, userEmail, playingno);
		System.out.println("movieReview: " + result);
		
		
		return result;
	}
}
