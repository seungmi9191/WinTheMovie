package kr.co.winthemovie.service;

import java.util.List;

import kr.co.winthemovie.dao.MovieDao;
import kr.co.winthemovie.vo.QuickReserveVo;
import kr.co.winthemovie.vo.SeatVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.winthemovie.dao.ReserveDao;
import kr.co.winthemovie.vo.QuickReserveVo;
import kr.co.winthemovie.vo.TheaterVo;

import java.util.List;
import java.util.Map;

@Service
public class ReserveService {
	
	@Autowired
	private ReserveDao dao;
	
	public List<TheaterVo> selectByTheater(String address){
		return dao.selectByTheater(address);
	}
	
	public List<TheaterVo> selectByOneTheater(int theaterno) {
		return dao.selectByOneTheater(theaterno);
	}
	
	public QuickReserveVo getQuickReserve(int nowplayingno){
		return dao.getQuickReserve(nowplayingno);
	}

	public List<SeatVo> getIsSeat(int nowplayingno){
		return dao.getIsSeat(nowplayingno);
	}
}
