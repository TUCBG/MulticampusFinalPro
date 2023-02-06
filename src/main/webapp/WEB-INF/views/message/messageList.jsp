<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	if ((String) session.getAttribute("userId") == null) {
		response.getWriter().println(
				"<script>alert('로그인 상태에서만 채팅이 가능합니다');location.href='../market/marketHome.jsp'</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript" src="../resources/js/sockjs-0.3.4.js"></script>
<script type="text/javascript" src="../resources/js/stomp.js"></script>
<script type="text/javascript"
	src="../resources/js/webSocketSendToUserApp.js"></script>
<link href="../resources/css/market.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		
		
		$('#send').click(function() {
			if($('#message').val() != ""){
			$.ajax({
				url : "insert",
				data : {
					marketId : <%=request.getParameter("marketId")%>,
					messageSender : "<%=session.getAttribute("userId")%>",
					messageTaker : "<%=request.getParameter("partner")%>",
					messageContent : $('#message').val()
					},
				success : function(x) {
					$('#message').val('')
				}
				})
			}
		})
	})
	var stompClient = null;
		
		//1. 소켓객체 생성
		var socket = new SockJS('${pageContext.request.contextPath}/chat')
		//2. 데이터를 전송하고, 받을 수 있는 stompClent객체 생성
		stompClient = Stomp.over(socket);
		
		//3. 채팅방 지정하여 가입하자.
		stompClient.connect({}, function(frame) {
			stompClient.subscribe('/market/messages', function(messageVO) {
				//서버에서 받은 메시지 출력 
				showMessageVO(JSON.parse(messageVO.body));
			})
		})
		
	function sendMessage() {
		if ($('#message').val()!=''){	
		//입력한 정보를 가지고 와서  url을 /app/chat을 호출하고,data를 json형태의 sring으로 만들어서 보내라. 
		stompClient.send("/app/chat", {}, JSON.stringify({
			'marketId' : "<%=request.getParameter("marketId")%>",
			'messageSender' : "<%=session.getAttribute("userId")%>",
			'messageTaker' : "<%=request.getParameter("partner")%>",
			'messageContent' : $('#message').val()
		}));
		}
	}
	
	
	//받은 데이터를 원하는 위치에 넣음. ==> 받은 데이터를 채팅목록으로 쌓는다. 
	function showMessageVO(messageVO) {
		if(messageVO.marketId==<%=request.getParameter("marketId")%>){
			if (messageVO.messageSender == "<%=session.getAttribute("userId")%>" && messageVO.messageTaker == "<%=request.getParameter("partner")%>"){
				$('#resultMessage').append('<font class="myFont">'+messageVO.messageContent+'</font><div class=myTime>'+messageVO.time+'</div>')
				}else if(messageVO.messageTaker == "<%=session.getAttribute("userId")%>" && messageVO.messageSender == "<%=request.getParameter("partner")%>") {
				$('#resultMessage').append('<img src="../resources/img/partner.png" class="partnerImg"><font class="partnerFont">'
										+ messageVO.messageContent
										+ '</font><div class=partnerTime>'
										+ messageVO.time + '</div>')
			}
		}
	}
</script>
</head>
<body>
<jsp:include page="../../../header/animal_header.jsp"></jsp:include>
<br>
<br>
<br>
<br>
<br>
<div class="marketHomeDiv">
	<table border="1" class="marketTable">
		<tr>
			<td colspan="2" height="40px" class="marketKeyTd"><div class="partnerImgTextDiv"><img
				src="../resources/img/partner.png" class="partnerImg"><%=request.getParameter("partner")%></div></td>
		</tr>

		<tr>
			<td rowspan="2" class="marketListImgTd"><img alt="이미지가 없습니다"
				src="../resources/uploadedImg/${messageVO.img}"
				class="marketListImg"></td>
			<td class="marketTd"><a
				href="../market/one?marketId=<%=request.getParameter("marketId")%>" class="marketA"><%=request.getParameter("title")%></a></td>

		</tr>
		<tr>

			<td class="marketTd"><%=request.getParameter("price")%>원</td>
		</tr>
		<tr>
			<td colspan="2" height="600" class="marketTd"><c:forEach
					var="vo" items="${list}">
					<c:set var="sessionId" value="${messageVO.sessionId}" />
					<c:choose>
						<c:when test="${vo.messageSender == sessionId}">
							<font class="myFont">${vo.messageContent}</font>
							<div class=myTime>${vo.time}</div>
						</c:when>
						<c:otherwise>
									<img src="../resources/img/partner.png" class="partnerImg">
									<font class="partnerFont">${vo.messageContent}</font>
							<div class=partnerTime>${vo.time}</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<div id='resultMessage'></div></td>
		</tr>
	</table>
	<ul>
		<li><textarea id="message" placeholder="메시지를 입력하세요"
				class="sendArea"></textarea></li>
		<li><button id="send" onclick="sendMessage();" class="sendButton">전송</button></li>
	</ul>
</div>
</body>
</html>