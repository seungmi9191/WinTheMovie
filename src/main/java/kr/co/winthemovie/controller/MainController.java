package kr.co.winthemovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.winthemovie.kobis.KobisAPI;

@Controller
public class MainController {

	@RequestMapping("/main")
	public String main(Model model) {
		
		try {
			model.addAttribute("dailyResult", KobisAPI.kobis()); // Kobis API 불러오는 코드
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "main/main";
	}
}
