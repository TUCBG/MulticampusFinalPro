package com.multi.animal.expert;

//서버가 각각의 클라이언트에게 배포할 내용을 넣는 역할
public class OutputMessage {

	private String menu;

	public OutputMessage() {
	}

	
	public OutputMessage(String from, String text, String menu) {
		super();
		this.menu = menu;
	}

	public OutputMessage(String menu) {
		super();
		this.menu = menu;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}


	@Override
	public String toString() {
		return "OutputMessage2 [menu=" + menu + "]";
	}
	
	

}