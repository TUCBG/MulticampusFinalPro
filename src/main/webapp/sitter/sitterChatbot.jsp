<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/sittercss.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../resources/js/sockjs-0.3.4.js"></script>
<script type="text/javascript" src="../resources/js/stomp.js"></script>
<script type="text/javascript"
	src="../resources/js/webSocketSendToUserApp.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script> -->
<script type="text/javascript">
	var stompClient = null;

	//css 담당 함수
	function setConnected(connected) { //연결 여부에 따라 설정 
		//document.getElementById('disconnect').disabled = !connected;
		document.getElementById('conversationDiv').style.visibility = connected ? 'visible'
				: 'hidden';
		//$('#response').html('')와 동일한 코드 
		document.getElementById('response').innerHTML = '';
	}

	//서버로 연결함. 
	function connect() {
		//1.소켓 객체 생성
		var socket = new SockJS('${pageContext.request.contextPath}/expert');
		//2.데이터를 전송하고, 받을 수 있는 stompClent 객체 생성
		stompClient = Stomp.over(socket);
		//3.채팅방 지정하여 가입
		stompClient.connect({}, function(frame) {
			setConnected(true); //css설정
			/* alert('연결됨.' + frame) */
			//가입
			//가입할 채팅방 이름, 닫을 때 어떻게 처리할 지 
			stompClient.subscribe('/market/messages2', function(messageOutput) {
				//서버에서 받은 메시지 출력 
				showMessageOutput(JSON.parse(messageOutput.body));
			});
		});

	}

	//서버로 연결 끊음. 
	function disconnect() {
		if (stompClient != null) {
			stompClient.disconnect();
		}
		setConnected(false); //연결끊어졌을 때 설정 변경 
		console.log("Disconnected");
	}

	//서버로 메세지 보냄 
	function sendMessage() {
		//입력한 정보를 가지고 와서 
		var from = "<%=session.getAttribute("userId")%>";
		var text = document.getElementById('text').value;
		//url을 /app/cht을 호출하고,data를 json형태의 sring으로 만들어서 보내라. 
		stompClient.send("/app/expert", {}, JSON.stringify({
			'from' : from,
			'text' : text
		}));
		
		// 보낸 메시지 append
		var p = document.createElement('p');
		var sender = 'sender';
		p.setAttribute('class', sender);
		p.style.wordWrap = 'break-word';
		p.appendChild(document.createTextNode(text));
		var li = document.createElement('li');
		li.appendChild(p);
		response.appendChild(li);
		document.getElementById('text').innerHTML = ' ';
	/* 	var p = document.createElement('p');
		var sender = 'sender';
		p.setAttribute('class', sender);
		p.style.wordWrap = 'break-word';
		p.appendChild(document.createTextNode(text));
		response.appendChild(p);
		document.getElementById('text').innerHTML = ''; */
	}

	//받은 데이터를 원하는 위치에 넣음. ==> 받은 데이터를 채팅목록으로 쌓는다
	function showMessageOutput(messageOutput) {
		var response = document.getElementById('response');
		var p = document.createElement('p');
		p.style.wordWrap = 'break-word';
		p.innerHTML = messageOutput.menu;
/* 		p.appendChild(document.createTextNode(messageOutput.menu)); */
		var li = document.createElement('li');
		li.appendChild(p);
		response.appendChild(li);
		document.getElementById('text').innerHTML = ' ';
		/* var response = document.getElementById('response');
		var p = document.createElement('p');
		p.style.wordWrap = 'break-word';
		p.appendChild(document.createTextNode(messageOutput.menu));
		response.appendChild(p);
		document.getElementById('text').innerHTML = ''; */
	}
	
</script>
<style type="text/css">
li{
	list-style: none;
	width: 100%;
	margin-top: 10px;
	display: table;
}
p{
	max-width : 63%;
	padding : 10px;
	margin-top: 10px;
	display : inline-block;
	background: #FFE5CC;
	border-radius: 0px 20px 20px 30px;
}
.sender{
	float: right;
	border-radius: 30px 20px 0px 40px;
}
</style>
</head>
<body onload="connect();">
	<div id="total">
		<jsp:include page="../header/animal_header.jsp"></jsp:include>
		<div id="center">
			<div>
				<p>
					안녕하세요!<br>
					시터 챗봇입니다. 전문시터등록과 전문시터추천을 도와드립니다. 원하시는 메뉴를 입력해주세요.<br>
					<span style="font-size: 10px;">예시)전문시터등록</span>
				</p>
			</div>
			<div id="response">
				<ul>
					
				</ul>
			</div>
			<div id="conversationDiv">
				<table>
					<tr>
						<td><input type="text" id="text" style="width: 450px;" class="form-control form-control"></td>
						<td><button id="sendMessage" onclick="sendMessage();" class="btn btn-light">Send</button></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>