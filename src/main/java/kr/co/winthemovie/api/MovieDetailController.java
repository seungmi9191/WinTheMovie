package kr.co.winthemovie.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.winthemovie.service.MovieService;
import kr.co.winthemovie.vo.DetailViewVo;
import kr.co.winthemovie.vo.MovieReviewVo;

@Controller 
public class MovieDetailController {
	
	@Autowired
	MovieService movieService;
	
	// 상세페이지 기본정보
	@ResponseBody
	@RequestMapping(value="/detail/view", method=RequestMethod.POST)
	public DetailViewVo detailView(@RequestParam("playingno") int playingno) {
		DetailViewVo result = movieService.detailView(playingno);
		return result;
	}
	
	// 스틸컷
	@ResponseBody
	@RequestMapping(value="/detail/stillcut", method=RequestMethod.POST) 
	public List<DetailViewVo> detailStillcut(@RequestParam("movieno") int movieno) {
		List<DetailViewVo> result_stillcut = movieService.detailStillcut(movieno);
		return result_stillcut;
	}
	
	// 동영상
	@ResponseBody
	@RequestMapping(value="/detail/stillmovie", method=RequestMethod.POST)
	public List<DetailViewVo> detailStillmovie(@RequestParam("movieno") int movieno) {
		List<DetailViewVo> result_stillmovie = movieService.detailStillmovie(movieno);
		return result_stillmovie;
	}
	
	// 리뷰팝업체크(리뷰 작성 가능자 판별)
	@ResponseBody
	@RequestMapping(value="/detail/reviewpop", method=RequestMethod.POST)
	public MovieReviewVo reviewpop(@RequestParam("movieno") int movieno, @RequestParam("userEmail") String userEmail, 
			                       @RequestParam("playingno") int playingno) {
		MovieReviewVo result_review = movieService.movieReview(movieno, userEmail, playingno);
		//System.out.println("받아온 영화코드(리뷰): " + movieno + " 받아온 회원메일: " + userEmail + " 받아온 현재: " + playingno);
		return result_review;
	}
	
	// 리뷰등록
	@ResponseBody
	@RequestMapping(value="/detail/reviewadd", method=RequestMethod.POST)
	public MovieReviewVo reviewadd(@ModelAttribute MovieReviewVo movieReviewVo) {
		MovieReviewVo movieReview = movieService.reviewadd(movieReviewVo);
		return movieReview;
    }
	
	// 리뷰리스트 출력
    @ResponseBody
    @RequestMapping(value="/detail/reviewlist", method=RequestMethod.POST) 
    public List<MovieReviewVo> reviewlist(@RequestParam("movieno") int movieno) {
    	List<MovieReviewVo> revieList = movieService.revieList(movieno);
    	return revieList;
    }
    
    // 리뷰삭제
    @ResponseBody
    @RequestMapping(value="/detail/reviewdel", method=RequestMethod.POST)
    public int reviewdel(@RequestParam("reviewno") int reviewno) {
    	int delResult = movieService.reviewdel(reviewno);
    	return delResult;
    }
}
