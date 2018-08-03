package kr.co.winthemovie.dao;

import java.util.List;

import kr.co.winthemovie.vo.QuickReserveVo;
import kr.co.winthemovie.vo.SeatVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.winthemovie.vo.TheaterVo;

import java.util.List;

@Repository
public class ReserveDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<TheaterVo> selectByTheater(String address) {
		return sqlsession.selectList("theater.SelectByReserveTheater", address);
	}
	
	public List<TheaterVo> selectByOneTheater(int theaterno) {
		return sqlsession.selectList("theater.SelectByOneTheater", theaterno);
	}

	public QuickReserveVo getQuickReserve(int nowplayingno){
		return sqlsession.selectOne("movie.getQuickReserve",nowplayingno);
	}

	public List<SeatVo> getIsSeat(int nowplayingno){
		return sqlsession.selectList("movie.getIsSeat",nowplayingno);
	}
}
