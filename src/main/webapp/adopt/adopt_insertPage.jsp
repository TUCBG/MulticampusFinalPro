<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	
	<a href="adopt_main.jsp">
		<button id="Adopt_insert_back">전체목록</button>
	</a> <br>
	
	<div id="Adopt_insert_content">
		<form action="adopt_insert" id="form" method="post"
			enctype="multipart/form-data">
			<table>
				<tr style="text-align: center;">
					<td colspan="2">
						<h1>등록하기</h1>
					</td>
				</tr>
				
				<tr> 
					<td>
						아이디(*)
					</td>
					<td>
						<input readonly="readonly" name="userId" value="<%=session.getAttribute("userId") %>">
						<!-- <input name="userId" required="required"> -->
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
						<input name="variety" required="required">
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
						<input name="weight">kg  
					</td>
				</tr>
				
				<tr> 
					<td>
						발견장소
					</td>
					<td>
						<input name="fPlace"> 
					</td>
				</tr>
				
				<tr> 
					<td>
						보호소 위치(*)
					</td>
					<td>
						<input name="pPlace" id="pPlace" required="required">
						<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
					</td>
				</tr>
				
				<tr> 
					<td>
						연락처(*)
					</td>
					<td>
						<input name="tel" placeholder="010-0000-0000" required="required">
					</td>
				</tr>
				
				<tr> 
					<td>
						특이사항
					</td>
					<td>
						<textarea name="special" rows="5" cols="30" ></textarea>
					</td>
				</tr>
				
				<tr> 
					<td>
						사진(*)
					</td>
					<td>
						<input type="file" name="file" required="required">
					</td>
				</tr>	
				
				<tr>
					<td colspan="2" style="text-align: center;">
						<button id="insert_button2">등록하기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
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
</html>