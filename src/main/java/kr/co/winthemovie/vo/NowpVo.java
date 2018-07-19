package kr.co.winthemovie.vo;

public class NowpVo {
	
	private int nowplayingno;
	private int roomno;
	private int movieno;
	private String playingtime;
	private String playingdate;
	private String poster;
	private int theaterno;
	private int brandno;
	private String theatername;
	private String theaterlocate;
	private String theaterxgps;
	private String theaterygps;
	private String brandlogo;
	private String brandname;
	
	public NowpVo() {
	}

	public NowpVo(int nowplayingno, int roomno, int movieno, String playingtime, String playingdate, String poster,
			int theaterno, int brandno, String theatername, String theaterlocate, String theaterxgps,
			String theaterygps, String brandlogo, String brandname) {
		this.nowplayingno = nowplayingno;
		this.roomno = roomno;
		this.movieno = movieno;
		this.playingtime = playingtime;
		this.playingdate = playingdate;
		this.poster = poster;
		this.theaterno = theaterno;
		this.brandno = brandno;
		this.theatername = theatername;
		this.theaterlocate = theaterlocate;
		this.theaterxgps = theaterxgps;
		this.theaterygps = theaterygps;
		this.brandlogo = brandlogo;
		this.brandname = brandname;
	}

	public int getNowplayingno() {
		return nowplayingno;
	}

	public void setNowplayingno(int nowplayingno) {
		this.nowplayingno = nowplayingno;
	}

	public int getRoomno() {
		return roomno;
	}

	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}

	public int getMovieno() {
		return movieno;
	}

	public void setMovieno(int movieno) {
		this.movieno = movieno;
	}

	public String getPlayingtime() {
		return playingtime;
	}

	public void setPlayingtime(String playingtime) {
		this.playingtime = playingtime;
	}

	public String getPlayingdate() {
		return playingdate;
	}

	public void setPlayingdate(String playingdate) {
		this.playingdate = playingdate;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public int getTheaterno() {
		return theaterno;
	}

	public void setTheaterno(int theaterno) {
		this.theaterno = theaterno;
	}

	public int getBrandno() {
		return brandno;
	}

	public void setBrandno(int brandno) {
		this.brandno = brandno;
	}

	public String getTheatername() {
		return theatername;
	}

	public void setTheatername(String theatername) {
		this.theatername = theatername;
	}

	public String getTheaterlocate() {
		return theaterlocate;
	}

	public void setTheaterlocate(String theaterlocate) {
		this.theaterlocate = theaterlocate;
	}

	public String getTheaterxgps() {
		return theaterxgps;
	}

	public void setTheaterxgps(String theaterxgps) {
		this.theaterxgps = theaterxgps;
	}

	public String getTheaterygps() {
		return theaterygps;
	}

	public void setTheaterygps(String theaterygps) {
		this.theaterygps = theaterygps;
	}

	public String getBrandlogo() {
		return brandlogo;
	}

	public void setBrandlogo(String brandlogo) {
		this.brandlogo = brandlogo;
	}

	public String getBrandname() {
		return brandname;
	}

	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}

	@Override
	public String toString() {
		return "NowpVo [nowplayingno=" + nowplayingno + ", roomno=" + roomno + ", movieno=" + movieno + ", playingtime="
				+ playingtime + ", playingdate=" + playingdate + ", poster=" + poster + ", theaterno=" + theaterno
				+ ", brandno=" + brandno + ", theatername=" + theatername + ", theaterlocate=" + theaterlocate
				+ ", theaterxgps=" + theaterxgps + ", theaterygps=" + theaterygps + ", brandlogo=" + brandlogo
				+ ", brandname=" + brandname + "]";
	}
	
	

}
