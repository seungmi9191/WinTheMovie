package kr.co.winthemovie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.winthemovie.kobis.KobisAPI;
import kr.co.winthemovie.service.MovieService;
import kr.co.winthemovie.service.TheaterService;
import kr.co.winthemovie.util.InsertTheater;
import kr.co.winthemovie.util.Trans;
import kr.co.winthemovie.vo.NowpVo;
import kr.co.winthemovie.vo.TheaterVo;

@Controller
public class MainController {

	@Autowired
	private TheaterService service;
	@Autowired
	private MovieService movieService;

	@RequestMapping(value = "/main")
	public String main(Model model, HttpServletRequest request) {
		 //1. 극장 위치 DB에 저장하는 구문
		 //ServletContext context = request.getServletContext();
		 //String path = context.getRealPath("/WEB-INF/file/transferTheaterList.xls");
		 //ArrayList<TheaterVo> list = InsertTheater.TheaterFileIO(path);
		 //service.insertTheater(list);
		try {
			model.addAttribute("dailyResult", KobisAPI.kobis(1)); // Kobis API 불러오는 코드
			List<NowpVo> theaterList = movieService.getTheaterList(); 
			//KobisAPI.movieInfo("신과함께");
			model.addAttribute("theaterList", theaterList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main/main";
	}

	@ResponseBody
	@RequestMapping(value = "/selectTheater")
	public ArrayList<TheaterVo> selectTheater() {
		ArrayList<TheaterVo> list = (ArrayList<TheaterVo>) service.selectTheater();
		return list;
	}

	// ajax로 지도 검색 후 좌표로 변경
	@ResponseBody
	@RequestMapping(value = "/transfer", method = { RequestMethod.POST, RequestMethod.GET })
	public HashMap<String, String> transfer(@RequestParam("getAddr") String getAddr) {
		HashMap<String, String> map = Trans.transfer(getAddr);
		return map;
	}
}