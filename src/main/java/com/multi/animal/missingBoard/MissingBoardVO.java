package com.multi.animal.missingBoard;

import java.util.Date;

public class MissingBoardVO {
	private int missingId;
	private String userId;
	private String title;
	private String location;
	private String tel;
	private String pet;
	private Date createAt;
	private String description;
	private int gratuity;
	private String img1;
	private String img2;
	private String img3;
	private int rule;
	private String missingDate;
	public int getMissingId() {
		return missingId;
	}
	public void setMissingId(int missingId) {
		this.missingId = missingId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPet() {
		return pet;
	}
	public void setPet(String pet) {
		this.pet = pet;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getGratuity() {
		return gratuity;
	}
	public void setGratuity(int gratuity) {
		this.gratuity = gratuity;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public int getRule() {
		return rule;
	}
	public void setRule(int rule) {
		this.rule = rule;
	}
	public String getMissingDate() {
		return missingDate;
	}
	public void setMissingDate(String missingDate) {
		this.missingDate = missingDate;
	}
	@Override
	public String toString() {
		return "MissingBoardVO [missingId=" + missingId + ", userId=" + userId + ", title=" + title + ", location="
				+ location + ", tel=" + tel + ", pet=" + pet + ", createAt=" + createAt + ", description=" + description
				+ ", gratuity=" + gratuity + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3 + ", rule=" + rule
				+ ", missingDate=" + missingDate + "]";
	}

	

}
