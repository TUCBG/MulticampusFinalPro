package com.multi.animal;

public class FilterVO {
	private String pet;
	private String location;
	private int start;
	private int end;
	private int page;

	public String getPet() {
		return pet;
	}

	public void setPet(String pet) {
		this.pet = pet;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setStartEnd(int page) {
		start = 1 + (page - 1) * 4;
		end = page * 4;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
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

	@Override
	public String toString() {
		return "FilterVO [pet=" + pet + ", location=" + location + ", start=" + start + ", end=" + end + ", page="
				+ page + "]";
	}
	
}
