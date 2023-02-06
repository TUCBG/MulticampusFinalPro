<%@page import="com.multi.animal.sitter.SitterVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/medical.css">
<link rel="stylesheet" href="../resources/css/sittercss.css">
<script type="text/javascript" src="../resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
<div class="total">
	<jsp:include page="../../../header/animal_header.jsp"></jsp:include>
	<div id="center">
	<div id="filter">
		<form action="sitter_filter">
			<select name="species">
				<option value="강아지">강아지
				<option value="고양이">고양이	
				<option value="기타">기타	
			</select>
			<select name="care">
				<option value="방문 돌봄 (30분)">방문 돌봄 (30분)
				<option value="산책 돌봄 (30분)">산책 돌봄 (30분)
			</select>
			<input type="date" name="dateStart" min="2022-12-24" max="2023-12-31" id="currentDate1">
			- <input type="date" name="dateEnd" min="2022-12-24" max="2023-12-31" id="currentDate2">
			<script>
				document.getElementById('currentDate1').value = new Date().toISOString().substring(0, 10);
				document.getElementById('currentDate2').value = new Date().toISOString().substring(0, 10);
			</script>
			<input name="page" type="hidden" value="1">
			<input type="hidden" name="searcher" value="<%=session.getAttribute("userId") %>">
			<button>검색</button>
		</form>
	</div>
	<div id="result">
		<%  List<SitterVO> list = (List<SitterVO>)request.getAttribute("list"); 
			if (list.size() != 0){ %>
			 <ul>
		 		<c:forEach items="${list }" var="vo">
 					<li>
						<div class="one">
 							<a href="sitter_one?sitterId=${vo.sitterId}">
 								<img src="../resources/upload/${vo.img }" width="200"> <br>
 							</a>
 							<span style="font-size: 13px;">${vo.reserve }</span> <br>
 							<span style="font-size: 17px;">${vo.species }  ${vo.care }</span> <br>
 							<span style="font-size: 13px;">${vo.date }</span> <br>
						</div>
 					</li>
	 		 	</c:forEach>
		 	</ul>
		 <%} else { %>
			<p style="text-align: center;">조건에 맞는 검색 결과가 없습니다.</p>
		<%} %>
	</div>
	<div id="clearfix"></div>
	<div id="page">
 		<%int pages = (int)request.getAttribute("pages");
 			for(int p = 1; p <= pages; p++) {
		 %>
		 	<a href="sitter_search?species=${keyword.species}&page=<%=p %>&care=${keyword.care }&date=${keyword.date }"><%=p %></a>
		 <%} %>
	</div>
	</div>
</div>
</body>
</html>