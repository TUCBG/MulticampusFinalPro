<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#total {
    width:100%;
    height:100%;
}
#center {
	width:500px;
    height:500px;
    margin:0 auto;
    margin-top: 90px;
    text-align: center;
</style>
</head>
<body>
	<div id="total">
		<jsp:include page="../header/animal_header2.jsp"></jsp:include>
		<div id="center">
			<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
				integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx"
				crossorigin="anonymous"></script>
			<script>
				Kakao.init('41183abd27baa45cb574d2bf9ee6410f'); // 사용하려는 앱의 JavaScript 키 입력
			</script>

			<a id="kakao-login-btn" href="javascript:loginWithKakao()"> <img
				src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
				width="222" alt="카카오 로그인 버튼" />
			</a>
			<p id="token-result"></p>

			<script>
				function loginWithKakao() {
					Kakao.Auth
							.authorize({
								/* redirectUri: 'http://localhost:8081/animal/index.jsp', */
								/* redirectUri : 'http://localhost:8081/animal/kakaologin/oauth', */
								redirectUri : 'http://localhost:8087/animal/kakaologin',
							});
				}
			</script>
		</div>
	</div>

</body>
</html>