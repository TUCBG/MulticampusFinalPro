package com.multi.animal.message;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
@Component
public class MessageDAOImpl implements MessageDAO {
	@Autowired
	SqlSessionTemplate my;
	
	@Override
	public int insert(MessageVO messageVO) {
		return my.insert("message.insert", messageVO);
	}
	
	@Override
	public List<MessageVO> messageList(MessageVO messageVO){
		return my.selectList("message.messageList", messageVO);
	}
	@Override
	public List<MessageVO> chatRoomList(MessageVO messageVO){
		return my.selectList("message.chatRoomList", messageVO);
	}
}
