package com.multi.animal.expert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class WebSocketController {
	
	@Autowired
	ExpertService es;
	
	@MessageMapping("/expert")
	@SendTo("/market/messages2")
	public OutputMessage2 send2(Message message, ExpertVO expertvo) {
		String menu = "";
		switch (message.getText()) {
		case "처음으로":
			menu = "전문시터등록      전문시터추천";
			break;
		case "전문시터등록": case "전문 시터 등록": case "전문시터 등록":
			menu = "다른 이용자에게 회원님의 개인정보를 제공, 추천하는 것에 동의하시나요?<br>"
					+ "동의 &nbsp 처음으로";
			break;
		case "동의":
			menu = "다른 회원에게 어떤 전문 시터로 추천되고 싶으신가요?<br>" +
						"강아지전문시터 &nbsp 고양이전문시터 &nbsp 처음으로";
			break;
		case "강아지전문시터": case "강아지 전문 시터": case "강아지 전문시터":
			menu = "강아지전문시터를 선택하셨습니다.<br>돌봄을 골라주세요.<br>"
					+ "강아지산책전문시터	 &nbsp 강아지방문전문시터 &nbsp 처음으로";
			break;
		case "강아지산책전문시터": case "강아지 산책전문시터": case "강아지 산책 전문시터": case "강아지 산책 전문 시터":
			// mongodb에 {species : 강아지, care : 산책, userId : userId} insert
			expertvo.setSpecies("강아지");
			expertvo.setCare("산책");
			expertvo.setUserId(message.getFrom());
			es.insert(expertvo);
			
			menu = "강아지산책전문시터로 등록되셨습니다.<br>"
					+ "처음으로";
			break;
		case "강아지방문전문시터": case "강아지 방문전문시터": case "강아지 방문 전문시터": case "강아지 방문 전문 시터":
			// mongodb에 {species : 강아지, care : 방문, userId : userId} insert
			expertvo.setSpecies("강아지");
			expertvo.setCare("방문");
			expertvo.setUserId(message.getFrom());
			es.insert(expertvo);
			
			menu = "강아지방문전문시터로 등록되셨습니다.<br>"
					+ "처음으로";
			break;
		case "고양이전문시터": case "고양이 전문 시터": case "고양이 전문시터":
			// mongodb에 {species : 고양이, userId : userId} insert
			expertvo.setSpecies("고양이");
			expertvo.setUserId(message.getFrom());
			es.insert(expertvo);
			
			menu = "고양이전문시터로 등록되셨습니다.<br>"
					+ "처음으로";
			break;
		case "전문시터추천": case "전문시터 추천": case "전문 시터 추천":
			menu = "아직 개발중인 메뉴입니다.<br>"
					+ "처음으로";
			break;
		default:
			menu = "죄송합니다. 다른 방식으로 입력해주세요.";
			break;
		}
		OutputMessage2 outputmessage2 = new OutputMessage2(menu);
		return outputmessage2;
	}
}
