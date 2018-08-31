package kr.co.winthemovie.vo;

public class DetailViewVo {

	private int nowplayingno;
	private String playingtime;
	private String playingdate;
	private int roomno;
	private int theaterno;
	private String theatername;
	private String theateraddress;
	private String theaterxgps;
	private String theaterygps;
	private int screen;
	private String brandname;
	private int brandNo;
	private String brandlogo;
	private int movieno;
	private int directorno;
	private int actorno;
	private String koname;
	private String enname;
	private int grade;
	private String genre;
	private String story;
	private String openning;
	private String poster;
	private String runtime;
	private String actorname;
	private String directorname;
	private int stillno;
	private String stillname;
	private String savename;
	private int stillnum;
	private int stillmvno;
	private String stillmvname;
	private String stillmvurl;
	private int stillmvnum;
	private String stillmvimg;
	
	public DetailViewVo() {
	}

	public DetailViewVo(int nowplayingno, String playingtime, String playingdate, int roomno, int theaterno,
			String theatername, String theateraddress, String theaterxgps, String theaterygps, int screen,
			String brandname, int brandNo, String brandlogo, int movieno, int directorno, int actorno, String koname,
			String enname, int grade, String genre, String story, String openning, String poster, String runtime,
			String actorname, String directorname, int stillno, String stillname, String savename) {
		this.nowplayingno = nowplayingno;
		this.playingtime = playingtime;
		this.playingdate = playingdate;
		this.roomno = roomno;
		this.theaterno = theaterno;
		this.theatername = theatername;
		this.theateraddress = theateraddress;
		this.theaterxgps = theaterxgps;
		this.theaterygps = theaterygps;
		this.screen = screen;
		this.brandname = brandname;
		this.brandNo = brandNo;
		this.brandlogo = brandlogo;
		this.movieno = movieno;
		this.directorno = directorno;
		this.actorno = actorno;
		this.koname = koname;
		this.enname = enname;
		this.grade = grade;
		this.genre = genre;
		this.story = story;
		this.openning = openning;
		this.poster = poster;
		this.runtime = runtime;
		this.actorname = actorname;
		this.directorname = directorname;
		this.stillno = stillno;
		this.stillname = stillname;
		this.savename = savename;
	}

	public DetailViewVo(int nowplayingno, String playingtime, String playingdate, int roomno, int theaterno,
			String theatername, String theateraddress, String theaterxgps, String theaterygps, int screen,
			String brandname, int brandNo, String brandlogo, int movieno, int directorno, int actorno, String koname,
			String enname, int grade, String genre, String story, String openning, String poster, String runtime,
			String actorname, String directorname, int stillno, String stillname, String savename, int stillnum,
			int stillmvno, String stillmvname, String stillmvurl, int stillmvnum) {
		this.nowplayingno = nowplayingno;
		this.playingtime = playingtime;
		this.playingdate = playingdate;
		this.roomno = roomno;
		this.theaterno = theaterno;
		this.theatername = theatername;
		this.theateraddress = theateraddress;
		this.theaterxgps = theaterxgps;
		this.theaterygps = theaterygps;
		this.screen = screen;
		this.brandname = brandname;
		this.brandNo = brandNo;
		this.brandlogo = brandlogo;
		this.movieno = movieno;
		this.directorno = directorno;
		this.actorno = actorno;
		this.koname = koname;
		this.enname = enname;
		this.grade = grade;
		this.genre = genre;
		this.story = story;
		this.openning = openning;
		this.poster = poster;
		this.runtime = runtime;
		this.actorname = actorname;
		this.directorname = directorname;
		this.stillno = stillno;
		this.stillname = stillname;
		this.savename = savename;
		this.stillnum = stillnum;
		this.stillmvno = stillmvno;
		this.stillmvname = stillmvname;
		this.stillmvurl = stillmvurl;
		this.stillmvnum = stillmvnum;
	}

	public DetailViewVo(int movieno, int stillmvno, String stillmvname, String stillmvurl, String stillmvimg) {
		this.movieno = movieno;
		this.stillmvno = stillmvno;
		this.stillmvname = stillmvname;
		this.stillmvurl = stillmvurl;
		this.stillmvimg = stillmvimg;
	}

	public int getNowplayingno() {
		return nowplayingno;
	}

	public void setNowplayingno(int nowplayingno) {
		this.nowplayingno = nowplayingno;
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

	public String getTheatername() {
		return theatername;
	}

	public void setTheatername(String theatername) {
		this.theatername = theatername;
	}

	public String getTheateraddress() {
		return theateraddress;
	}

	public void setTheateraddress(String theateraddress) {
		this.theateraddress = theateraddress;
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

	public int getScreen() {
		return screen;
	}

	public void setScreen(int screen) {
		this.screen = screen;
	}

	public String getBrandname() {
		return brandname;
	}

	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}

	public int getBrandNo() {
		return brandNo;
	}

	public void setBrandNo(int brandNo) {
		this.brandNo = brandNo;
	}

	public String getBrandlogo() {
		return brandlogo;
	}

	public void setBrandlogo(String brandlogo) {
		this.brandlogo = brandlogo;
	}

	public int getMovieno() {
		return movieno;
	}

	public void setMovieno(int movieno) {
		this.movieno = movieno;
	}

	public int getDirectorno() {
		return directorno;
	}

	public void setDirectorno(int directorno) {
		this.directorno = directorno;
	}

	public int getActorno() {
		return actorno;
	}

	public void setActorno(int actorno) {
		this.actorno = actorno;
	}

	public String getKoname() {
		return koname;
	}

	public void setKoname(String koname) {
		this.koname = koname;
	}

	public String getEnname() {
		return enname;
	}

	public void setEnname(String enname) {
		this.enname = enname;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
	}

	public String getOpenning() {
		return openning;
	}

	public void setOpenning(String openning) {
		this.openning = openning;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getRuntime() {
		return runtime;
	}

	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}

	public String getActorname() {
		return actorname;
	}

	public void setActorname(String actorname) {
		this.actorname = actorname;
	}

	public String getDirectorname() {
		return directorname;
	}

	public void setDirectorname(String directorname) {
		this.directorname = directorname;
	}

	public int getStillno() {
		return stillno;
	}

	public void setStillno(int stillno) {
		this.stillno = stillno;
	}

	public String getStillname() {
		return stillname;
	}

	public void setStillname(String stillname) {
		this.stillname = stillname;
	}

	public String getSavename() {
		return savename;
	}

	public void setSavename(String savename) {
		this.savename = savename;
	}

	public int getStillnum() {
		return stillnum;
	}

	public void setStillnum(int stillnum) {
		this.stillnum = stillnum;
	}

	public int getStillmvno() {
		return stillmvno;
	}

	public void setStillmvno(int stillmvno) {
		this.stillmvno = stillmvno;
	}

	public String getStillmvname() {
		return stillmvname;
	}

	public void setStillmvname(String stillmvname) {
		this.stillmvname = stillmvname;
	}

	public String getStillmvurl() {
		return stillmvurl;
	}

	public void setStillmvurl(String stillmvurl) {
		this.stillmvurl = stillmvurl;
	}

	public int getStillmvnum() {
		return stillmvnum;
	}

	public void setStillmvnum(int stillmvnum) {
		this.stillmvnum = stillmvnum;
	}

	public String getStillmvimg() {
		return stillmvimg;
	}

	public void setStillmvimg(String stillmvimg) {
		this.stillmvimg = stillmvimg;
	}

	@Override
	public String toString() {
		return "DetailViewVo [nowplayingno=" + nowplayingno + ", playingtime=" + playingtime + ", playingdate="
				+ playingdate + ", roomno=" + roomno + ", theaterno=" + theaterno + ", theatername=" + theatername
				+ ", theateraddress=" + theateraddress + ", theaterxgps=" + theaterxgps + ", theaterygps=" + theaterygps
				+ ", screen=" + screen + ", brandname=" + brandname + ", brandNo=" + brandNo + ", brandlogo="
				+ brandlogo + ", movieno=" + movieno + ", directorno=" + directorno + ", actorno=" + actorno
				+ ", koname=" + koname + ", enname=" + enname + ", grade=" + grade + ", genre=" + genre + ", story="
				+ story + ", openning=" + openning + ", poster=" + poster + ", runtime=" + runtime + ", actorname="
				+ actorname + ", directorname=" + directorname + ", stillno=" + stillno + ", stillname=" + stillname
				+ ", savename=" + savename + ", stillnum=" + stillnum + ", stillmvno=" + stillmvno + ", stillmvname="
				+ stillmvname + ", stillmvurl=" + stillmvurl + ", stillmvnum=" + stillmvnum + ", stillmvimg="
				+ stillmvimg + "]";
	}

}
