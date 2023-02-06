<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.*" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" href="../resources/css/medical.css">
<div id="medicalHeader">
   <a class="medical-logo" href="${path }/main/animal_main.jsp"><img src="../resources/img/순양.png"></a>
   
   <div class="medical-menu-wrap">
      <nav class="medical-menu-list">
         <a class="medical-menu-item" href="${path }/adopt/adopt_main.jsp">보호소</a> 
         <a class="medical-menu-item" href="${path }/sitter/sitterSearch.jsp">시터</a>
         <a class="medical-menu-item" href="${path }/medical/medical.jsp">병원</a> 
         <a class="medical-menu-item" href="${path }/missingBoard/missingBoard.jsp">실종/보호</a> 
         <a class="medical-menu-item" href="${path }/market/marketHome.jsp">마켓</a>
      </nav>
      <!-- <button onclick="location.href='user/my.jsp'" class="medical-login-btn">로그인</button> -->
     <%if(session.getAttribute("name") != null) {%>
			<button onclick="location.href='/animal/user/logout.jsp'" class="medical-login-btn">로그아웃</button>
	<%} else {%>
		<button onclick="location.href='/animal/user/login.jsp'" class="medical-login-btn">로그인</button>
	<%} %>
   </div>
</div>