package kr.co.winthemovie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.winthemovie.service.TheaterService;
import kr.co.winthemovie.vo.TheaterVo;

@Controller
@RequestMapping(value="/movie")
public class ReserveController {
	
	@Autowired
	private TheaterService service;
	
	// Reserve Page form
	@RequestMapping(value="/reserve", method=RequestMethod.GET)
	public String reserveform() {
		return "movie/reservepage";
	}
	
	// 영화관 위치 찾기
	@ResponseBody
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public TheaterVo reservesearch(@RequestParam("search") String search) {
		System.out.println(search);
		TheaterVo theatervo = service.search(search);
		System.out.println(theatervo.toString());
		return null;
	}
}
