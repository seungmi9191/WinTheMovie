package kr.co.winthemovie.naver;

import java.io.IOException;
import javax.servlet.http.HttpSession;

//import com.fasterxml.jackson.core.*;
//import com.fasterxml.jackson.core.type.TypeReference;
//import com.fasterxml.jackson.databind.JsonMappingException;
//import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.winthemovie.controller.UserController;
import kr.co.winthemovie.naver.NaverLoginBO;

import kr.co.winthemovie.vo.UserVo;
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


/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {

    /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;

    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    @Autowired
    UserController userController;

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

        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        model.addAttribute("result", apiResult);

        /* 네이버 로그인 성공 페이지 View 호출 */

        JSONParser jsonparser = new JSONParser();
        System.out.println(apiResult);
        JSONObject jsonobject = (JSONObject)jsonparser.parse(apiResult);

        JSONObject json =  (JSONObject) jsonobject.get("response");

        String email = (String) json.get("email");
        String age = (String) json.get("age");
        String username = (String)json.get("name");

        UserVo userVo = new UserVo(email,username);

        boolean email_check = false;
        email_check = userController.emailcheck(email);
        if (email_check == false) {
            userController.login(userVo, session);
            return "users/naverSuccess";
        }else if(email_check == true){
            userController.joinbyemail(userVo);
            userController.login(userVo, session);
        }
        return "users/naverSuccess";
    }
}