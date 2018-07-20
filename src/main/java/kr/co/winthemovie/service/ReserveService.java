package kr.co.winthemovie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.winthemovie.dao.ReserveDao;
import kr.co.winthemovie.vo.TheaterVo;

@Service
public class ReserveService {
	
	@Autowired
	private ReserveDao dao;
	
	public TheaterVo selectByOneTheater(String theatername) {
		return dao.selectByOneTheater(theatername);
	}
}
