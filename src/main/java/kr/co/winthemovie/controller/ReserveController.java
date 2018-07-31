package kr.co.winthemovie.controller;

import java.util.ArrayList;

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
import kr.co.winthemovie.service.TheaterService;
import kr.co.winthemovie.vo.TheaterVo;

@Controller
@RequestMapping(value="/movie")
public class ReserveController {
	
	@Autowired
	private ReserveService reserve_service;
	private TheaterService theater_service;
	
	@RequestMapping(value="/reserve", method=RequestMethod.GET)
	public String reserveform() {
		return "movie/reservepage";
	}
	
	// 모든 위치 받아오는 코드
	@ResponseBody
	@RequestMapping(value="/selectheater", method=RequestMethod.POST)
	public ArrayList<TheaterVo> selectByTheater(){
		ArrayList<TheaterVo> list = (ArrayList<TheaterVo>) theater_service.selectTheater();
		return list;
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String selectByOneTheater(Model model, @RequestParam("search") String theatername) {
		TheaterVo vo = reserve_service.selectByOneTheater(theatername);
		if( vo == null) {
			model.addAttribute("theatervo", "해당하는 지점 영화관이 없습니다.");
		} else {
			model.addAttribute("theatervo", vo);
		}
		return "movie/reservepage";
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
