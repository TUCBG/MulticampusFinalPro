package com.multi.animal.market;

import java.sql.Date;

public class MarketVO {
	int market_No;
	int marketId;
	String title;
	String region;
	String content;
	String writer;
	Date date;
	String category;
	String price;
	String img;
	String place;

	public int getMarket_No() {
		return market_No;
	}

	public void setMarket_No(int market_No) {
		this.market_No = market_No;
	}

	public int getMarketId() {
		return marketId;
	}

	public void setMarketId(int marketId) {
		this.marketId = marketId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	@Override
	public String toString() {
		return "MarketVO [market_No=" + market_No + ", marketId=" + marketId + ", title=" + title + ", region=" + region
				+ ", content=" + content + ", writer=" + writer + ", date=" + date + ", category=" + category
				+ ", price=" + price + ", img=" + img + ", place=" + place + "]";
	}

}
