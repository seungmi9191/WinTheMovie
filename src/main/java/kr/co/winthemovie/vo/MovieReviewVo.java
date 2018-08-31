package kr.co.winthemovie.vo;

public class MovieReviewVo {
	
	private int nowplayingno;
	private int userno;
	private int movieno;
	private String koname;
	
	public MovieReviewVo() {
	}

	public MovieReviewVo(int nowplayingno, int userno, int movieno, String koname) {
		this.nowplayingno = nowplayingno;
		this.userno = userno;
		this.movieno = movieno;
		this.koname = koname;
	}

	public int getNowplayingno() {
		return nowplayingno;
	}

	public void setNowplayingno(int nowplayingno) {
		this.nowplayingno = nowplayingno;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getMovieno() {
		return movieno;
	}

	public void setMovieno(int movieno) {
		this.movieno = movieno;
	}

	public String getKoname() {
		return koname;
	}

	public void setKoname(String koname) {
		this.koname = koname;
	}

	@Override
	public String toString() {
		return "MovieReviewVo [nowplayingno=" + nowplayingno + ", userno=" + userno + ", movieno=" + movieno
				+ ", koname=" + koname + "]";
	}
}
