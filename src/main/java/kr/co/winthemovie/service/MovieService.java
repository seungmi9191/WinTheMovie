package kr.co.winthemovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.winthemovie.dao.MovieDao;
import kr.co.winthemovie.vo.NowpVo;


@Service
public class MovieService {
	
	@Autowired
	private MovieDao movieDao;
	
	public List<NowpVo> getTheaterList() {
		return movieDao.getTheaterList();
	}
}
