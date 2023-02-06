package com.multi.animal.expert;

public class ExpertVO {
	private String userId;
	private String species;
	private String care;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	@Override
	public String toString() {
		return "ExpertVO [userId=" + userId + ", species=" + species + ", care=" + care + "]";
	}
	
}
