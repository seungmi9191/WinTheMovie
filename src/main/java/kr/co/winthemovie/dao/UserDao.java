package kr.co.winthemovie.dao;

import kr.co.winthemovie.vo.UserVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public class UserDao {
    @Autowired
    private SqlSession sqlsession;

    public int join(UserVo userVo) {
        System.out.println("----다오다오-----");
        if(userVo.getUserpw()!=null) {
            int result = sqlsession.insert("users.joinbyemail", userVo);
            return result;
        }else{
            int result = sqlsession.insert("users.joinbynaver",userVo);
            return result;
        }
    }


    public String emailcheck(String email) {
        System.out.println("dao 들어온 emailcheck=" + email);
        String result = sqlsession.selectOne("users.emailcheck", email);
        System.out.println(("dao 결과물 = " + result));
        return result;
    }

    public UserVo login(UserVo userVo) {
        System.out.println("dao 들어온 login email=" + userVo.toString());
        UserVo vo = sqlsession.selectOne("users.login", userVo);
        System.out.println("dao 나왔습니다" + vo.toString());
        return vo;
    }

    public UserVo loginbynaver(UserVo userVo) {
        System.out.println("dao 들어온 login email=" + userVo.toString());
        UserVo vo = sqlsession.selectOne("users.loginbynaver", userVo);
        System.out.println("naverlogin dao 나왔습니다" + vo.toString());
        return vo;
    }
}
