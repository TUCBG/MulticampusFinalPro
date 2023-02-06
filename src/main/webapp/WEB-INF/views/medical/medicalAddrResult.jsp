<%@page import="com.multi.animal.medical.MedicalVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<p class="count-list">총 ${list.size()}건의 결과를 찾았습니다. </p>
	<p class="down-arrow" onclick="scrollDown()"></p>
	<c:forEach var="vo" items="${list}" >
		<div class="medical-result-wrap">
			<p id="resultMedicalName">
				사업장명 :
				<c:choose>
					<c:when test="${vo.medicalName ne ''}">${vo.medicalName}</c:when>
					<c:otherwise> - </c:otherwise>
				</c:choose>
			</p>

			<p id="resultlAddr">
				소재지 주소 : 
				<c:choose>
					<c:when test="${vo.lAddr ne ''}">${vo.lAddr}</c:when>
					<c:otherwise> - </c:otherwise>
				</c:choose>
			</p>

			<p id="resultrAddr">
				도로명 주소 :
				<c:choose>
					<c:when test="${vo.rAddr ne ''}">${vo.rAddr}</c:when>
					<c:otherwise> - </c:otherwise>
				</c:choose>
			</p>

			<p id="resultpCode">
				우편 번호:
				<c:choose>
					<c:when test="${vo.pCode ne ''}">${vo.pCode}</c:when>
					<c:otherwise> - </c:otherwise>
				</c:choose>
			</p>

			<p id="resultMedicalTel">
				연락처 :
				<c:choose>
					<c:when test="${vo.medicalTel ne ''}">${vo.medicalTel}</c:when>
					<c:otherwise> - </c:otherwise>
				</c:choose>
			</p>
				<button id="medicalId" onclick="info(value)" value="${vo.medicalId}">정보보기</button>
		</div>
		
	</c:forEach>
</div>