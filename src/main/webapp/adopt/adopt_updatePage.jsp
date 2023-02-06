<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="com.multi.animal.adopt.AdoptVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<div id="Adopt_update_content">
	
	
	<form action="adopt_update" id="form" method="post"
		enctype="multipart/form-data">
		<%-- input name="adoptId" readonly="readonly" value="<%=request.getParameter("adoptId")%>" --%>
		<!-- form 안에서는 disabled를 사용하면 값을 전달하지 못한다. readonly를 사용하여야 한다 -->
		<input type="hidden" name="adoptId" value="<%=request.getParameter("adoptId")%>">
		<table>
				<tr style="text-align: center;">
					<td colspan="2">
						<h1>수정하기</h1>
					</td>
				</tr>
				
				<tr> 
					<td>
						아이디(*)
					</td>
					<td>
						<input readonly="readonly" name="userId" value="<%=request.getParameter("userId")%>">
					</td>
				</tr>
				
				<tr> 
					<td>
						동물(*)
					</td>
					<td>
						<input type="radio" name="pet" value="강아지" required="required"> 강아지 
						<input type="radio" name="pet" value="고양이"> 고양이 
						<input type="radio" name="pet" value="기타"> 기타 
					</td>
				</tr>
				
				<tr> 
					<td>
						품종(*)
					</td>
					<td>
						<input name="variety" value="<%=request.getParameter("variety")%>" required="required">
					</td>
				</tr>
				
				<tr> 
					<td>
						성별(*)
					</td>
					<td>
						<input type="radio" name="gender" value="남자" required="required"> 남자 
						<input type="radio" name="gender" value="여자"> 여자 
					</td>
				</tr>
				
				<tr> 
					<td>
						중성화(*)
					</td>
					<td>
						<input type="radio" name="noGender" value="예" required="required"> 예 
						<input type="radio" name="noGender" value="아니오"> 아니오  
					</td>
				</tr>
				
				<tr> 
					<td>
						몸무게
					</td>
					<td>
						<input name="weight" value="<%=request.getParameter("weight")%>">kg  
					</td>
				</tr>
				
				<tr> 
					<td>
						발견장소
					</td>
					<td>
						<input name="fPlace" value="<%=request.getParameter("fPlace")%>"> 
					</td>
				</tr>
				
				<tr> 
					<td>
						보호소 위치(*)
					</td>
					<td>
						<input name="pPlace" id="pPlace" value="<%=request.getParameter("pPlace")%>" required="required">
						<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
					</td>
				</tr>
				
				<tr> 
					<td>
						연락처(*)
					</td>
					<td>
						<input name="tel" placeholder="010-0000-0000" value="<%=request.getParameter("tel")%>" required="required">
					</td>
				</tr>
				
				<tr> 
					<td>
						특이사항
					</td>
					<td>
						<textarea name="special" rows="5" cols="30" placeholder="<%=request.getParameter("special")%>"></textarea>
					</td>
				</tr>
				
				<tr> 
					<td>
						사진(*)
					</td>
					<td>
						<input type="hidden" name="deleteFile" value="<%=request.getParameter("img")%>">
						<input type="file" name="file" required="required">
					</td>
				</tr>	
				
				<tr>
					<td colspan="2" style="text-align: center;">
						<select name="finish" style="font-size: 15px; font-weight: bold;">
							<option value=0>분양중</option>
							<option value=1>분양완료</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align: center;">
						<button id="update_button2">수정하기</button>
					</td>
				</tr>
			</table>
	</form>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f6b6776d551941b4a744a048709fe2d4&libraries=services"></script>
<script>
	function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("pPlace").value = addr;
	            }
	        }).open();
	    }
</script>
</body>
</html>