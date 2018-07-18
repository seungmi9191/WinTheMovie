package kr.co.winthemovie.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import kr.co.winthemovie.vo.TheaterVo;

public class Trans {

	// 엑셀 파일 읽기 class
	public static ArrayList<String> transferfile(HttpServletRequest request) {
		ServletContext context = request.getSession().getServletContext();
		String path = context.getRealPath("WEB-INF/file/WinTheMovie.xls"); // 경로
		int sheetNumber =	 0;
		ArrayList<TheaterVo> list = new ArrayList<TheaterVo>();
		ArrayList<String> resultList = new ArrayList<String>();
		try {
			File file = new File(path);
			FileInputStream input = new FileInputStream(file);
			HSSFWorkbook hssf = new HSSFWorkbook(input);
			// XSSFWorkbook xssf = new XSSFWorkbook(input);

			HSSFSheet curSheet;
			HSSFRow curRow;
			HSSFCell curCell;

			sheetNumber = hssf.getNumberOfSheets();

			while (sheetNumber != 0) {
				sheetNumber--;
				curSheet = hssf.getSheetAt(sheetNumber);

				int row = curSheet.getPhysicalNumberOfRows();
				for (int i = 2; i < row; i++) {
					curRow = curSheet.getRow(i);
					String tmp = String.valueOf(curRow.getCell(18));
					resultList.add(tmp);
					System.out.println(curRow.getCell(18));
				}
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return resultList;
	}

	// 주소  -> 좌표 변환 class
	public static String transfer(ArrayList<String> resultList) {
		String clientId = "85K3LBTERGnPmOpMLKtu";
		String clientSecret = "iyb1kOidfo";
		String path = "https://openapi.naver.com/v1/map/geocode?query=";
		String result = "";
		try {
			for (int i = 0; i < resultList.size(); i++) {
				String addr = URLEncoder.encode(resultList.get(i), "UTF-8");
				String apiurl = path + addr;
				URL url = new URL(apiurl);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("X-Naver-Client-Id", clientId);
				con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
				int responsecode = con.getResponseCode();
				String lon = "";
				String lat = "";

				BufferedReader br;

				if (responsecode == 200) {
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				if (response != null) {
					if (response.indexOf("items") > -1) {
						lon = response.substring(response.indexOf("\"x\"") + 4, response.indexOf("\"x\"") + 16).trim();
						lat = response.substring(response.indexOf("\"y\"") + 4, response.indexOf("\"y\"") + 16).trim();
					}
				}
				br.close();

				result = lon + "," + lat;
				System.out.println(result);
			}

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}
	
	public static void CreateExcel(HttpServletRequest request) {
		ServletContext context = request.getSession().getServletContext();
		String path = context.getRealPath("WEB-INF/file/WinTheMovie.xls"); // 경로
		int sheetNumber = 0;
		try {
			File file = new File(path);
			HSSFWorkbook hssf = new HSSFWorkbook();
			FileInputStream input = new FileInputStream(file);
			HSSFSheet sheet = hssf.createSheet("TheaterList");
			
			HSSFSheet curSheet;
			HSSFRow curRow;
			HSSFRow createRow;
			HSSFCell curCell;

			sheetNumber = hssf.getNumberOfSheets();

			while (sheetNumber != 0) {
				sheetNumber--;
				curSheet = hssf.getSheetAt(sheetNumber);

				int row = curSheet.getPhysicalNumberOfRows();
				for (int i = 2; i < 10; i++) {
					curRow = curSheet.getRow(i);
					
					createRow = curSheet.createRow(i); 
					createRow.createCell(1).setCellValue(String.valueOf(curRow.getCell(2)));
					createRow.createCell(2).setCellValue(String.valueOf(curRow.getCell(3)));
					createRow.createCell(2).setCellValue(String.valueOf(curRow.getCell(14)));
					createRow.createCell(2).setCellValue(String.valueOf(curRow.getCell(18)));
				}
			}
			File outputfile = new File("D:/java/Theater.xls");
			FileOutputStream output = new FileOutputStream(outputfile);
			hssf.write(output);
			
			output.close();
			input.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
