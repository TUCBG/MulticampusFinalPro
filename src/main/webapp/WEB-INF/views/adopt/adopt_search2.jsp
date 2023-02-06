<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="vo" class="com.multi.animal.adopt.AdoptVO"/>
<jsp:setProperty name="vo" property="*" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adopt_style.css?after"> 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$('.Adopt_search2_page').on('click', function() {
			$.ajax({
				url : 'adopt_search2',
				data :{
					pPlace : $('#Adopt_select_place').val(),
					pet : $('#Adopt_select_pet').val(),
					gender : $('#Adopt_select_gender').val(),
					page : $(this).attr('id')
				},
				success : function(x) {
					$('#search_result').html(x)
				}//success
			})//ajax
		})//페이징

	})
</script>
	
	<a href="adopt_main.jsp">
		<button id="Adopt_search2_back">전체목록</button>
	</a> <br>

<div id="Adopt_search2_content">

	
	<h3 id="Adopt_search2_count">검색 목록 : ${count}개</h3> 
	
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
		<table border="1" id="Adopt_search2_table">
		  <c:forEach items="${list}" var="one">
		    <c:if test="${i%j == 0 }">
			    <tr>
				    </c:if>
				       <td style="height: 400px; width: 350px;">
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
								<h1 id="Adopt_search2_pet">${one.pet}  
									(${one.gender})
								</h1> 
								<br>
							<h1 id="Adopt_search2_variety">품종</h1>		${one.variety} <br>
							<h1 id="Adopt_search2_date">작성일</h1>	<fmt:formatDate pattern="yyyy-MM-dd" value="${one.date}"/> <br>
							<h1 id="Adopt_search2_pPlace">보호소</h1>	${one.pPlace}
				       </td>
				    <c:if test="${i%j == j-1 }">
			    </tr>
		    </c:if>
		    <c:set var="i" value="${i+1 }" />
		  </c:forEach>
		</table>
</div>
		<%
			int pages = (int) request.getAttribute("pages");
			for (int p = 1; p <= pages; p++) {
		%>
			<button class="Adopt_search2_page" id="<%=p%>">
				<%=p%>
			</button>
		<%
			}
		%> 


