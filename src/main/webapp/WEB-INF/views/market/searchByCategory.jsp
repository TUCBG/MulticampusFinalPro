<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="marketHomeDiv">
<c:if test="${empty list}">검색결과가 없습니다</c:if>

<table border="1" class="marketTable">
	<c:forEach var="vo" items="${list}">
		<tr>
			<td class="marketListImgTd"><img alt="이미지가 없습니다"
				src="../resources/uploadedImg/${vo.img}" class="marketListImg"></td>
			<td class="marketTd"><a href="one?marketId=${vo.marketId}" class="marketA">${vo.title}</a><br><br>
			${vo.price}원<br><br>
			${vo.date}
		
			</td>
		</tr>
	</c:forEach>
</table>
<br>
<%
	int numberOfPages = (int) request.getAttribute("numberOfPages");
	for (int p = 1; p <= numberOfPages; p++) {
%>
<script>
	$(function() {
		$('#c<%=p%>').click(function() {
			$.ajax({
				url : "searchByCategory",
				data : {
					pageNumber : <%=p%>,
					region : $('#sido1').val()+" "+$('#gugun1').val(),
					category : $('#category').val(),
					keyword : $('#keyword').val(),				
					pageSize : $('#pageSize').val()
				},
				success : function(x) {
					$('#result').html(x)
				}

			})
		})
	})
	
	</script>
<button id="c<%=p%>" class="marketButton"><%=p%></button>
<%
	}
%>
</div>
