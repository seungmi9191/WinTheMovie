package kr.co.winthemovie.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.winthemovie.vo.TheaterVo;

@Repository
public class TheaterDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public TheaterVo search(String search) {
		return sqlsession.selectOne("reserve.SelectByTheater", search);
	}
}
