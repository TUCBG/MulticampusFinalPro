<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		$(".page_btn").click(function() {
			console.log($(this).attr("id"))
			var page = $(this).attr("id")
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
							$.ajax({
								url : "fetchBoardNavi",
								data : {
									location : data.documents[0].region_1depth_name.substr(0, 2),
									page : page,
								},
								success : function(table) {
									$("#result").html(table)  
									
								}
							})
						}
	                			
	                })
	            });
	        } else {
	            alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
	        }
		});
	});
</script>
<div class="page_btnWrap">
	<%
		int pages = (int) request.getAttribute("pages");
	for (int p = 1; p <= pages; p++) {
	%>
	<button id=<%=p%> class="page_btn"><%=p%></button>
	<%
		}
	%>
</div>