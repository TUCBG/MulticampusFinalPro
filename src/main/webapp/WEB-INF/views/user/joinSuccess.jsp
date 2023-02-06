<%@page import="com.multi.animal.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
 <%
 	UserVO vo = (UserVO)request.getAttribute("vo");
 	String userId = vo.getUserId();
 	String name = vo.getName();
 	session.setAttribute("userId", userId);
 	session.setAttribute("name", name);
 	session.setAttribute("address", vo.getAddress());
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/resources/css/medical.css">
<link rel="stylesheet" href="${path }/resources/css/sittercss.css">
</head>
<body>
	<div id="total">
		<jsp:include page="../../../header/animal_header2.jsp"></jsp:include>
		<div id="center" style="margin-top: 20%; text-align: center;">
			<h3>환영합니다.</h3>
			<h3>회원가입이 완료되었습니다.</h3>
		</div> <!-- center -->
	</div> <!-- total -->
</body>
</html>