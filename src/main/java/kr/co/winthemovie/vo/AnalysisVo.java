package kr.co.winthemovie.vo;

public class AnalysisVo {

	private int analysisno;
	private int movieno;
	private String colldate;
	private String bookingrate;
	private String totalpeople;

	public int getAnalysisno() {
		return analysisno;
	}

	public void setAnalysisno(int analysisno) {
		this.analysisno = analysisno;
	}

	public int getMovieno() {
		return movieno;
	}

	public void setMovieno(int movieno) {
		this.movieno = movieno;
	}

	public String getColldate() {
		return colldate;
	}

	public void setColldate(String colldate) {
		this.colldate = colldate;
	}

	public String getBookingrate() {
		return bookingrate;
	}

	public void setBookingrate(String bookingrate) {
		this.bookingrate = bookingrate;
	}

	public String getTotalpeople() {
		return totalpeople;
	}

	public void setTotalpeople(String totalpeople) {
		this.totalpeople = totalpeople;
	}

	@Override
	public String toString() {
		return "AnalysisVo [analysisno=" + analysisno + ", movieno=" + movieno + ", colldate=" + colldate
				+ ", bookingrate=" + bookingrate + ", totalpeople=" + totalpeople + "]";
	}
	
}
