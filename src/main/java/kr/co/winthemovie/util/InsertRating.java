package kr.co.winthemovie.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import kr.co.winthemovie.vo.AnalysisVo;

public class InsertRating implements InsertAnalysis {

	@Override
	public ArrayList<AnalysisVo> fileio(String path) {

		ArrayList<AnalysisVo> analysisList = new ArrayList<AnalysisVo>();
		String line = "";
		String date = "";
		String movieRank = "";
		String movieName = "";
		int number = 0;
		
		try {
			File file = new File(path);
			FileReader fr = new FileReader(file);
			BufferedReader br = new BufferedReader(fr);
			
			while((line = br.readLine()) != null) {
				number ++;
				if(number == 1)
					date = line;
				else {
					AnalysisVo vo = new AnalysisVo();
					
					movieRank = line.split(",")[1]; // 순위
					movieName = line.split(",")[2]; // 영화 이름
					vo.setMovieno(Integer.parseInt(line.split(",")[0])); // 영화코드
					vo.setBookingrate(line.split(",")[3].split("%")[0]); // 예매율
					//vo.setTotalpeople(line.split(",")[4]); // 누적 관객수
					
					analysisList.add(vo);
				}
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return analysisList;
	}
}
