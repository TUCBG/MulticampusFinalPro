<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/sittercss.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
<div id="total">
	<jsp:include page="../header/animal_header.jsp"></jsp:include>	
	<%if(session.getAttribute("userId") != null) {%>
		<div class="alert alert-success alert-dismissible">
			<%=session.getAttribute("name") %>님의 주소를 기반으로 검색합니다.
		</div>
		<div class="tab_menu">
			<a href="sitterInsert.jsp"><button type="button" class="btn btn-outline-success">시터 구하기</button></a>
			<a href="sitterChatbot.jsp"><button type="button" class="btn btn-outline-success">챗봇</button></a>
			<ul class="list">
				<li class="is_on"><a href="#tab1" class="btn menu">강아지</a>
					<div id="tab1" class="cont">
						<form action="sitter_search">
							<input type="hidden" name="species" value="강아지">
							<input type="hidden" name="page" value="1">
							<select name="care" class="form-control">
								<option value="방문 돌봄 (30분)">방문 돌봄 (30분)
								<option value="산책 돌봄 (30분)">산책 돌봄 (30분)
							</select> <br> 
							<input type="date" name="date"	id="currentDateDog" min="2022-12-24" max="2023-12-31" class="form-control form-control"> <br> <br>
							<script>
							document.getElementById('currentDateDog').value = new Date().toISOString().substring(0, 10);
							</script>
							<input type="hidden" name="searcher" value="<%=session.getAttribute("userId") %>">
							<br>
							<button class="btn btn-outline-success">검색</button>
						</form>
					</div> <!-- tab1 --></li>
				<li><a href="#tab2" class="btn menu">고양이</a>
					<div id="tab2" class="cont">
						<form action="sitter_search">
							<input type="hidden" name="species" value="고양이">
							<input type="hidden" name="page" value="1">
							<select name="care" class="form-control">
								<option value="방문 돌봄 (30분)">방문 돌봄 (30분)
							</select> <br> 
							<input type="date" name="date" id="currentDateCat" min="2022-12-24" max="2023-12-31" class="form-control form-control"> <br> <br>
							<script>
							document.getElementById('currentDateCat').value = new Date().toISOString().substring(0, 10);
							</script>
							<input type="hidden" name="searcher" value="<%=session.getAttribute("userId") %>">
							<br>
							<button class="btn btn-outline-success">검색</button>
						</form>
					</div> <!-- tab2 --></li>
				<li><a href="#tab3" class="btn menu">기타</a>
					<div id="tab3" class="cont">
						<form action="sitter_search">
							<input type="hidden" name="species" value="기타">
							<input type="hidden" name="page" value="1">
							<select name="care" class="form-control">
								<option value="방문 돌봄 (30분)">방문 돌봄 (30분)
							</select> <br>
							<input type="date" name="date" id="currentDateEtc" min="2022-12-24" max="2023-12-31" class="form-control form-control"> <br> <br>
							<script>
							document.getElementById('currentDateEtc').value = new Date().toISOString().substring(0, 10);
							</script> 
							<input type="hidden" name="searcher" value="<%=session.getAttribute("userId") %>">
							<br>
							<button class="btn btn-outline-success">검색</button>
						</form>
					</div> <!-- tab3 -->
				</li>
			</ul>
		</div> <!-- tab menu -->
		
	<%} else { %>
		<div id="center" style="margin-top: 20%; text-align: center;">
			<h5>로그인 후 이용 가능한 페이지입니다.</h5>
		</div> <!-- center -->
	<%} %>
</div> <!-- total -->
	<script>
	const tabList = document.querySelectorAll('.tab_menu .list li');
	for(var i = 0; i < tabList.length; i++){
	  tabList[i].querySelector('.btn').addEventListener('click', function(e){
	    e.preventDefault();
	    for(var j = 0; j < tabList.length; j++){
	      tabList[j].classList.remove('is_on');
	    }
	    this.parentNode.classList.add('is_on');
	  });
	}
	</script>
</body>
</html>