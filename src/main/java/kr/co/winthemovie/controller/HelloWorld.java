package kr.co.winthemovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloWorld {
	@RequestMapping( "/hello")
    public String helloController(){
        System.out.println("/hellospring/hello");
        return "/WEB-INF/views/main.jsp";
    }
}
