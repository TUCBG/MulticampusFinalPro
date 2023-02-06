package com.multi.animal.message;

import java.util.List;

public interface MessageService {

	int insert(MessageVO messageVO);

	MessageVO send(MessageVO messageVO);

	List<MessageVO> messageList(MessageVO messageVO);

	List<MessageVO> chatRoomList(MessageVO messageVO);

}