package kr.co.winthemovie.vo;

public class MovieReviewVo {
	
	private int nowplayingno;
	private int userno;
	private int movieno;
	private String koname;
	private int reviewnum;
	private String username;
	private int reviewno;
	private String content;
	private int reviewstar;
	private String addDate;
	private String email;
	
	public MovieReviewVo() {
	}
	
	public MovieReviewVo(int nowplayingno, int userno, int movieno, String koname, int reviewnum) {
		this.nowplayingno = nowplayingno;
		this.userno = userno;
		this.movieno = movieno;
		this.koname = koname;
		this.reviewnum = reviewnum;
	}

	public MovieReviewVo(int userno, int movieno, String username, int reviewno, String content, int reviewstar,
			String addDate, String email) {
		this.userno = userno;
		this.movieno = movieno;
		this.username = username;
		this.reviewno = reviewno;
		this.content = content;
		this.reviewstar = reviewstar;
		this.addDate = addDate;
		this.email = email;
	}
	
	public MovieReviewVo(int nowplayingno, int userno, int movieno, String koname, int reviewnum, String username,
			int reviewno, String content, int reviewstar, String addDate, String email) {
		this.nowplayingno = nowplayingno;
		this.userno = userno;
		this.movieno = movieno;
		this.koname = koname;
		this.reviewnum = reviewnum;
		this.username = username;
		this.reviewno = reviewno;
		this.content = content;
		this.reviewstar = reviewstar;
		this.addDate = addDate;
		this.email = email;
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

	public int getReviewnum() {
		return reviewnum;
	}

	public void setReviewnum(int reviewnum) {
		this.reviewnum = reviewnum;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getReviewno() {
		return reviewno;
	}

	public void setReviewno(int reviewno) {
		this.reviewno = reviewno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReviewstar() {
		return reviewstar;
	}

	public void setReviewstar(int reviewstar) {
		this.reviewstar = reviewstar;
	}

	public String getAddDate() {
		return addDate;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "MovieReviewVo [nowplayingno=" + nowplayingno + ", userno=" + userno + ", movieno=" + movieno
				+ ", koname=" + koname + ", reviewnum=" + reviewnum + ", username=" + username + ", reviewno="
				+ reviewno + ", content=" + content + ", reviewstar=" + reviewstar + ", addDate=" + addDate + ", Email="
				+ email + "]";
	}

}
