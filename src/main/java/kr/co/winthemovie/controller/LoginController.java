package kr.co.winthemovie.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

//import com.fasterxml.jackson.core.*;
//import com.fasterxml.jackson.core.type.TypeReference;
//import com.fasterxml.jackson.databind.JsonMappingException;
//import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.winthemovie.BO.NaverLoginBO;

import kr.co.winthemovie.BO.NaverLoginBO2;
import kr.co.winthemovie.vo.UserVo;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import static com.sun.javafx.fxml.expression.KeyPath.parse;


/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {

    /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private NaverLoginBO2 naverLoginBO2;
    private String apiResult = null;

    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    @Autowired
    UserController userController;

    @Autowired
    UserVo userVo;

    //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "/users/naverlogin", method = {RequestMethod.GET, RequestMethod.POST})
    public String login(Model model, HttpSession session) {

        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

        System.out.println("네이버:" + naverAuthUrl);

        //네이버
        model.addAttribute("url", naverAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
        return "users/naverLogin";
    }

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/users/callback.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException, ParseException {
        System.out.println("여기는 callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        System.out.println("access token = " + oauthToken.getAccessToken());
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        model.addAttribute("result", apiResult);
        System.out.println("result : " + apiResult);
        /* 네이버 로그인 성공 페이지 View 호출 */
        System.out.println("투스트링 : " + apiResult.toString());

        JSONParser jsonparser = new JSONParser();
        JSONObject jsonobject = (JSONObject)jsonparser.parse(apiResult);
        System.out.println(jsonobject);
        JSONObject json =  (JSONObject) jsonobject.get("response");
        System.out.println(json);

        String email = (String) json.get("email");
        String age = (String) json.get("age");
        String username = (String)json.get("name");
        System.out.println("email: "+email+" age: "+age+" name: "+username);

        if(userController.emailcheck(email)==true){
            System.out.println("사용할 수 있는 이메일입니다.");
        };

        userVo = new UserVo(email,username);

        System.out.println(userVo.toString());

        userController.joinbyemail(userVo);
        System.out.println("여긴 오니?");

        return "users/naverSuccess";
    }


}