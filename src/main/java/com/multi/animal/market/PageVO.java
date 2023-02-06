package com.multi.animal.market;

public class PageVO {
	String region; // 카테고리
	String category; // 카테고리
	String keyword;
	int pageNumber; // 해당 페이지 번호
	int firstPostNumber; // 해당 페이지 첫 게시물 번호
	int lastPostNumber; // 해당 페이지 마지막 게시물 번호
	int numberOfPages; // 총 페이지 수
	int pageSize; // 한 페이지당 최대 게시물 수

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getFirstPostNumber() {
		return firstPostNumber;
	}

	public void setFirstPostNumber(int firstPostNumber) {
		this.firstPostNumber = firstPostNumber;
	}

	public int getLastPostNumber() {
		return lastPostNumber;
	}

	public void setLastPostNumber(int lastPostNumber) {
		this.lastPostNumber = lastPostNumber;
	}

	public int getNumberOfPages() {
		return numberOfPages;
	}

	public void setNumberOfPages(int numberOfPages) {
		this.numberOfPages = numberOfPages;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setFirstLast(int[] firstLast) {
		firstPostNumber = firstLast[0];
		lastPostNumber = firstLast[1];
	}

	@Override
	public String toString() {
		return "PageVO [region=" + region + ", category=" + category + ", keyword=" + keyword + ", pageNumber="
				+ pageNumber + ", firstPostNumber=" + firstPostNumber + ", lastPostNumber=" + lastPostNumber
				+ ", numberOfPages=" + numberOfPages + ", pageSize=" + pageSize + "]";
	}

}
