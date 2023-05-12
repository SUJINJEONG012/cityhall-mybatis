package com.mybatis.shopping.model;

public class OrderPageItemDto {
	
	/* 뷰로 부터 전달받을 값 */
	private int bookId;
	private int bookcount;
	
	/* DB로부터 꺼내올 값 */
	private String bookName;
	private int bookPrice;
	private double bookDiscount;
	
	/* 만들어 낼 값 */
	private int salePrice;
	private int totalPrice;
	private int point;
	private int totalPoint;
	
	
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getBookcount() {
		return bookcount;
	}
	public void setBookcount(int bookcount) {
		this.bookcount = bookcount;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}
	public double getBookDiscount() {
		return bookDiscount;
	}
	public void setBookDiscount(double bookDiscount) {
		this.bookDiscount = bookDiscount;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	
	
	public void initSaleTotal() {
		this.salePrice = (int) (this.bookPrice * (1- this.bookDiscount));
		this.totalPrice = this.salePrice * this.bookcount;
		this.point= (int) Math.floor(this.salePrice* 0.05);
		this.totalPoint = this.point * this.bookcount;	
	}
	
	
	@Override
	public String toString() {
		return "OrderPageItemDto [bookId=" + bookId + ", bookcount=" + bookcount + ", bookName=" + bookName
				+ ", bookPrice=" + bookPrice + ", bookDiscount=" + bookDiscount + ", salePrice=" + salePrice
				+ ", totalPrice=" + totalPrice + ", point=" + point + ", totalPoint=" + totalPoint + "]";
	}	
	
	
}