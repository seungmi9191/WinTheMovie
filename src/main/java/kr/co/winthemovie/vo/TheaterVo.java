
package kr.co.winthemovie.vo;

public class TheaterVo {

	private int theaterno;
	private int brandno;
	private String theatername;
	private String theateraddress;
	private String theaterxgps;
	private String theaterygps;
	
	private String brandname;
	private String brandlogo;
	private String playingtitme;
	private String playingdate;
	private String koname;
	private String enname;

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

	@Override
	public String toString() {
		return "TheaterVo [theaterno=" + theaterno + ", brandno=" + brandno + ", theatername=" + theatername
				+ ", theateraddress=" + theateraddress + ", theaterxgps=" + theaterxgps + ", theaterygps=" + theaterygps
				+ ", brandname=" + brandname + ", brandlogo=" + brandlogo + ", playingtitme=" + playingtitme
				+ ", playingdate=" + playingdate + ", koname=" + koname + ", enname=" + enname + "]";
	}

	public String getBrandname() {
		return brandname;
	}

	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}

	public String getBrandlogo() {
		return brandlogo;
	}

	public void setBrandlogo(String brandlogo) {
		this.brandlogo = brandlogo;
	}

	public String getPlayingtitme() {
		return playingtitme;
	}

	public void setPlayingtitme(String playingtitme) {
		this.playingtitme = playingtitme;
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

	public String getEnname() {
		return enname;
	}

	public void setEnname(String enname) {
		this.enname = enname;
	}
	
}

