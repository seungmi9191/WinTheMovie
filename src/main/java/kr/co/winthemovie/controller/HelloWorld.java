package kr.co.winthemovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HelloWorld {
    @RequestMapping("/main")
    public String helloController() {
        System.out.println("/hellospring/hello");
        return "main/main";
    }

    @RequestMapping(value = "/callback")
    public String navLogin(HttpServletRequest request) throws Exception {
        System.out.println("call back man");
        return "user/callback";
    }

}
