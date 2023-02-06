package com.multi.animal.sitter;

public class FilterVO {
	private String species;
	private String care;
	private String dateStart;
	private String dateEnd;
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
	public String getDateStart() {
		return dateStart;
	}
	public void setDateStart(String dateStart) {
		this.dateStart = dateStart;
	}
	public String getDateEnd() {
		return dateEnd;
	}
	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}
	@Override
	public String toString() {
		return "FilterVO [species=" + species + ", care=" + care + ", dateStart=" + dateStart + ", dateEnd=" + dateEnd
				+ "]";
	}
	

	
	
}
