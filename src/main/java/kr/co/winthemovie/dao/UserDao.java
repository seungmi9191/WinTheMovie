package kr.co.winthemovie.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.winthemovie.vo.UserVo;

@Repository
public class UserDao {
	@Autowired
	private SqlSession sqlsession;

	public int join(UserVo userVo) {
		if (userVo.getUserpw() != null) {
			int result = sqlsession.insert("users.joinbyemail", userVo);
			return result;
		} else {
			int result = sqlsession.insert("users.joinbynaver", userVo);
			return result;
		}
	}

	public String emailcheck(String email) {
		String result = sqlsession.selectOne("users.emailcheck", email);
		return result;
	}

	public UserVo login(UserVo userVo) {
		UserVo vo = sqlsession.selectOne("users.login", userVo);
		return vo;
	}

	public UserVo loginbysns(UserVo userVo) {
		UserVo vo = sqlsession.selectOne("users.loginbynaver", userVo);
		return vo;
	}
}