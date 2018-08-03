package kr.co.winthemovie.vo;

public class QuickReserveVo {
	int movieno;
	int roomno;
	int theaterno;
	int grade;
	String playingtime;
	String playingdate;
	String koname;
	String poster;
	String theatername;
	int seatcount;

	public QuickReserveVo(int movieno, int roomno, int theaterno, int grade, String playingtime, String playingdate,
			String koname, String poster, String theatername, int seatcount) {
		this.movieno = movieno;
		this.roomno = roomno;
		this.theaterno = theaterno;
		this.grade = grade;
		this.playingtime = playingtime;
		this.playingdate = playingdate;
		this.koname = koname;
		this.poster = poster;
		this.theatername = theatername;
		this.seatcount = seatcount;
	}

	public QuickReserveVo() {
	}

	public int getMovieno() {
		return movieno;
	}

	public void setMovieno(int movieno) {
		this.movieno = movieno;
	}

	public int getRoomno() {
		return roomno;
	}

	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}

	public int getTheaterno() {
		return theaterno;
	}

	public void setTheaterno(int theaterno) {
		this.theaterno = theaterno;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
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

	public String getKoname() {
		return koname;
	}

	public void setKoname(String koname) {
		this.koname = koname;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getTheatername() {
		return theatername;
	}

	public void setTheatername(String theatername) {
		this.theatername = theatername;
	}

	public int getSeatcount() {
		return seatcount;
	}

	public void setSeatcount(int seatcount) {
		this.seatcount = seatcount;
	}

	@Override
	public String toString() {
		return "QuickReserveVo{" + "movieno=" + movieno + ", roomno=" + roomno + ", theaterno=" + theaterno + ", grade="
				+ grade + ", playingtime='" + playingtime + '\'' + ", playingdate='" + playingdate + '\'' + ", koname='"
				+ koname + '\'' + ", poster='" + poster + '\'' + ", theatername='" + theatername + '\'' + ", seatcount="
				+ seatcount + '}';
	}
}