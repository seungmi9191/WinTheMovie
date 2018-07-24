package kr.co.winthemovie.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;

import kr.co.winthemovie.service.ReserveService;
import kr.co.winthemovie.service.TheaterService;
import kr.co.winthemovie.util.Trans;
import kr.co.winthemovie.vo.TheaterVo;

@Controller
@RequestMapping(value="/movie")
public class ReserveController {
	
	@Autowired
	private ReserveService reserve_service;
	@Autowired
	private TheaterService theater_service;
	
	@RequestMapping(value="/reserve", method=RequestMethod.GET)
	public String reserveform(Model model) {
		
		ArrayList<TheaterVo> list = (ArrayList<TheaterVo>)theater_service.selectTheater();
		model.addAttribute("theater_list", list);
		return "movie/reservepage";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String selectByTheater(Model model, @RequestParam("search") String search, 
			@RequestParam(value="si")int address_si, @RequestParam(value="gu")String address_gu) {
		String address = Trans.transferSi(address_si) +" "+address_gu;
		return "movie/reservepage";
	}
}
