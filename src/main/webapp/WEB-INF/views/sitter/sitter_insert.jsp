<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/medical.css">
<link rel="stylesheet" href="../resources/css/sittercss.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style type="text/css">
span{
	padding-left: 25px;
}
h5{
	padding: 10px;
}
</style>
</head>
<body>
<div id = "total">
	<jsp:include page="../../../header/animal_header.jsp"></jsp:include>
	<div id="center" style="margin-top: 20%; text-align: center;">
		<h5>시터 구인 등록이 완료되었습니다.</h5>
		<a href="sitterSearch.jsp"><button class="btn btn-outline-secondary">검색하기</button></a>
		<span><a href="sitterInsert.jsp"><button class="btn btn-outline-secondary">구인등록</button></a></span>
	</div> <!-- center -->
</div> <!-- total -->

</body>
</html>