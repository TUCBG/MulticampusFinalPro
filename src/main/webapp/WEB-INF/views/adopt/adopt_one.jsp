<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:useBean id="vo" class="com.multi.animal.adopt.AdoptVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>
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
			// session.removeAttribute("userId");
			// session.setAttribute("userId", "aaa"); 
		%>
		 if ("<%=session.getAttribute("userId")%>" == "${one.userId}") {
			$('#Adopt_one_button').append('<a href="adopt_delete?adoptId=${one.adoptId}&deleteFile=${one.img}"><button id="Adopt_one_delete">삭제하기</button></a><button id="Adopt_one_update">수정하기</button><br>'
			)
		} 
		$('#Adopt_one_update').click(function() {
			$.ajax({
				url : 'adopt_updatePage.jsp',
				data : {
					adoptId : $('#adoptId').val(),
					userId : $('#userId').val(),
					pet : $('#pet').val(),
					variety : $('#variety').val(),
					gender : $('#gender').val(),
					noGender : $('#noGender').val(),
					weight : $('#weight').val(),
					fPlace : $('#fPlace').val(),
					pPlace : $('#pPlace').val(),
					tel : $('#tel').val(),
					special : $('#special').val(),
					img : $('#img').val(),
					finish : $('#finish').val(),
				},
				success : function(data) {
					$('#Adopt_one_button').remove()
					$('#Adopt_one_content').html(data)
				}
			})// ajax
		})// 수정하기

	})
</script>
</head>
<body>
<jsp:include page="../../../header/animal_header2.jsp"></jsp:include>
<a href="adopt_main.jsp">
		<button id="Adopt_one_back">목록으로</button>
</a>
<div id="Adopt_one_button">
	
	<input type="hidden" id="adoptId" value="${one.adoptId}">
	<input type="hidden" id="userId" value="${one.userId}">
	<input type="hidden" id="pet" value="${one.pet}">
	<input type="hidden" id="variety" value="${one.variety}">
	<input type="hidden" id="gender" value="${one.gender}">
	<input type="hidden" id="noGender" value="${one.noGender}">
	<input type="hidden" id="weight" value="${one.weight}">
	<input type="hidden" id="fPlace" value="${one.fPlace}">
	<input type="hidden" id="pPlace" value="${one.pPlace}">
	<input type="hidden" id="tel" value="${one.tel}">
	<input type="hidden" id="special" value="${one.special}">
	<input type="hidden" id="img" value="${one.img}">
	<input type="hidden" id="finish" value="${one.finish}">	
</div>
<div id="Adopt_one_content">
	<table id = "Adopt_one_table" border="1">
		<tr>
			<td colspan="3" style="font-weight: bold;">
				[${one.pet}]
				
				<c:if test="${one.finish == 0}">
			       	<button style="background-color: aqua;">분양중</button>
			    </c:if>
			       		
			   	<c:if test="${one.finish == 1}">
			       <button style="background-color: gray;">분양완료</button>
			    </c:if> 
			
			</td>
		</tr>
		
		<tr>
			<td colspan="3">
				품종: ${one.variety} /
				성별: ${one.gender} /
				중성화: ${one.noGender} /
				몸무게: ${one.weight}kg
			</td>
		</tr>
		
		<tr>
			<td rowspan="6" style="font-weight: bold;">
				<img src="../resources/upload/${one.img}" width="300px" height="300px" id="img"> <br>
				[${one.userId}]님의 게시글
			</td>
			<td	style="font-weight: bold;">게시판 번호 </td>
			<td>
				${one.adoptId} 
			</td>
		</tr>
		
		<tr>
			<td style="font-weight: bold;">등록 날짜</td>
			<td> 
				<fmt:formatDate pattern="yyyy-MM-dd" value="${one.date}"/> 
			</td>
		</tr>
		
		<tr>
			<td style="font-weight: bold;">발견 장소 </td>
			<td>
				${one.fPlace}
			</td>
		</tr>
		
		<tr>
			<td style="font-weight: bold;">보호소 위치</td>
			<td>
				${one.pPlace} 
			</td>
		</tr>
		
		<tr>
			<td style="font-weight: bold;">전화번호</td>
			<td>
				${one.tel} 
			</td>
		</tr>
		
		<tr>
			<td style="width: 200px; height: 200px; font-weight: bold;">
				특이사항 
			</td>
			<td>
				${one.special}
			</td> 
		</tr>
		
	
	
	</table>
	
	<a href="https://map.kakao.com/link/search/${one.pPlace}" target="_blank">
		<button id="Adopt_one_mapB1">길찾기</button> <br>
	</a>
	<div id="Adopt_one_map" style="width:400px;height:400px;" ></div>

</div>




<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f6b6776d551941b4a744a048709fe2d4&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('Adopt_one_map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${one.pPlace}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
</script>
</body>
</html>