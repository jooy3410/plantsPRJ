<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%
String SS_USER_AUTH = (String)session.getAttribute("SS_USER_AUTH");
String SS_USER_NAME = (String)session.getAttribute("SS_USER_NAME");
String SS_USER_NO = (String)session.getAttribute("SS_USER_NO");
%>






<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>로그인 및 회원가입</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="../userboot/fonts1/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<!-- Main css -->
<link rel="stylesheet" href="../userboot/css1/style.css">
<script src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function doLoginSafeUserCheck(f) {
	var user_id = f.user_id.value;
	var password = f.password.value;
	
	
	if (f.user_id.value == "") {
		alert("아이디를 입력하세요.");
		f.user_id.focus();
		return false;
	}
	if (f.password.value == "") {
		alert("비밀번호를 입력하세요.");
		f.password.focus();
		return false;
	}

}
		
	//로그인을 위한 입력정보와 유효성 체크하기
	
</script>

</head>
<body>





	<div class="main">

		<section class="signup">
			<!-- <img src="images/signup-bg.jpg" alt=""> -->
			<div class="container">
				<div class="signup-content">
					<form name="f" method="post" action="/user/getLoginCheck.do" id="signup-form"
						class="signup-form" onsubmit="return doLoginSafeUserCheck(this);">
						
						<h2 class="form-title">로그인</h2>

						<div class="form-group">
							<input type="text" id="email" class="form-input" name="email"
								placeholder="이메일" />
						</div>




						<div class="form-group">
							<input type="password" id="password" class="form-input" name="password"
								placeholder="비밀번호" /> <span toggle="#password"
								class="zmdi zmdi-eye field-icon toggle-password"></span>
						</div>





						<div class="form-group">
							<input type="submit" class="form-submit" value="LOGIN" />
						</div>



					</form>



					<p class="loginhere">

						<a href="/user/UserRegForm.do" class="loginhere-link">회원가입</a> &nbsp;
						<a href="/user/passSearch.do" class="loginhere-link">비밀번호 찾기</a>
					</p>
				</div>
			</div>
		</section>

	</div>



	<!-- JS -->
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script src="../vendor1/jquery/jquery.min.js"></script>
	<script src="../js1/main.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>