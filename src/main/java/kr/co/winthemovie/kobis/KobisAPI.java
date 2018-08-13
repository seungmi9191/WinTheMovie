package kr.co.winthemovie.kobis;

import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.winthemovie.util.GetTime;
import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

public class KobisAPI {
	
	private static String key = "f8c8304f59b2c2708e80a56028caf37f"; // Kobis API Key
	
	public static HashMap<String, Object> kobis(int number) throws OpenAPIFault, Exception {

		String targetDt = "7";
		String response = null;
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		if (number == 1) {
			response = service.getDailyBoxOffice(true, GetTime.today(), targetDt, null, null, null);
//			JSONParser parser = new JSONParser();
//			JSONObject jsonobj = (JSONObject)parser.parse(response.toString());
//			JSONObject boxOfficeResult = (JSONObject) jsonobj.get("boxOfficeResult");
//			JSONArray array = (JSONArray) boxOfficeResult.get("dailyBoxOfficeList");
//			
//			for(int i=0;i<array.size();i++) {
//				JSONObject obj = (JSONObject) array.get(i);
//				String movieNm = (String) obj.get("movieNm");
//				movieInfo(movieNm);
//			}
		} else {
			response = service.getWeeklyBoxOffice(true, GetTime.today(), "10", "0", null, null, null);
		}
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> result = mapper.readValue(response, HashMap.class);

		return result;
	}
	
//	public static HashMap<String, Object> movieInfo2(int movieCd) throws OpenAPIFault, Exception {
//		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
//		String moiveCode = String.valueOf(movieCd);
//		String response = null;
//		
//		response = service.getMovieInfo(true, moiveCode);
//		ObjectMapper mapper = new ObjectMapper();
//		HashMap<String, Object> result = mapper.readValue(response, HashMap.class);
//		
//		return result;
//	}
	
//	public static HashMap<String, Object> movieInfo(String moviename) throws OpenAPIFault, Exception {
//		
//		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
//		String response = null;
//		
//		response = service.getMovieList(true, "1", "10", moviename, null, null, null, null, null, null, null);
//		
//		JSONParser parser = new JSONParser();
//		JSONObject jsonobj = (JSONObject)parser.parse(response.toString());
//		JSONObject movieListResult = (JSONObject)jsonobj.get("movieListResult");
//		JSONArray movieList = (JSONArray) movieListResult.get("movieList");
//		
//		JSONObject result = (JSONObject) movieList.get(0);
//		String movieCd = (String) result.get("movieCd");
//		
//		response = service.getMovieInfo(true, movieCd);
//		
//		jsonobj = (JSONObject) parser.parse(response.toString());
//		JSONObject movieInfoResult = (JSONObject) jsonobj.get("movieInfoResult");
//		JSONObject movieInfo = (JSONObject) movieInfoResult.get("movieInfo");
//		JSONArray audits = (JSONArray) movieInfo.get("audits");
//		JSONObject auditNo = (JSONObject) audits.get(0);
//		String watchGradeNm = (String) auditNo.get("watchGradeNm");
//		System.out.println(watchGradeNm);
//		
//		return result;
//	}
}
