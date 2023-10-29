package member;

import java.sql.Date;

public class MemberVO {
	private String ID;
	private String PASSWORD;
	private String PET_NAME;
	private String PET_GENDER;
	private String PET_YY;
	private int PET_MONTH;
	private String USER_PHONE;
	private Date JOIN_DAY;
	private String HOME_ADD;
	private String USER_EMAIL;
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getPET_NAME() {
		return PET_NAME;
	}
	public void setPET_NAME(String pET_NAME) {
		PET_NAME = pET_NAME;
	}
	public String getPET_YY() {
		return PET_YY;
	}
	public void setPET_YY(String pET_YY) {
		PET_YY = pET_YY;
	}
	public String getUSER_PHONE() {
		return USER_PHONE;
	}
	public void setUSER_PHONE(String uSER_PHONE) {
		USER_PHONE = uSER_PHONE;
	}
	public Date getJOIN_DAY() {
		return JOIN_DAY;
	}
	public void setJOIN_DAY(Date jOIN_DAY) {
		JOIN_DAY = jOIN_DAY;
	}
	public String getHOME_ADD() {
		return HOME_ADD;
	}
	public void setHOME_ADD(String hOME_ADD) {
		HOME_ADD = hOME_ADD;
	}
	public String getUSER_EMAIL() {
		return USER_EMAIL;
	}
	public void setUSER_EMAIL(String uSER_EMAIL) {
		USER_EMAIL = uSER_EMAIL;
	}
	public String getPET_GENDER() {
		return PET_GENDER;
	}
	public void setPET_GENDER(String pET_GENDER) {
		PET_GENDER = pET_GENDER;
	}
	public int getPET_MONTH() {
		return PET_MONTH;
	}
	public void setPET_MONTH(int pET_MONTH) {
		PET_MONTH = pET_MONTH;
	}
	
	
}
