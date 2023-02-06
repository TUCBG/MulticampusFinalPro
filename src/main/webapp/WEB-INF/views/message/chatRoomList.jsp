<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	if ((String) session.getAttribute("userId") == null) {
		response.getWriter().println("<script>alert('로그인 상태에서만 채팅방을 볼 수 있습니다');location.href='../market/marketHome.jsp'</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/market.css" rel="stylesheet">

</head>
<body>

<jsp:include page="../../../header/animal_header.jsp"></jsp:include>
<br>
<br>
<br>
<br>
<br>

<div class="marketHomeDiv">
<h3>채팅</h3>
<br>
<br>
<table border="1" class="marketTable">
	<c:forEach var="vo" items="${list}">
		<tr>
			<td rowspan="2" class="marketListImgTd"><img alt="이미지가 없습니다"
				src="../resources/uploadedImg/${vo.img}" class="marketListImg"></td>
			<td height="40px" class="marketKeyTd"><div class="partnerImgTextDiv"><img src="../resources/img/partner.png" class="partnerImg"><c:set var="sessionId" value="${messageVO.sessionId}" /> <c:choose>
					<c:when test="${vo.messageSender != sessionId}">${vo.messageSender}</c:when>
					<c:otherwise>${vo.messageTaker}</c:otherwise>
				</c:choose></div></td>
		</tr>
		<tr>
			<td class="marketTd"><a
				href="messageList?marketId=${vo.marketId}&&partner=<c:choose>
			<c:when test="${vo.messageSender != sessionId}">${vo.messageSender}</c:when>
			<c:otherwise>${vo.messageTaker}</c:otherwise>
			</c:choose>&&sessionId=<%=session.getAttribute("userId")%>&&title=${vo.title}&&img=${vo.img}&&price=${vo.price}" class="marketA">${vo.messageContent}</a></td>
		</tr>
	</c:forEach>
	</table>
	</div>
</body>
</html>