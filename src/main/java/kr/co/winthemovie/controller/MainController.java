package kr.co.winthemovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.winthemovie.kobis.KobisAPI;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@RequestMapping(value = "/location",method= RequestMethod.GET)
	public String locationform(){
		return "modal/location";
	}

}
