package kr.co.winthemovie.kobis;

import java.util.HashMap;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.winthemovie.util.GetTime;
import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

public class KobisAPI {
	
	public static HashMap<String, Object> kobis() throws OpenAPIFault, Exception{
		
		String key = "f8c8304f59b2c2708e80a56028caf37f"; // Kobis API Key
		String targetDt = "6";
		
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		String dailyResponse = service.getDailyBoxOffice(true, GetTime.today(), targetDt,null, null, null);
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);
		
		return dailyResult;
	}
}
