package com.multi.animal.message;

public class MessageVO {
	int message_no;
	int messageId;
	int marketId;
	String sessionId;
	String messageSender;
	String messageTaker;
	String messageContent;
	String partner;
	String title;
	String price;
	String img;
	String time;
	public int getMessage_no() {
		return message_no;
	}
	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public int getMarketId() {
		return marketId;
	}
	public void setMarketId(int marketId) {
		this.marketId = marketId;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getMessageSender() {
		return messageSender;
	}
	public void setMessageSender(String messageSender) {
		this.messageSender = messageSender;
	}
	public String getMessageTaker() {
		return messageTaker;
	}
	public void setMessageTaker(String messageTaker) {
		this.messageTaker = messageTaker;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public String getPartner() {
		return partner;
	}
	public void setPartner(String partner) {
		this.partner = partner;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "MessageVO [message_no=" + message_no + ", messageId=" + messageId + ", marketId=" + marketId
				+ ", sessionId=" + sessionId + ", messageSender=" + messageSender + ", messageTaker=" + messageTaker
				+ ", messageContent=" + messageContent + ", partner=" + partner + ", title=" + title + ", price="
				+ price + ", img=" + img + ", time=" + time + "]";
	}
	
	

}
