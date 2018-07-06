package kr.co.winthemovie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.winthemovie.dao.TheaterDao;
import kr.co.winthemovie.vo.TheaterVo;

@Service
public class TheaterService {
	
	@Autowired
	private TheaterDao dao;
	
	public TheaterVo search(String search) {
		return dao.search(search);
	}
}
