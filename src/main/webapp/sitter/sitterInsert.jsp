<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="../resources/css/sittercss.css">
<script type="text/javascript">
	function checkNull(){
		var frm = document.form1;
		
		if (!frm.file.value) {
			alert("이미지를 등록하세요!");
			return false;
		}
		if (!frm.sitterTel.value) {
			alert("연락처를 입력하세요!");
			return false;
		}
	}
</script>
</head>
<body>
<div id = "total">
	<jsp:include page="../header/animal_header.jsp"></jsp:include>
	<div id="center">
		<form action="sitter_insert" id="form" method="post" enctype="multipart/form-data" name="form1" onsubmit="return checkNull();">
			<table class="table table-borderless" id="insertform">
				<tr>
					<th colspan="2">시터 구인</th>
				</tr>
				<tr>
					<td>예약</td>
					<td>
						<select name="reserve" class="form-control">
							<option value="구해요">구해요
							<option value="완료">완료
						</select>
					</td>
				</tr>
				<tr>
					<td>종</td>
					<td>
						<select name="species" id="species" class="form-control">
							<option value="강아지" selected="selected">강아지</option>
							<option value="고양이">고양이</option>
							<option value="기타">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>돌봄</td>
					<td>
						<select name="care" class="form-control">
							<option value="방문 돌봄 (30분)">방문 돌봄 (30분)
							<option value="산책 돌봄 (30분)">산책 돌봄 (30분)
						</select>
					</td>
				</tr>
				<tr>
					<td>마리</td>
					<td>
						<select name="animals" class="form-control">
							<option value="1">1
							<option value="2">2
							<option value="3">3
						</select>
					</td>
				</tr>
				<tr>
					<td>날짜</td>
					<td>
						<input type="date" name="date" id="currentDate" min="2022-12-24" max="2023-12-31" class="form-control form-control"> 
						<script>
						document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
						</script>
					</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" id="sitterTel" name="sitterTel" class="form-control form-control"></td>
				</tr>
				<tr>
					<td>기타 요구사항</td>
					<td><textarea name="comment" rows="5" cols="20" form="form" class="form-control"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="file" name="file" id="file" class="form-control-file border">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class="btn btn-light">등록</button>
					</td>
				</tr>
			</table> <br>
			<input type="hidden" name="userId" value="<%=session.getAttribute("userId")%>">
		</form>
	</div> <!-- center -->
</div> <!-- total -->
</body>
</html>