package kr.co.winthemovie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.winthemovie.vo.TheaterVo;

@Repository
public class ReserveDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<TheaterVo> selectByTheater(String address) {
		return sqlsession.selectList("theater.SelectByReserveTheater", address);
	}
	
}
