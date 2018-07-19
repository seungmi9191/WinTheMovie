package kr.co.winthemovie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.winthemovie.kobis.KobisAPI;
import kr.co.winthemovie.service.MovieService;
import kr.co.winthemovie.vo.NowpVo;



@Controller
public class MainController {

	@Autowired
	private MovieService movieService;
	
	@RequestMapping("/main")
	public String main(Model model) {
		
		try {
			model.addAttribute("dailyResult", KobisAPI.kobis()); // Kobis API 불러오는 코드
			
			//nowplayingList
			List<NowpVo> theaterList = movieService.getTheaterList();
			System.out.println("가져온 영화관정보:" + theaterList);
			model.addAttribute("theaterList",theaterList);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return "main/main";
	}
}
