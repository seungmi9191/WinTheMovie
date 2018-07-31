package kr.co.winthemovie.controller;

import java.util.ArrayList;
import java.util.List;

import com.sun.xml.internal.bind.v2.model.annotation.Quick;
import kr.co.winthemovie.vo.QuickReserveVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.winthemovie.service.ReserveService;
import kr.co.winthemovie.vo.TheaterVo;

@Controller
@RequestMapping(value="/movie")
public class ReserveController {
	
	@Autowired
	private ReserveService reserve_service;
	
	@RequestMapping(value="/reserve", method=RequestMethod.GET)
	public String reserveform(Model model) {
		return "movie/reservepage";
	}
	
	@ResponseBody
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public ArrayList<TheaterVo> selectByTheater(@RequestParam("search") String search) {
		System.out.println(search);
		ArrayList<TheaterVo> list = (ArrayList<TheaterVo>)reserve_service.selectByTheater(search);
		for(TheaterVo vo : list) {
			System.out.println(vo.getTheateraddress());
		}
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/selectOneTheater", method=RequestMethod.GET)
	public List<TheaterVo> selectByOneTheater(@RequestParam("theaterno") String theaterno) {
		List<TheaterVo> list = reserve_service.selectByOneTheater(theaterno);
		return list;
	}


	@RequestMapping(value = "/reserve_quick",method = {RequestMethod.GET,RequestMethod.POST})
	public String reserve_final(/*영화 포스터 선택시 */Model model,int nowplayingno){

		System.out.println("reserveContorller *playingno="+nowplayingno);
		QuickReserveVo quickreservevo=reserve_service.getQuickReserve(nowplayingno);

		model.addAttribute("quickreservevo",quickreservevo);
		System.out.println(quickreservevo.toString());
		return "movie/reserve_final";
	}

//	@ResponseBody
//	@RequestMapping(value="/nowplaying",method = RequestMethod.POST)
//	public String getNowPlaying(Model model,@RequestParam("nowplaying") int nowplayingno){
//
//
//	}
}
