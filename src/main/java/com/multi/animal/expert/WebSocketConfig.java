package com.multi.animal.expert;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig extends AbstractWebSocketMessageBrokerConfigurer {

	// 채팅 방 이름 설정
	@Override
	public void configureMessageBroker(MessageBrokerRegistry config) {
		config.enableSimpleBroker("/market");
		config.setApplicationDestinationPrefixes("/app");
	}
	
	// 채팅 내용을 보낼 주소 (end-point == url 지정)
	// 채팅방 등록, 채팅방이 3개면 3개의 주소가 필요
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		// chat : 챗봇용
		registry.addEndpoint("/expert"); // 접속하는 주소. 자바 소켓 통신
		registry.addEndpoint("/expert").withSockJS(); // 자바 스크립트 소켓 통신.
	}

}
