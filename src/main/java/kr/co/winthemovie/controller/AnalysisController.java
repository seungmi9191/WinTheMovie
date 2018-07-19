package kr.co.winthemovie.controller;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.winthemovie.util.InsertRating;
import kr.co.winthemovie.vo.AnalysisVo;

@Controller
@RequestMapping(value="/movie")
public class AnalysisController {
	
	@RequestMapping(value="/analysis", method=RequestMethod.GET)
	public String analysisform() {
		
		return "movie/analysis";
	}
	
	@ResponseBody
	@RequestMapping(value="/bookingrate", method=RequestMethod.GET)
	public ArrayList<AnalysisVo> bookingrate(HttpServletRequest request) {
		ServletContext context = request.getServletContext();
		String path = context.getRealPath("WEB-INF/file/movie_ticket.txt");
		InsertRating rating = new InsertRating();
		ArrayList<AnalysisVo> analysislist = rating.fileio(path);
		return analysislist;
	}
}
