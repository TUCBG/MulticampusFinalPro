package com.multi.animal.adopt;

import java.util.Date;

public class AdoptPageVO {
	private int start;
	private int end;
	private int page;
	private int adoptId;
	private String userId;
	private Date date;
	private String pet;
	private String variety;
	private String noGender;
	private String gender;
	private int weight;
	private String fPlace;
	private String pPlace;
	private String tel;
	private String special;
	private String img;
	private int finish;

	@Override
	public String toString() {
		return "AdoptPageVO [start=" + start + ", end=" + end + ", page=" + page + ", adoptId=" + adoptId + ", userId="
				+ userId + ", date=" + date + ", pet=" + pet + ", variety=" + variety + ", noGender=" + noGender
				+ ", gender=" + gender + ", weight=" + weight + ", fPlace=" + fPlace + ", pPlace=" + pPlace + ", tel="
				+ tel + ", special=" + special + ", img=" + img + ", finish=" + finish + "]";
	}

	
	public void setStartEnd(int page) {
		start = 1 + (page - 1) * 6;
		end = page * 6;
		
		// 1page = 1(1 + 5 * 0) ~ 5(5 * 1)
		// 2page = 6(1 + 5 * 1) ~ 10(5 * 2)
		// 3page = 11(1 + 5 * 2) ~ 15(5 * 3)
		// ... nPage = (1 + 5 * { (n - 1) * 5}) ~ 5 * n
		// --> n = page 
	}
	
	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getAdoptId() {
		return adoptId;
	}

	public void setAdoptId(int adoptId) {
		this.adoptId = adoptId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getPet() {
		return pet;
	}

	public void setPet(String pet) {
		this.pet = pet;
	}

	public String getVariety() {
		return variety;
	}

	public void setVariety(String variety) {
		this.variety = variety;
	}

	public String getNoGender() {
		return noGender;
	}

	public void setNoGender(String noGender) {
		this.noGender = noGender;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getfPlace() {
		return fPlace;
	}

	public void setfPlace(String fPlace) {
		this.fPlace = fPlace;
	}

	public String getpPlace() {
		return pPlace;
	}

	public void setpPlace(String pPlace) {
		this.pPlace = pPlace;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getSpecial() {
		return special;
	}

	public void setSpecial(String special) {
		this.special = special;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getFinish() {
		return finish;
	}

	public void setFinish(int finish) {
		this.finish = finish;
	}
}
