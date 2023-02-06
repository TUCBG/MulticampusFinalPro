package com.multi.animal.adopt;

public class PageVO {
	private int start;
	private int end;
	private int page;
	
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

	@Override
	public String toString() {
		return "PageVO [start=" + start + ", end=" + end + ", page=" + page + "]";
	}

}
