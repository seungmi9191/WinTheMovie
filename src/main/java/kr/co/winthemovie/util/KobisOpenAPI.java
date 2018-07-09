package kr.co.winthemovie.util;

import java.util.HashMap;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

// KOBIS OPENT API
public class KobisOpenAPI {
	
	public static HashMap<String, Object> kobis() throws OpenAPIFault, Exception {
		String key = "f8c8304f59b2c2708e80a56028caf37f"; // 영화진흥위원회 API 키
		String itemPerPage = "6"; // 보이고 싶은 등수까지 1~6위 까지
		
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		
		String dailyResponse = service.getDailyBoxOffice(true, today_time.today(), itemPerPage, null, null, null);
		
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);
		return dailyResult;
	}
}
/*
 * today_time.today() 메소드는 어제 날짜를 가져 오는 메소드 
 * 
 */