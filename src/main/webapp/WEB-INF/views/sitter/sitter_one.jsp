<%@page import="com.multi.animal.sitter.SitterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	SitterVO vo = (SitterVO)request.getAttribute("vo");
    	String writer = vo.getUserId();
    	String userId = (String)session.getAttribute("userId");
    	System.out.println("writer>>" + writer);
    	System.out.println("user>>" + userId);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/medical.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script type="text/javascript" src="../resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var writer = "<%=writer %>";
		var userId = "<%=userId %>";
		
		if (writer != userId) {
			$("#btn").hide();			
		}
	
	})
	
</script>
<style type="text/css">
#center {
	width:680px;
    height:500px;
    margin:0 auto;
    margin-top: 90px;
}
/* .sitterone, .comment{
	padding-left: 10px;
} */
.sitterone{
	height: 30px;
}
#btn{
	padding-top: 20px;
	text-align: right;
}
</style>
</head>
<body>
<div id = "total">
	<jsp:include page="../../../header/animal_header.jsp"></jsp:include>
	<div id="center">
		<table class="table">
			<tr>
				<td rowspan="5"><img src="../resources/upload/${vo.img }" width="300px"></td>
				<td style="font-weight: bold;" class="text">[${vo.reserve }]</td>
			</tr>
			<tr><td class="sitterone">${vo.species }<td></tr>
			<tr><td class="sitterone">${vo.care }<td></tr>
			<tr><td class="sitterone">${vo.date }<td></tr>
			<tr><td class="sitterone">${vo.sitterTel }<td></tr>
			<tr><td class="comment">${vo.comment }<td></tr>
			
		</table>
		<div id="btn">
			<a href="sitter_update1?sitterId=${vo.sitterId }">
				<button class="btn btn-outline-secondary">수정</button>
			</a>
			<a href="sitter_delete?sitterId=${vo.sitterId }">
				<button class="btn btn-outline-secondary">삭제</button>
			</a>
		</div>
	</div> <!-- center -->
</div> <!-- total -->

</body>
</html>