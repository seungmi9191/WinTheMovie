package kr.co.winthemovie.vo;

public class SeatVo {

    private int isSeat;
    private String seatname;

    public SeatVo() {
    }

    public SeatVo(int isSeat, String seatname) {

        this.isSeat = isSeat;
        this.seatname = seatname;
    }

    @Override
    public String toString() {
        return "SeatVo{" +
                "isSeat=" + isSeat +
                ", seatname='" + seatname + '\'' +
                '}';
    }

    public int getIsSeat() {
        return isSeat;
    }

    public void setIsSeat(int isSeat) {
        this.isSeat = isSeat;
    }

    public String getSeatname() {
        return seatname;
    }

    public void setSeatname(String seatname) {
        this.seatname = seatname;
    }
}
