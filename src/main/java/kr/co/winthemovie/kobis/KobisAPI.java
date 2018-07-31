package kr.co.winthemovie.kobis;

import java.util.HashMap;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.winthemovie.util.GetTime;
import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

public class KobisAPI {
	
	public static HashMap<String, Object> kobis(int number) throws OpenAPIFault, Exception{
		
		String key = "f8c8304f59b2c2708e80a56028caf37f"; // Kobis API Key
		String targetDt = "6";
		String response = null;
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		if(number == 1) {
			response = service.getDailyBoxOffice(true, GetTime.today(), targetDt,null, null, null);
		}else {
			response = service.getWeeklyBoxOffice(true, GetTime.today(), "10", "0", null, null, null);
		}
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> dailyResult = mapper.readValue(response, HashMap.class);
		
		return dailyResult;
	}
}
