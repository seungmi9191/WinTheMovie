package kr.co.winthemovie.util;

import java.util.ArrayList;

import kr.co.winthemovie.vo.AnalysisVo;
import kr.co.winthemovie.vo.TheaterVo;

public interface InsertAnalysis {
	
	public ArrayList<AnalysisVo> fileio(String path);
}
