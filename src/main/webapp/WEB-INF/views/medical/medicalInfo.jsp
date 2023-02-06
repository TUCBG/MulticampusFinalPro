<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#closeBtn').on('click', function() {
			$('#medicalSearchResultInfo').toggle('#medicalSearchResultInfo')
		})
	})
</script>

<div class="medical-one-wrap">
	<div id="map"></div>
	
	<script>
	if($('#medicallAddrInfo').text() != ''){
		searchAddressToCoordinate($('#medicallAddrInfo').text());
	} else{
		searchAddressToCoordinate($('#medicalrAddrInfo').text());
	}
	
	var map = new naver.maps.Map("map", {
	    center: new naver.maps.LatLng(37.3595316, 127.1052133),
	    zoom: 16,
	    mapTypeControl: true
	});

	map.setCursor('pointer');

	function searchCoordinateToAddress(latlng) {
		
	    naver.maps.Service.reverseGeocode({
	        coords: latlng,
	        orders: [
	            naver.maps.Service.OrderType.ADDR,
	            naver.maps.Service.OrderType.ROAD_ADDR
	        ].join(',')
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }

	        var items = response.v2.results,
	            address = '',
	            htmlAddresses = [];

	        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
	            item = items[i];
	            address = makeAddress(item) || '';
	            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

	            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
	        }
	    });
	}

	function searchAddressToCoordinate(address) {
	    naver.maps.Service.geocode({
	        query: address
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }

	        if (response.v2.meta.totalCount === 0) {
	            return alert('totalCount' + response.v2.meta.totalCount);
	        }

	        var htmlAddresses = [],
	            item = response.v2.addresses[0],
	            point = new naver.maps.Point(item.x, item.y);

	        if (item.roadAddress) {
	            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
	        }

	        if (item.jibunAddress) {
	            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
	        }

	        if (item.englishAddress) {
	            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
	        }

	        map.setCenter(point);
	        var marker = new naver.maps.Marker({
	            position: new naver.maps.Point(item.x, item.y),
	            map: map
	        });		
	        sessionStorage.setItem("medicalLat", item.y)
			sessionStorage.setItem("medicalLng", item.x)
	    });
	}

	function makeAddress(item) {
	    if (!item) {
	        return;
	    }

	    var name = item.name,
	        region = item.region,
	        land = item.land,
	        isRoadAddress = name === 'roadaddr';

	    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

	    if (hasArea(region.area1)) {
	        sido = region.area1.name;
	    }

	    if (hasArea(region.area2)) {
	        sigugun = region.area2.name;
	    }

	    if (hasArea(region.area3)) {
	        dongmyun = region.area3.name;
	    }

	    if (hasArea(region.area4)) {
	        ri = region.area4.name;
	    }

	    if (land) {
	        if (hasData(land.number1)) {
	            if (hasData(land.type) && land.type === '2') {
	                rest += '산';
	            }

	            rest += land.number1;

	            if (hasData(land.number2)) {
	                rest += ('-' + land.number2);
	            }
	        }

	        if (isRoadAddress === true) {
	            if (checkLastString(dongmyun, '면')) {
	                ri = land.name;
	            } else {
	                dongmyun = land.name;
	                ri = '';
	            }

	            if (hasAddition(land.addition0)) {
	                rest += ' ' + land.addition0.value;
	            }
	        }
	    }

	    return [sido, sigugun, dongmyun, ri, rest].join(' ');
	}

	function hasArea(area) {
	    return !!(area && area.name && area.name !== '');
	}

	function hasData(data) {
	    return !!(data && data !== '');
	}

	function checkLastString (word, lastString) {
	    return new RegExp(lastString + '$').test(word);
	}

	function hasAddition (addition) {
	    return !!(addition && addition.value);
	}

	</script>
	<button id="findingAway" onclick="findingAway()">길찾기</button>
	<p>
		사업장명 :
		<c:choose>
			<c:when test="${vo.medicalName ne ''}">
				<span id="medicalNameInfo">${vo.medicalName}</span>
			</c:when>
			<c:otherwise> - </c:otherwise>
		</c:choose>
	</p>

	<p>
		소재지 주소 :
		<c:choose>
			<c:when test="${vo.lAddr ne ''}">
			<span id="medicallAddrInfo">${vo.lAddr}</span>
			</c:when>
			<c:otherwise> - </c:otherwise>
		</c:choose>
	</p>

	<p>
		도로명 주소 :
		<c:choose>
			<c:when test="${vo.rAddr ne ''}">
			<span id="medicalrAddrInfo">${vo.rAddr}</span>
			</c:when>
			<c:otherwise> - </c:otherwise>
		</c:choose>
	</p>

	<p>
		우편 번호:
		<c:choose>
			<c:when test="${vo.pCode ne ''}">
			<span id="medicalpCodeInfo">${vo.pCode}</span>
			</c:when>
			<c:otherwise> - </c:otherwise>
		</c:choose>
	</p>

	<p>
		연락처 :
		<c:choose>
			<c:when test="${vo.medicalTel ne ''}">
			<span id="medicalTelInfo">${vo.medicalTel}</span>
			</c:when>
			<c:otherwise> - </c:otherwise>
		</c:choose>
	</p>

	<button id="closeBtn">닫기</button>

</div>
