<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/medical.css">
<link rel="stylesheet" href="../resources/css/missingBoardInsert.css">
<link rel="stylesheet" href="../resources/css/style.css">
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
</head>
<body>
	<jsp:include page="../header/animal_header.jsp"></jsp:include>
	<%-- <jsp:include page="../header/header.jsp"></jsp:include> --%>
	<div style="height: 818px;">
		<div class="insert_container">
			<h1 class="insert_title">실종 동물 등록</h1>
			<div class="insert_info">
				<div style="height: 35px;"></div>
				<form action="create" method="post" enctype="multipart/form-data">
					<ul>
						<li>*등록인 : <input type="text" name="userId"
							value="<%=session.getAttribute("userId")%>"
							placeholder="내용을 입력하세요." readonly="readonly"></li>
						<li>*글 제목 : <input type="text" name="title"
							placeholder="내용을 입력하세요." required></li>
						<li>*잃어버린 장소 : <select class="insert_select" name="location"><option
									value="서울" selected>서울</option>
								<option value="부산">부산</option>
								<option value="대구">대구</option>
								<option value="인천">인천</option>
								<option value="광주">광주</option>
								<option value="대전">대전</option>
								<option value="울산">울산</option>
								<option value="강원도">강원도</option>
								<option value="제주도">제주도</option></select></li>
						<li>*연락처 : <input type="text" name="tel"
							placeholder="010-0000-0000" required></li>
						<li>*찾는 반려동물 : <input type="radio" name="pet" value="강아지"
							required>강아지 <input type="radio" name="pet" value="고양이">고양이
							<input type="radio" name="pet" value="기타 반려동물">기타 반려동물
						</li>
						<li>*잃어버린 날짜 : <input type="date" name="missingDate"
							placeholder="내용을 입력하세요." required></li>
						<li>*상세설명 :</li>
						<li><textarea id="story" name="description" rows="6"
								cols="80" required></textarea></li>
						<li>*사례금 : <input type="text" name="gratuity"
							placeholder="내용을 입력하세요." required>원
						</li>
						<li class="multi_file">
							<div style="float: left;">*사진첨부 :</div>
							<div id="d_file">
								<input type='file' name='file1' /><br> <input type='file'
									name='file2' /><br> <input type='file' name='file3' />
							</div>
						</li>
					</ul>
					<button type="submit" class="insert_btn1">등록</button>
				</form>
				<button onclick="location.href = 'missingBoard.jsp'"
					class="insert_btn2">취소</button>
			</div>
		</div>
	</div>
</body>
</html>