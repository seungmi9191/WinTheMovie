package kr.co.winthemovie.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.winthemovie.vo.TheaterVo;

@Repository
public class TheaterDao {

	@Autowired
	private SqlSession sqlsession;

	// 극장 위치 DB에 저장하는 구문
	public void insertTheater(HashMap<String, Object> map) {
		ArrayList<TheaterVo> list = (ArrayList<TheaterVo>)map.get("theaterlist");
		for(TheaterVo vo : list)
			sqlsession.insert("theater.InsertByTheater", vo);
	}
	
	public List<TheaterVo> selectTheater(){
		ArrayList<TheaterVo> list = new ArrayList<TheaterVo>();
		return sqlsession.selectList("theater.SelectByTheater");
	}
}
