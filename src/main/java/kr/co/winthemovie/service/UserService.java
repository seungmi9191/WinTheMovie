package kr.co.winthemovie.service;

import kr.co.winthemovie.dao.UserDao;
import kr.co.winthemovie.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
 
    @Autowired
    private UserDao userDao;
 
    public int userJoin(UserVo userVo){
        int userJoin = userDao.join(userVo);
        return userJoin;
    }
 
    public boolean emailcheck(String id){
        boolean flag = false;
 
        String str = userDao.emailcheck(id);
        if(str == null){
            flag = true;
        }else{
            flag = false;
        }
        return flag;
    }
 
    public UserVo login(UserVo userVo){
        return userDao.login(userVo);
    }
 
 
}