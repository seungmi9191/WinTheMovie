package kr.co.winthemovie.service;

import kr.co.winthemovie.dao.UserDao;
import kr.co.winthemovie.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public int userJoin(UserVo userVo) {
        int userJoin = userDao.join(userVo);
        System.out.println("-----service----");
        return userJoin;
    }

    public boolean emailcheck(String email) {
        System.out.println("am i here");
        boolean flag = false;
        String str = userDao.emailcheck(email);
        if (str == null) {
            flag = true;
        } else {
            flag = false;
        }
        System.out.println(flag);
        return flag;
    }

    public UserVo login(UserVo userVo) {


        return userDao.login(userVo);
    }

    public UserVo loginbysns(UserVo userVo) {
        return userDao.loginbysns(userVo);
    }


}
