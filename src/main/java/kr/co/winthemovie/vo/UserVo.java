package kr.co.winthemovie.vo;

public class UserVo {

    private int userno;
    private String email;
    private String userpw;
    private String username;
    private String phone;
    private String regdate;
    private String authority;
    private String userx;
    private String usery;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserx() {
        return userx;
    }

    public void setUserx(String userx) {
        this.userx = userx;
    }

    public String getUsery() {
        return usery;
    }

    public void setUsery(String usery) {
        this.usery = usery;
    }

    public int getUserno() {
        return userno;
    }

    public void setUserno(int userno) {
        this.userno = userno;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserpw() {
        return userpw;
    }

    public void setUserpw(String userpw) {
        this.userpw = userpw;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public UserVo(int userno, String email, String userpw, String username, String phone, String regdate, String authority, String userx, String usery) {
        this.userno = userno;
        this.email = email;
        this.userpw = userpw;
        this.username = username;
        this.phone = phone;
        this.regdate = regdate;
        this.authority = authority;
        this.userx = userx;
        this.usery = usery;
    }

    public UserVo() {
    }

    public UserVo(String email, String username){
        this.email = email;
        this.username = username;
    }

    @Override
    public String toString() {
        return "UserVo{" +
                "userno=" + userno +
                ", email='" + email + '\'' +
                ", userpw='" + userpw + '\'' +
                ", username='" + username + '\'' +
                ", phone='" + phone + '\'' +
                ", regdate='" + regdate + '\'' +
                ", authority='" + authority + '\'' +
                ", userx='" + userx + '\'' +
                ", usery='" + usery + '\'' +
                '}';
    }
}
