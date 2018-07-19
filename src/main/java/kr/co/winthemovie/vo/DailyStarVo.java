package kr.co.winthemovie.vo;

public class DailyStarVo {

	private int dailypoint;
	private int movieno;
	private String dailydate;
	private String naverstar;
	private String daumstar;
	private String rottenstar;
	private String imdbstar;
	private String yespeople;
	private String totalmoney;
	private String todaypeople;

	public int getDailypoint() {
		return dailypoint;
	}

	public void setDailypoint(int dailypoint) {
		this.dailypoint = dailypoint;
	}

	public int getMovieno() {
		return movieno;
	}

	public void setMovieno(int movieno) {
		this.movieno = movieno;
	}

	public String getDailydate() {
		return dailydate;
	}

	public void setDailydate(String dailydate) {
		this.dailydate = dailydate;
	}

	public String getNaverstar() {
		return naverstar;
	}

	public void setNaverstar(String naverstar) {
		this.naverstar = naverstar;
	}

	public String getDaumstar() {
		return daumstar;
	}

	public void setDaumstar(String daumstar) {
		this.daumstar = daumstar;
	}

	public String getRottenstar() {
		return rottenstar;
	}

	public void setRottenstar(String rottenstar) {
		this.rottenstar = rottenstar;
	}

	public String getImdbstar() {
		return imdbstar;
	}

	public void setImdbstar(String imdbstar) {
		this.imdbstar = imdbstar;
	}

	public String getYespeople() {
		return yespeople;
	}

	public void setYespeople(String yespeople) {
		this.yespeople = yespeople;
	}

	public String getTotalmoney() {
		return totalmoney;
	}

	public void setTotalmoney(String totalmoney) {
		this.totalmoney = totalmoney;
	}

	public String getTodaypeople() {
		return todaypeople;
	}

	public void setTodaypeople(String todaypeople) {
		this.todaypeople = todaypeople;
	}

	@Override
	public String toString() {
		return "DailyStarVo [dailypoint=" + dailypoint + ", movieno=" + movieno + ", dailydate=" + dailydate
				+ ", naverstar=" + naverstar + ", daumstar=" + daumstar + ", rottenstar=" + rottenstar + ", imdbstar="
				+ imdbstar + ", yespeople=" + yespeople + ", totalmoney=" + totalmoney + ", todaypeople=" + todaypeople
				+ "]";
	}
	
}
