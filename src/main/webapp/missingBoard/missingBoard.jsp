<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실종 페이지</title>

<link rel="stylesheet" href="../resources/css/missingBoard.css">
<link rel="stylesheet" href="../resources/css/header.css">
<link rel="stylesheet" href="../resources/css/style.css">
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		<%
		 /* session.removeAttribute("userId");
		 session.setAttribute("userId", "dev");  */
		%>
		
		 if (navigator.geolocation) {
	            //위치 정보를 얻기
	            console.log(navigator.geolocation)
	            navigator.geolocation.getCurrentPosition (function(pos) {
	                const lat = pos.coords.latitude;
	               	const lon = pos.coords.longitude;
	               	console.log(lat);     // 위도
	                console.log(lon);	  // 경도
	                $.ajax({
	                	url : "https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x="+lon+"&y="+lat,
	                	headers: {'Authorization': 'KakaoAK 030da645dc01fee6a2c300a858d2b094'},
						success : function(data) {
							console.log(data.documents[0].region_1depth_name.substr(0, 2));  
							$("#choice_location").val(data.documents[0].region_1depth_name.substr(0, 2)).prop("selected", true);
							$.ajax({
								url : "fetchBoardNavi",
								data : {
									location : data.documents[0].region_1depth_name.substr(0, 2),
								},
								success : function(table) {
									$("#result").html(table)  
									
								}
							})
							$.ajax({
								url : "pageCountNavi",
								data : {
									location : data.documents[0].region_1depth_name.substr(0, 2),
								},
								success : function(table) {
									$("#result2").html(table)
								}
							})
						}
	                			
	                })
	            });
	        } else {
	            alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
	        }
		 
		$.ajax({
			url : "fetchBoard",
			success : function(table) {
				$("#result").html(table)
			}
		})

		$.ajax({
			url : "pageCount",
			success : function(table) {
				$("#result2").html(table)
			}
		})

		$(".searh_btn").on("click",	function() {
			$.ajax({
					url : "searchFilter",
					data : {
						pet : $("select[name=choice_pet] option:selected").text(),
						location : $("select[name=choice_location] option:selected").text(),
							},
					success : function(table) {
						$("#result").html(table)
					}
				})
			$.ajax({
					url : "filterPageCount",
					data : {
						pet : $("select[name=choice_pet] option:selected").text(),
						location : $("select[name=choice_location] option:selected").text(),
							},
					success : function(table) {
						$("#result2").html(table)
				}
			})
		})
	});
</script>
</head>
<body>
	<jsp:include page="../header/animal_header.jsp"></jsp:include> 
	<div class="missing_container">
		<div class="missing_header">
			<h1 class="missing_title">실종 목록</h1>
			<span>실종 동물 검색</span> <select name="choice_pet">
				<option value="dog" selected>강아지</option>
				<option value="cat">고양이</option>
				<option value="another">기타 반려동물</option>
			</select> <select id="choice_location" name="choice_location">
				<option value="서울" selected>서울</option>
				<option value="부산">부산</option>
				<option value="대구">대구</option>
				<option value="인천">인천</option>
				<option value="광주">광주</option>
				<option value="대전">대전</option>
				<option value="울산">울산</option>
				<option value="강원">강원</option>
				<option value="제주">제주</option>
			</select>
			<button class="searh_btn">검색</button>
			<button class="create_btn"
				onclick="location.href='missingBoardInsert.jsp'">등록하기</button>
		</div>
		<div id="result"></div>
		<div id="result2"></div>
	</div>
</body>
</html>