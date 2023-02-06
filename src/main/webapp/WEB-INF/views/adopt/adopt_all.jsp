<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		<%
			String pPlace = null;
			
			if(session.getAttribute("address") != null){
				pPlace = session.getAttribute("address").toString().split(" ")[0];
			}
		%>
		
		$('#Adopt_all_search2').click(function() {
			$.ajax({
				url : 'adopt_search2',
				data : {
					pPlace : $('#Adopt_select_place').val(),
					pet : $('#Adopt_select_pet').val(),
					gender : $('#Adopt_select_gender').val(),
					page : 1
				},
				success : function(data) {
					$('#search_result').html(data)
				}
			})// ajax
		})// 필터 검색
		
		$('.Adopt_all_page').on('click', function() {
			$.ajax({
				url : 'adopt_all',
				data :{
					pPlace : '<%=pPlace%>' , 
					page : $(this).attr('id')
				},
				success : function(x) {
					$('#result').html(x)
				}//success
			})//ajax
		})//페이징

	})
</script>
</head>
<body>
<div id="Adopt_all_filter">
	<select id="Adopt_select_place">
		<option value="지역">지역</option>
		<option value="부산">부산</option>
		<option value="서울">서울</option>
		<option value="대전">대전</option>
		<option value="인천">인천</option>
		<option value="울산">울산</option>
		<option value="광주">광주</option>
		<option value="대구">대구</option>
		<option value="세종">세종</option>
		<option value="경기">경기도</option>
		<option value="강원">강원도</option>
		<option value="충북">충청북도</option>
		<option value="충남">충청남도</option>
		<option value="경북">경상북도</option>
		<option value="경남">경상남도</option>
		<option value="전북">전라북도</option>
		<option value="전남">전라남도</option>
		<option value="제주">제주도</option>
	</select>
	<br>

	<select id="Adopt_select_pet">
		<option value="동물">동물</option>
		<option value="강아지">강아지</option>
		<option value="고양이">고양이</option>
		<option value="기타">기타</option>
	</select>
	<br>

	<select id="Adopt_select_gender">
		<option value="성별">성별</option>
		<option value="남자">남자</option>
		<option value="여자">여자</option>
	</select>
	<br>

	<button id="Adopt_all_search2">검색하기</button>
	<br>
</div>
<div id="search_result">
	<h3 id="Adopt_all_count"><%=pPlace %> 목록 : ${count}개</h3>
	
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	<table border="1" id="Adopt_all_table">
	  <c:forEach items="${list}" var="one">
	    <c:if test="${i%j == 0 }">
		    <tr>
			    </c:if>
			       <td style="height: 320px; width: 350px;">
			       		<c:if test="${one.finish == 0}">
			       			<button style="background-color: aqua; font-weight: bold;">분양중</button>
			       		</c:if>
			       		
			       		<c:if test="${one.finish == 1}">
			       			<button style="background-color: gray; font-weight: bold;">분양완료</button>
			       		</c:if> 
			       		<br>
							
						<a href="adopt_one?adoptId=${one.adoptId}">
							<img alt="이미지가 없습니다." src="../resources/upload/${one.img}" width="150px" height="150px">
						</a>
						<br>
							<h1 id="Adopt_all_pet">${one.pet}  
								(${one.gender})
							</h1> 
							<br>
						<h1 id="Adopt_all_variety">품종</h1>		${one.variety} <br>
						<h1 id="Adopt_all_date">작성일</h1>	<fmt:formatDate pattern="yyyy-MM-dd" value="${one.date}"/> <br>
						<h1 id="Adopt_all_pPlace">보호소</h1>	${one.pPlace}
			       </td>
			    <c:if test="${i%j == j-1 }">
		    </tr>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	</table>
		<%
			int pages = (int) request.getAttribute("pages");
			for (int p = 1; p <= pages; p++) {
		%>
			<button class="Adopt_all_page" id="<%=p%>">
				<%=p%>
			</button>
		<%
			}
		%>
</div>
</body>
</html>