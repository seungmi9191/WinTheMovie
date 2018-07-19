package kr.co.winthemovie.vo;

public class TheaterVo {
	
	private int theaterno;
	private int brandno;
	private String theatername;
	private String theaterlocate;
	private String theatergps;
	private String brandname;
	private String brandlogo;
	
	public TheaterVo() {
	}

	public TheaterVo(int theaterno, int brandno, String theatername, String theaterlocate, String theatergps) {
		this.theaterno = theaterno;
		this.brandno = brandno;
		this.theatername = theatername;
		this.theaterlocate = theaterlocate;
		this.theatergps = theatergps;
	}

	public TheaterVo(int theaterno, int brandno, String theatername, String theaterlocate, String theatergps,
			String brandname, String brandlogo) {
		this.theaterno = theaterno;
		this.brandno = brandno;
		this.theatername = theatername;
		this.theaterlocate = theaterlocate;
		this.theatergps = theatergps;
		this.brandname = brandname;
		this.brandlogo = brandlogo;
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

	public String getTheatergps() {
		return theatergps;
	}

	public void setTheatergps(String theatergps) {
		this.theatergps = theatergps;
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

	@Override
	public String toString() {
		return "TheaterVo [theaterno=" + theaterno + ", brandno=" + brandno + ", theatername=" + theatername
				+ ", theaterlocate=" + theaterlocate + ", theatergps=" + theatergps + ", brandname=" + brandname
				+ ", brandlogo=" + brandlogo + "]";
	}
}