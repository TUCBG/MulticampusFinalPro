
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.multi.animal.market.MarketVO"%>
<%@page import="org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/market.css" rel="stylesheet">
<script type="text/javascript" src="../resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=mcn4h7vwlk&submodules=geocoder,panorama"></script>
<script type="text/javascript">


$(function() {
	if ("<%=session.getAttribute("userId")%>"=="${marketVO.writer}") {
	$('#button').html('<a href="update.jsp?marketId=${marketVO.marketId}&&title=${marketVO.title}&&content=${marketVO.content}&&writer=${marketVO.writer}&&category=${marketVO.category}&&price=${marketVO.price}&&img=${marketVO.img}&&place=${marketVO.place}"><button class="marketButton">수정</button></a><a href="delete?marketId=${marketVO.marketId}&&fileToDelete=${marketVO.img}"><button class="marketButton">삭제</button></a>')}
	else if ("<%=session.getAttribute("userId")%>" != null) 
	{$('#button').html('<a href="../message/messageList?marketId=${marketVO.marketId}&&sessionId=<%=session.getAttribute("userId")%>&&title=${marketVO.title}&&price=${marketVO.price}&&img=${marketVO.img}&&partner=${marketVO.writer}"><button class="marketButton">채팅하기</button></a>')
		}
	})

	// 희망거래장소의 주소를 좌표로 변환해 지도에 마커로 표시합니다.
	naver.maps.Service.geocode({
		query : "${marketVO.place}"
	}, function(status, response) {
		if (status === naver.maps.Service.Status.ERROR) {
			$('#map').html('좌표를 불러오는 데 실패했습니다')
		} else if (response.v2.meta.totalCount === 0) {
			$('#map').html('장소를 지도에 나타낼 수 없습니다')
		} else {
			var item = response.v2.addresses[0];
			var latLng = new naver.maps.LatLng(item.y, item.x);
			var map = new naver.maps.Map('map', {
				center : latLng,
				zoom : 14,
				mapTypeControl : true
			});
			var marker = new naver.maps.Marker({
				position : latLng,
				map : map,
				animation : naver.maps.Animation.DROP

			});

			// 아이디 혹은 지도 좌표로 파노라마를 표시할 수 있습니다.
			var pano = new naver.maps.Panorama("pano", {
				position : new naver.maps.LatLng(item.y, item.x),
				size : new naver.maps.Size(340, 250),
				pov : {
					pan : -135,
					tilt : 29,
					fov : 100
				}
			});

			// 파노라마 위치가 갱신되었을 때 발생하는 이벤트를 받아 지도의 중심 위치를 갱신합니다.
			naver.maps.Event.addListener(pano, 'pano_changed', function() {
				var latlng = pano.getPosition();

				if (!latlng.equals(map.getCenter())) {
					map.setCenter(latlng);
				}
			});

			// 거리뷰 레이어를 생성합니다.
			var streetLayer = new naver.maps.StreetLayer();
			naver.maps.Event.once(map, 'init', function() {
				streetLayer.setMap(map);
			});

			// 거리뷰 버튼에 이벤트를 바인딩합니다.
			var btn = $('#street');
			btn.on("click", function(e) {
				e.preventDefault();

				// 거리뷰 레이어가 지도 위에 있으면 거리뷰 레이어를 지도에서 제거하고,
				// 거리뷰 레이어가 지도 위에 없으면 거리뷰 레이어를 지도에 추가합니다.
				if (streetLayer.getMap()) {
					streetLayer.setMap(null);
				} else {
					streetLayer.setMap(map);
				}
			});

			// 거리뷰 레이어가 변경되면 발생하는 이벤트를 지도로부터 받아 버튼의 상태를 변경합니다.
			naver.maps.Event.addListener(map, 'streetLayer_changed', function(
					streetLayer) {
				if (streetLayer) {
					btn.addClass('control-on');
				} else {
					btn.removeClass('control-on');
				}
			});

			// 지도를 클릭했을 때 발생하는 이벤트를 받아 파노라마 위치를 갱신합니다. 이때 거리뷰 레이어가 있을 때만 갱신하도록 합니다.
			naver.maps.Event.addListener(map, 'click', function(e) {
				if (streetLayer.getMap()) {
					var latlng = e.coord;

					// 파노라마의 setPosition()은 해당 위치에서 가장 가까운 파노라마(검색 반경 300미터)를 자동으로 설정합니다.
					pano.setPosition(latlng);
				}
			});
			
		}//else
	});
</script>
</head>
<body>
<jsp:include page="../../../header/animal_header.jsp"></jsp:include>
<br>
<br>
<br>
<br>
<br>
<div class="marketHomeDiv">
	<table border="1" class="marketTable">
		<tr>
			<td class="marketKeyTd" style="width: 400px; height: 40px">${marketVO.title}</td>
			<td width="90px" class="marketKeyTd">작성일</td>
			<td class="marketTd">${marketVO.date}</td>
		</tr>
		<tr>
			<td rowspan="2" style="height: 220px" class="marketTd"><img
				alt="이미지가 없습니다" src="../resources/uploadedImg/${marketVO.img}"
				class="marketOneImg"></td>
			<td class="marketKeyTd">가격</td>
			<td class="marketTd">${marketVO.price}원</td>
		</tr>
		<tr>
			<td class="marketKeyTd">작성자</td>
			<td class="marketTd">${marketVO.writer}</td>

		</tr>
		<tr>
			<td class="marketTd">${marketVO.content}</td>
			<td class="marketKeyTd">희망<br>거래장소
			</td>
			<td class="marketTd">${marketVO.place}<a
				href="https://map.kakao.com/?sName=&eName=${marketVO.place}"><button class="marketButton">길찾기</button></a>
				<div id="map" style="width: 340px; height: 250px;"></div>
				<div id="pano" style="width: 340px; height: 250px;"></div>
			</td>
		</tr>
	</table>
	<br>
	<div id="button"></div>
	<br>

</div>
</body>
</html>

