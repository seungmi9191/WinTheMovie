package kr.co.winthemovie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.winthemovie.service.TheaterService;
import kr.co.winthemovie.vo.TheaterVo;

@Controller
@RequestMapping(value="/movie")
public class ReserveController {
	
	@Autowired
	private TheaterService service;
	String path = "/WinTheMovie";
	
	// Reserve Page form
	@RequestMapping(value="/reserve", method=RequestMethod.GET)
	public String reserveform() {
		return "movie/reservepage";
	}
	
	// 영화관 위치 찾기
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String reservesearch(Model model, @RequestParam("search") String search) {
		TheaterVo theatervo = service.search(search);
		System.out.println(theatervo.toString());
		model.addAttribute("theatervo", theatervo);
		return "movie/reservepage" ;
	}
}
