package com.multi.animal.sitter;

public class SitterVO {
	private int sitterId;
	private String reserve;
	private String species;
	private String care;
	private String date;
	private int animals;
	private String comment;
	private String img;
	private String sitterTel;
	
	private String userId;
	
	
	public int getSitterId() {
		return sitterId;
	}



	public void setSitterId(int sitterId) {
		this.sitterId = sitterId;
	}



	public String getReserve() {
		return reserve;
	}



	public void setReserve(String reserve) {
		this.reserve = reserve;
	}



	public String getSpecies() {
		return species;
	}



	public void setSpecies(String species) {
		this.species = species;
	}



	public String getCare() {
		return care;
	}



	public void setCare(String care) {
		this.care = care;
	}



	public String getDate() {
		return date;
	}



	public void setDate(String date) {
		this.date = date;
	}



	public int getAnimals() {
		return animals;
	}



	public void setAnimals(int animals) {
		this.animals = animals;
	}



	public String getComment() {
		return comment;
	}



	public void setComment(String comment) {
		this.comment = comment;
	}



	public String getImg() {
		return img;
	}



	public void setImg(String img) {
		this.img = img;
	}



	public String getSitterTel() {
		return sitterTel;
	}



	public void setSitterTel(String sitterTel) {
		this.sitterTel = sitterTel;
	}



	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}



	@Override
	public String toString() {
		return "SitterVO [sitterId=" + sitterId + ", reserve=" + reserve + ", species=" + species + ", care=" + care
				+ ", date=" + date + ", animals=" + animals + ", comment=" + comment + ", img=" + img + ", SitterTel="
				+ sitterTel + ", userId=" + userId + "]";
	}
	
	
	
}
