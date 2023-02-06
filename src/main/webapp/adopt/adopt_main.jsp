<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/adopt.css?after">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		<%	
			//session.removeAttribute("userId");
			//session.setAttribute("userId", "bbb");
			String pPlace = null;
			
			if(session.getAttribute("address") != null){
				pPlace = session.getAttribute("address").toString().split(" ")[0];
			} 
		%>
		if ('<%=session.getAttribute("userId")%>' != 'null') {
			$('#Adopt_main_insertB').append('<button id="Adopt_main_insert">등록</button>')
		} 
		
		$.ajax({
			url : "adopt_all",
			data : {
				pPlace : '<%=pPlace%>',
				page : 1
			},
			success : function(table) {
				$('#result').html(table)
			} // success
		})// 첫화면 리스트 보여주기(ajax)
		
		$('#Adopt_main_insert').click(function() {
			$.ajax({
				url : "adopt_insertPage.jsp",
				success : function(insert) {
					$('#Adopt_main_insertB').remove()
					$('#result').html(insert)
				} // success
			}) // ajax
		})// 등록버튼 클릭
	})
</script>
</head>
<body>
<jsp:include page="../header/animal_header.jsp"></jsp:include> 
		
<div id="Adopt_main_insertB">
</div>
<div id="result"> 
</div>

</body>
</html>