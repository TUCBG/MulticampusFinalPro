<%@page import="com.multi.animal.sitter.SitterVO"%>
<%@page import="java.util.List"%>
<%@page import="com.multi.animal.sitter.FilterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
		FilterVO keyword = (FilterVO)request.getAttribute("keyword");
		String species = keyword.getSpecies();
		String care = keyword.getCare();
		
		List<SitterVO> list = (List<SitterVO>)request.getAttribute("list");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="../resources/css/medical.css">
<link rel="stylesheet" href="../resources/css/sittercss.css">
<script type="text/javascript">
	$(function() {
		var species = "<%=species%>";
		var care = "<%=care %>";
		if (species == "고양이") {
			$("#species").val("고양이").prop("selected", true);
		} else if (species == "기타") {
			$("#species").val("기타").prop("selected", true);
		}
		if (care == "산책 돌봄 (30분)") {
			$("#care").val("산책 돌봄 (30분)").prop("selected", true);
		}
		
	})
</script>
</head>
<body>
	<div id="total">
		<jsp:include page="../../../header/animal_header.jsp"></jsp:include>
		<div id="center">
			<div id="filter">
				<form action="sitter_filter">
					<select name="species" id="species">
						<option value="강아지" selected="selected">강아지
						<option value="고양이">고양이	
						<option value="기타">기타	
					</select>
					<select name="care" id="care">
						<option value="방문 돌봄 (30분)" selected="selected">방문 돌봄 (30분)
						<option value="산책 돌봄 (30분)">산책 돌봄 (30분)
					</select>
					<input type="date" name="dateStart" value="${keyword.dateStart }" min="2022-12-24" max="2023-12-31">
					- <input type="date" name="dateEnd" value="${keyword.dateEnd }" min="2022-12-24" max="2023-12-31">
					<input name="page" type="hidden" value="1">
					<input type="hidden" name="searcher" value="<%=session.getAttribute("userId") %>">
					<button>검색</button>
				</form>
			</div>
			<div id="result">
			<%if (list.size() != 0){ %>
				<ul>
					<c:forEach items="${list }" var="vo">
						<li>
							<div class="one">
	 							<a href="sitter_one?sitterId=${vo.sitterId}">
	 								<img src="../resources/upload/${vo.img }" width="200" height="150"> <br>
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
				 	<a href="sitter_filter?species=${keyword.species }&care=${keyword.care }&dateStart=${keyword.dateStart }&dateEnd=${keyword.dateEnd }&page=<%=p %>"><%=p %></a>
				 <%} %>
			</div>
		</div>
	</div>
</body>
</html>