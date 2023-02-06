package com.multi.animal.expert;

//서버가 각각의 클라이언트에게 배포할 내용을 넣는 역할
public class OutputMessage2 {

	private String from;
	private String text;
	private String menu;

	public OutputMessage2() {
	}

	
	public OutputMessage2(String from, String text, String menu) {
		super();
		this.from = from;
		this.text = text;
		this.menu = menu;
	}

	public OutputMessage2(String menu) {
		super();
		this.menu = menu;
	}


	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}


	@Override
	public String toString() {
		return "OutputMessage2 [from=" + from + ", text=" + text + ", menu=" + menu + "]";
	}
	
	

}