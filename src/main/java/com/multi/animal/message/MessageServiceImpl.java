package com.multi.animal.message;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	MessageDAO messageDAO;
	
	@Override
	public int insert(MessageVO messageVO) {
		messageVO.setTime(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy년 M월 d일 a h시 m분")));
		messageVO.setMessageContent(messageVO.getMessageContent().replaceAll("\n", "<br>"));
		return messageDAO.insert(messageVO);
	}
	
	@Override
	public MessageVO send(MessageVO messageVO) {
		messageVO.setTime(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy년 M월 d일 a h시 m분")));
		messageVO.setMessageContent(messageVO.getMessageContent().replaceAll("\n", "<br>"));
		return messageVO; 
	}

	@Override
	public List<MessageVO> messageList(MessageVO messageVO) {
		return messageDAO.messageList(messageVO);
	}

	@Override
	public List<MessageVO> chatRoomList(MessageVO messageVO) {
		return messageDAO.chatRoomList(messageVO);
	}
}
