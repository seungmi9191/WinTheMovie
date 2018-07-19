package kr.co.winthemovie.controller;

import java.util.List;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.winthemovie.kobis.KobisAPI;

import kr.co.winthemovie.service.MovieService;
import kr.co.winthemovie.vo.NowpVo;
import kr.co.winthemovie.service.TheaterService;
import kr.co.winthemovie.vo.TheaterVo;


@Controller
public class MainController {

	@Autowired
	private MovieService movieService;
	private TheaterService service;

	
	@RequestMapping("/main")
	public String main(Model model, HttpServletRequest request) {
		// 1. 극장 위치 DB에 저장하는 구문
//		ServletContext context = request.getServletContext();
//		String path = context.getRealPath("WEB-INF/file/transferTheaterList.xlsx");
//		ArrayList<TheaterVo> list = InsertTheater.TheaterFileIO(path);
//		service.insertTheater(list);
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
	
	@ResponseBody
	@RequestMapping("/selectTheater")
	public ArrayList<TheaterVo> selectTheater( ){
		ArrayList<TheaterVo> list = (ArrayList<TheaterVo>) service.selectTheater();
		return list;
	}
}
