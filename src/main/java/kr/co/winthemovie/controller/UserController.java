package kr.co.winthemovie.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.winthemovie.service.UserService;
import kr.co.winthemovie.vo.UserVo;

@Controller
@RequestMapping(value="/user")
public class UserController {
 
    @Autowired
    private UserService userService;

    @RequestMapping(value="/join",method = RequestMethod.GET)
    public String joinform(){
        return "user/register_prev";
    }

    @RequestMapping(value="/register",method = RequestMethod.GET)
    public String joinbyemailform(){
        return "user/register";
    }

    @RequestMapping(value = "/joinbyemail",method = RequestMethod.POST)
    public String joinbyemail(@ModelAttribute UserVo userVo){
        System.out.println(userVo.toString());
        userService.userJoin(userVo);
        return "user/login";
    }

    @RequestMapping(value = "/joinbynaver2",method = RequestMethod.POST)
    public String loginbynaver(@ModelAttribute UserVo userVo){
        System.out.println(userVo.toString());
        userService.loginbynaver(userVo);
        return "user/login";
    }

    @RequestMapping(value = "/loginform",method = RequestMethod.GET)
    public String loginform(){
        return "user/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@ModelAttribute UserVo userVo, HttpSession session){

        System.out.println("login controller:" + userVo.toString());
        UserVo authUser = userService.login(userVo);
        if(authUser !=null){
            session.setAttribute("authUser",authUser);
            return "redirect: /main";
        }else{
            return "redirect: user/login";
        }
    }
    @ResponseBody
    @RequestMapping(value = "/emailcheck",method = RequestMethod.POST)
    public boolean emailcheck(@RequestParam("email") String email){
        System.out.println("email 체크하러 컨트롤 입장");
        boolean result = userService.emailcheck(email);
        System.out.println("email체크 결과="+result);
        return result;
    }

    @RequestMapping(value = "/joinbynaver", method = RequestMethod.POST)
    public void joinbynaver(@ModelAttribute UserVo userVo){
        System.out.println(userVo.toString());
        userService.userJoin(userVo);
//        return "user/login";
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/main";
    }

//    @RequestMapping(value = "/callback",method = RequestMethod.POST)
//    public void registerbyapi(String access_token){
//        System.out.println("access_tk = "+access_token);
//    }

}
