package kr.co.winthemovie.controller;// 네이버 지도 API 예제 - 주소좌표변환
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

@Controller
public class JusoController {

    @ResponseBody
    @RequestMapping(value = "/juso", method = {RequestMethod.GET, RequestMethod.POST})
    public HashMap<String, String> juso(@RequestParam String getAddr , Model model) {
        String clientId = "29ED47vcAOiiJdxtOrrS";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "ZO_EGQVw9Y";//애플리케이션 클라이언트 시크릿값";
        try {
            String addr = URLEncoder.encode(getAddr, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/map/geocode?query=" + addr; //json
            //String apiURL = "https://openapi.naver.com/v1/map/geocode.xml?query=" + addr; // xml
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            JSONParser jsonparser = new JSONParser();
            JSONObject jsonobject = (JSONObject)jsonparser.parse(String.valueOf(response));
            JSONObject json1 = (JSONObject)jsonobject.get("result");
            JSONArray json2 = (JSONArray)json1.get("items");

            HashMap<String,String> map = new HashMap<String,String>();


            for(int i=0; i<json2.size();i++){
                JSONObject json3 = (JSONObject)json2.get(i);
                JSONObject json4 = (JSONObject) json3.get("point");

                System.out.println("point x= " + json4.get("x"));
                System.out.println("point y= " + json4.get("y"));
                map.put("userX", String.valueOf(json4.get("x")));
                map.put("userY", String.valueOf(json4.get("y")));
            }

            System.out.println(map.get("userX"));
            return map;
        } catch (Exception e) {
            System.out.println(e);
        }

        return null;
    }
}