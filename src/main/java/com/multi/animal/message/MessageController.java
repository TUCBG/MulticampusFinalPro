package com.multi.animal.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {

	@Autowired
	MessageService messageService;

	@RequestMapping("message/insert")
	public void insert(MessageVO messageVO) {
		messageService.insert(messageVO);
	}

	// ws프로토콜로 요청을 받음.
	@MessageMapping("/chat")
	@SendTo("/market/messages")
	public MessageVO send(MessageVO messageVO) {
		//System.out.println(messageService.send(messageVO));
		return messageService.send(messageVO);// return데이터는 json으로 만들어서 클라이언트 브라우저에 보냄.
	}

	@RequestMapping("message/messageList")
	public void messageList(MessageVO messageVO, Model model) {
		//System.out.println(messageService.messageList(messageVO));
		model.addAttribute("list", messageService.messageList(messageVO));
	}

	@RequestMapping("message/chatRoomList")
	public void chatRoomList(MessageVO messageVO, Model model) {
		//System.out.println(messageService.chatRoomList(messageVO));
		model.addAttribute("list", messageService.chatRoomList(messageVO));

	}
}
