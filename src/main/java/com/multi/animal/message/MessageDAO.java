package com.multi.animal.message;

import java.util.List;

public interface MessageDAO {

	int insert(MessageVO messageVO);

	List<MessageVO> messageList(MessageVO messageVO);

	List<MessageVO> chatRoomList(MessageVO messageVO);

}