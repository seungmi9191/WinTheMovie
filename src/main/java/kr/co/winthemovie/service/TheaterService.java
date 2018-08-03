package kr.co.winthemovie.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.winthemovie.dao.TheaterDao;
import kr.co.winthemovie.vo.TheaterVo;

@Service
public class TheaterService {
	
	@Autowired
	private TheaterDao dao;
	
	//  극장 위치 DB에 저장하는 구문
	public void insertTheater(ArrayList<TheaterVo> list) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("theaterlist", list);
		dao.insertTheater(map);
	}
	
	public List<TheaterVo> selectTheater(){
		return dao.selectTheater();
	}
}
