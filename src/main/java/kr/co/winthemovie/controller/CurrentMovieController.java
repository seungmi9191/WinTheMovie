package kr.co.winthemovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.winthemovie.kobis.KobisAPI;

@Controller
@RequestMapping(value="/movie")
public class CurrentMovieController {
	
	@RequestMapping(value="/currentmovie", method=RequestMethod.GET)
	public String CurrentMoviePage(Model model) {
		try {
			model.addAttribute("weekResult",KobisAPI.kobis(2));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "movie/current_movie";
	}
	
	@RequestMapping(value="/futuremovie", method=RequestMethod.GET)
	public String FutureMoviePage() {
		return "movie/future_movie";
	}
}
