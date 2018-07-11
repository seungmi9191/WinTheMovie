package kr.co.winthemovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.winthemovie.util.KobisOpenAPI;
import kr.co.winthemovie.util.today_time;

@Controller
public class MainController {
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String movie_rank(Model model) {
		
		try {
			model.addAttribute("dailyResult", KobisOpenAPI.kobis());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main/main";
	}
}
