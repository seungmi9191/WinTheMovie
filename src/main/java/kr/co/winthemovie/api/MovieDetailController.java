package kr.co.winthemovie.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@ResponseBody
	@RequestMapping(value="/detail/view", method=RequestMethod.POST)
	public DetailViewVo detailView(@RequestParam("playingno") int playingno) {
		
		//System.out.println("받아온 상영번호: " + playingno);
		DetailViewVo result = movieService.detailView(playingno);
		//System.out.println(result.toString());
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/detail/stillcut", method=RequestMethod.POST) 
	public List<DetailViewVo> detailStillcut(@RequestParam("movieno") int movieno) {
		
		//System.out.println("받아온 영화코드: " + movieno);
		
		List<DetailViewVo> result_stillcut = movieService.detailStillcut(movieno);
		return result_stillcut;
	}
	
	@ResponseBody
	@RequestMapping(value="/detail/stillmovie", method=RequestMethod.POST)
	public List<DetailViewVo> detailStillmovie(@RequestParam("movieno") int movieno) {
		
		System.out.println("받아온 영화코드(동영상): " + movieno);
		List<DetailViewVo> result_stillmovie = movieService.detailStillmovie(movieno);
		
		return result_stillmovie;
	}
	
	@ResponseBody
	@RequestMapping(value="/detail/reviewpop", method=RequestMethod.POST)
	public MovieReviewVo reviewpop(@RequestParam("movieno") int movieno, @RequestParam("userEmail") String userEmail, @RequestParam("playingno") int playingno) {
		
		MovieReviewVo result_review = movieService.movieReview(movieno, userEmail, playingno);
		System.out.println("받아온 영화코드(리뷰): " + movieno + " 받아온 회원메일: " + userEmail + " 받아온 현재: " + playingno);
		
		return result_review;
	}

}
