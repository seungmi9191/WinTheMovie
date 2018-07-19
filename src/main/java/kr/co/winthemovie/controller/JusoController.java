package kr.co.winthemovie.controller;
import kr.co.winthemovie.service.JusoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
public class JusoController {

    @Autowired
    private JusoService jusoService;

    @ResponseBody
    @RequestMapping(value = "/juso", method = {RequestMethod.GET, RequestMethod.POST})
    public HashMap<String, String> juso(@RequestParam String getAddr) {

        HashMap<String,String> map = jusoService.getAddr(getAddr);
        return map;
    }
}