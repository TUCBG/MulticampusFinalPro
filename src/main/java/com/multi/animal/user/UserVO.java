package com.multi.animal.user;

public class UserVO {
	private String userId;
	private String pw;
	private String name;
	private String address;
	private String phone;
	private String sigungu;
	private String sigunguCode;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getSigunguCode() {
		return sigunguCode;
	}
	public void setSigunguCode(String sigunguCode) {
		this.sigunguCode = sigunguCode;
	}
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", pw=" + pw + ", name=" + name + ", address=" + address + ", phone="
				+ phone + ", sigungu=" + sigungu + ", sigunguCode=" + sigunguCode + "]";
	}

	

}
