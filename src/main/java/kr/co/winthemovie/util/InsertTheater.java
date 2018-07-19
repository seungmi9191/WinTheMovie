package kr.co.winthemovie.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import kr.co.winthemovie.vo.TheaterVo;

public class InsertTheater {

	public static ArrayList<TheaterVo> TheaterFileIO(String path) {
		ArrayList<TheaterVo> theaterlist = new ArrayList<TheaterVo>();
		
		try {
			File file = new File(path);
			FileInputStream inputStream = new FileInputStream(file);
			//HSSFWorkbook hworkbook = new HSSFWorkbook(inputStream);
			XSSFWorkbook hworkbook = new XSSFWorkbook(inputStream);
			DataFormatter formatter = new DataFormatter();
			//HSSFSheet curSheet;
			//HSSFCell curCell;
			//HSSFRow curRow;
			XSSFSheet curSheet;
			XSSFCell curCell;
			XSSFRow curRow;
			int sheetNumber = hworkbook.getNumberOfSheets();
			System.out.println("sheetnumber : "+sheetNumber);
			
			while (sheetNumber != 0) {
				sheetNumber--;
				curSheet = hworkbook.getSheetAt(sheetNumber);
				int row = curSheet.getPhysicalNumberOfRows();
				System.out.println("row : "+ row);
				for (int i = 0; i < row; i++) {
					TheaterVo vo = new TheaterVo();
					curRow = curSheet.getRow(i);
					vo.setTheaterno(Integer.valueOf(String.valueOf(formatter.formatCellValue(curRow.getCell(0)))));
					vo.setBrandno(Integer.valueOf(String.valueOf(formatter.formatCellValue(curRow.getCell(1)))));
					vo.setTheatername(String.valueOf(curRow.getCell(2)));
					vo.setTheateraddress(String.valueOf(curRow.getCell(3)));
					vo.setTheaterxgps(String.valueOf(curRow.getCell(4)));
					vo.setTheaterygps(String.valueOf(curRow.getCell(5)));
					
					theaterlist.add(vo);
				}
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return theaterlist;
	}

}
