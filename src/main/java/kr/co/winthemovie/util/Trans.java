package kr.co.winthemovie.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class Trans {

	private static String clientId = "85K3LBTERGnPmOpMLKtu";
	private static String clientSecret = "iyb1kOidfo";
	private static String path = "https://openapi.naver.com/v1/map/geocode?query=";
	private static String search = "https://openapi.naver.com/v1/search/local?query=";

	public static void search_Region(String keyword) {
		BufferedReader br;
		String inputLine;
		StringBuffer response = new StringBuffer();
		System.out.println(keyword);
		try {
			String addr = URLEncoder.encode(keyword, "UTF-8");
			String apiURL = search + addr;
			URL url = new URL(apiURL);

			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			System.out.println(response.toString());
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(String.valueOf(response));
			JSONArray jsonArray = (JSONArray) jsonObject.get("items");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static HashMap<String, String> transfer(String address) {
		HashMap<String, String> map = new HashMap<String, String>();

		try {
			String addr = URLEncoder.encode(address, "UTF-8");
			String apiURL = path + addr;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			JSONParser jsonparser = new JSONParser();
			JSONObject jsonobject = (JSONObject) jsonparser.parse(String.valueOf(response));
			JSONObject json1 = (JSONObject) jsonobject.get("result");
			JSONArray json2 = (JSONArray) json1.get("items");

			for (int i = 0; i < json2.size(); i++) {
				JSONObject json3 = (JSONObject) json2.get(i);
				JSONObject json4 = (JSONObject) json3.get("point");

				map.put("userX", String.valueOf(json4.get("x")));
				map.put("userY", String.valueOf(json4.get("y")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public static String transferSi(int number) {
		String result = "";
		switch (number) {
		case 1:
			result = "서울특별시";
			break;
		case 2:
			result = "부산광역시";
			break;
		case 3:
			result = "대구광역시";
			break;
		case 4:
			result = "인천광역시";
			break;
		case 5:
			result = "광주광역시";
			break;
		case 6:
			result = "대전광역시";
			break;
		case 7:
			result = "울산광역시";
			break;
		case 8:
			result = "세종시";
			break;
		case 9:
			result = "경기도";
			break;
		case 10:
			result = "강원도";
			break;
		case 11:
			result = "충청북도";
			break;
		case 12:
			result = "충청남도";
			break;
		case 13:
			result = "전라북도";
			break;
		case 14:
			result = "전라남도";
			break;
		case 15:
			result = "경상북도";
			break;
		case 16:
			result = "경상남도";
			break;
		case 17:
			result = "제주도";
			break;
		}
		return result;
	}
}
