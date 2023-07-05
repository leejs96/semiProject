package product;

import java.sql.Date;

public class ProductVO {
	private int PCode;
	private String 	PName;
	private int price;
	private int stock;
	private String category;
	private int PKG;
	private Date PDate;
	private String PImg;
	
	
	public int getPCode() {
		return PCode;
	}
	public void setPCode(int pCode) {
		PCode = pCode;
	}
	public String getPName() {
		return PName;
	}
	public void setPName(String pName) {
		PName = pName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPKG() {
		return PKG;
	}
	public void setPKG(int pKG) {
		PKG = pKG;
	}
	public Date getPDate() {
		return PDate;
	}
	public void setPDate(Date pDate) {
		PDate = pDate;
	}
	public String getPImg() {
		return PImg;
	}
	public void setPImg(String pImg) {
		PImg = pImg;
	}
	
}
