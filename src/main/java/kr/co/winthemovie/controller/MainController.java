package kr.co.winthemovie.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.winthemovie.kobis.KobisAPI;

@Controller
public class MainController {

	@RequestMapping("/main")
	public String main(Model model, HttpServletRequest request) {
		try {
			model.addAttribute("dailyResult", KobisAPI.kobis()); // Kobis API 불러오는 코드
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main/main";
	}
}
