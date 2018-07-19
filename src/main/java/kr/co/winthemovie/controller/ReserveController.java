package kr.co.winthemovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/movie")
public class ReserveController {
	
	@RequestMapping(value="/reserve", method=RequestMethod.GET)
	public String reserveform() {
		return "movie/reservepage";
	}

	@RequestMapping(value = "/current_movie",method = RequestMethod.GET)
	public String current_movie(){
		return "movie/current_movie";
	}

	@RequestMapping(value = "/future_movie",method = RequestMethod.GET)
	public String future_movie(){
		return "movie/future_movie";
	}
}
