<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="text-align: center;">사용자가 거주하시는 ${list[0].location} 지역의 검색 결과입니다.</div>
<c:forEach items="${list}" var="vo" varStatus="status">
	<div class="list_border">
		<c:if test="${vo.rule eq 1}">
			<img class="missingEnd_img" alt="end" src="../resources/img/실종종료.png">
		</c:if>
		<div class="img_wrap">
			<img class="missing_img" alt="pet" src="../resources/upload/${vo.img1}">
		</div>
		<ul>
			<li class="missing_infoList"><a href="boardDetail?missingId=${vo.missingId}">${vo.title}</a></li>
			<li class="missing_infoList">지역 : ${vo.location}</li>
			<li class="missing_infoList">종류 : ${vo.pet}</li>
			<li class="missing_infoList">사례금 : ${vo.gratuity}원</li>
		</ul>
	</div>
</c:forEach>
