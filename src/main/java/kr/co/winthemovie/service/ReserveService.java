package kr.co.winthemovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.winthemovie.dao.ReserveDao;
import kr.co.winthemovie.vo.TheaterVo;

@Service
public class ReserveService {
	
	@Autowired
	private ReserveDao dao;
	
	public List<TheaterVo> selectByTheater(String address){
		return dao.selectByTheater(address);
	}
}
