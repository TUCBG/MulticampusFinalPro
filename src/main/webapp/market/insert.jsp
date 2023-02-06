<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	if ((String) session.getAttribute("userId") == null) {
		response.getWriter().print("<script>alert('로그인 상태에서만 등록이 가능합니다')</script>");
		response.sendRedirect("marketHome.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/market.css" rel="stylesheet">
<script type="text/javascript">
//opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. 
//(＂팝업 API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";
function goPopup(){
//경로는 시스템에 맞게 수정하여 사용
//호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMapUrl.do)을
//호출하게 됩니다.
var pop = window.open("jusoPopup.jsp","pop","width=700,height=550, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr){
document.form.roadFullAddr.value = roadFullAddr;
}

</script>
</head>
<body>
<jsp:include page="../header/animal_header.jsp"></jsp:include>
<br>
<br>
<br>
<br>
<br>
<div class="marketHomeDiv">
	<form name="form" id="form" action="insert" method="post"
		enctype="multipart/form-data">
		<input name="title" required="required" placeholder="제목"><br> 
		<select name="category" required="required">
			<option value="놀이기구">놀이기구</option>
			<option value="의류">의류</option>
			<option value="음식">음식</option>
			<option value="관리용품">관리용품</option>
			<option value="집">집</option>
			<option value="기타">기타</option>
		</select> 
		<input name="price" required="required" placeholder="가격">원 <br> 
		사진:<input type="file" name="file" required="required" accept="image/*">
		<input type="text" id="roadFullAddr" name="place" onClick="goPopup()" readonly="readonly" required="required" placeholder="거래 희망 장소"/> <br> 
		 <input type="hidden" name="writer" value="<%=session.getAttribute("userId")%>">
		<textarea name="content" rows="20" cols="50" required="required" placeholder="물품을 설명해 주세요"></textarea>
		<br>
		<button class="marketButton">등록</button><input type="button" value="취소" onclick="history.back();">
	</form>
	</div>
</body>
</html>