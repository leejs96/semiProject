package product;

import java.sql.Date;

public class ProductVO {
	private int PCODE;
	private String 	PNAME;
	private int PRICE;
	private int STOCK;
	private String CATEGORY;
	private float PKG;
	private Date PDATE;
	private String PIMG;
	private String ANIMAL;
	private String SUB_CATEGORY;
	
	
	public int getPCODE() {
		return PCODE;
	}
	public void setPCODE(int pCODE) {
		PCODE = pCODE;
	}
	public String getPNAME() {
		return PNAME;
	}
	public void setPNAME(String pNAME) {
		PNAME = pNAME;
	}
	public int getPRICE() {
		return PRICE;
	}
	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}
	public int getSTOCK() {
		return STOCK;
	}
	public void setSTOCK(int sTOCK) {
		STOCK = sTOCK;
	}
	public String getCATEGORY() {
		return CATEGORY;
	}
	public void setCATEGORY(String cATEGORY) {
		CATEGORY = cATEGORY;
	}
	public float getPKG() {
		return PKG;
	}
	public void setPKG(float pKG) {
		PKG = pKG;
	}
	public Date getPDATE() {
		return PDATE;
	}
	public void setPDATE(Date pDATE) {
		PDATE = pDATE;
	}
	public String getPIMG() {
		return PIMG;
	}
	public void setPIMG(String pIMG) {
		PIMG = pIMG;
	}
	public String getANIMAL() {
		return ANIMAL;
	}
	public void setANIMAL(String aNIMAL) {
		ANIMAL = aNIMAL;
	}
	public String getSUB_CATEGORY() {
		return SUB_CATEGORY;
	}
	public void setSUB_CATEGORY(String sUB_CATEGORY) {
		SUB_CATEGORY = sUB_CATEGORY;
	}
	
}
