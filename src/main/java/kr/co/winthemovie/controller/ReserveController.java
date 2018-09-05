package kr.co.winthemovie.controller;

import java.util.ArrayList;
import java.util.List;


import com.sun.xml.internal.bind.v2.model.annotation.Quick;
import kr.co.winthemovie.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.winthemovie.service.ReserveService;
import kr.co.winthemovie.service.TheaterService;
import kr.co.winthemovie.vo.QuickReserveVo;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/movie")
public class ReserveController {
	
	@Autowired
	private ReserveService reserve_service;
	private TheaterService theater_service;
	
	@RequestMapping(value="/reserve", method=RequestMethod.GET)
	public String reserveform() {
		return "movie/reservepage";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectOneTheater", method=RequestMethod.GET)
	public ArrayList<TheaterVo> selectByOneTheater(@RequestParam("theaterno") int theaterno) {
		ArrayList<TheaterVo> list = (ArrayList<TheaterVo>)reserve_service.selectByOneTheater(theaterno);
		return list;
	}
	
	// 모든 위치 받아오는 코드
	@ResponseBody
	@RequestMapping(value="/selectheater", method=RequestMethod.POST)
	public ArrayList<TheaterVo> selectByTheater(){
		ArrayList<TheaterVo> list = (ArrayList<TheaterVo>) theater_service.selectTheater();
		return list;
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

    @RequestMapping(value = "/reserve_quick", method = {RequestMethod.GET, RequestMethod.POST})
    public String reserve_final(Model model, int nowplayingno) {

		UserVo authUser = new UserVo();
        QuickReserveVo quickreservevo = reserve_service.getQuickReserve(nowplayingno);
        List<SeatVo> seatVoList = reserve_service.getIsSeat(nowplayingno);

        model.addAttribute("quickreservevo", quickreservevo);
        model.addAttribute("seatVo", seatVoList);

		ArrayList<SeatVo> seatVoArrayList = (ArrayList<SeatVo>) reserve_service.getIsSeat(nowplayingno);
		model.addAttribute("seatVoArrayList",seatVoArrayList);
		model.addAttribute("nowplayingno",nowplayingno);

		return "movie/reserve_final";

	}

}
