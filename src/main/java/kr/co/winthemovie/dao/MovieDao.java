package kr.co.winthemovie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.winthemovie.vo.NowpVo;


@Repository
public class MovieDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<NowpVo> getTheaterList() {
		return sqlSession.selectList("movie.getTheaterList");
	}


}
