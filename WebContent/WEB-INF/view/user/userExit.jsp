<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.UserDTO"%>
<%@ page import="poly.util.EncryptUtil"%>
<%
	UserDTO rDTO = (UserDTO) request.getAttribute("rDTO");
	String res = (String) request.getAttribute("res");
	String password = CmmUtil.nvl((String) request.getAttribute("password"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

<link rel="stylesheet" href="../css/style.css">
<script src="https://kit.fontawesome.com/54d6336788.js"
	crossorigin="anonymous"></script>

<style>
.navbar-icon {
	color: black;
	font-weight: 700;
	font-size: 27px;
	text-transform: uppercase;
	letter-spacing: 1px;
	line-height: 1;
}

.navbar-icon i {
	color: #167ce9;
	font-size: 30px;
}
</style>

 <!-- Font Icon -->
    <link rel="stylesheet" href="../fonts1/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="../css1/style.css">

</head>


<body>

	<!--메인 로고 자리-->
	
	<div class="container" align="center">
	<div class="form-group">
			<a class="navbar-icon" href="/index.do"><i
				class="fas fa-globe"></i>&nbsp;Zero Waste Challenge <br></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				</button></div></div>



	<!-- 회원정보 수정 -->

	<form name="f" action="/user/delUser.do" method="post"
		onsubmit="return doRegUserCheck(this);">
		<div class="main">
        <section class="signup">
        <div class="container">
        <div class="signup-content">
		<h2 class="form-title">회원 탈퇴</h2>

		<div class="form-group">
			<input type="text" class="form-input" name="user_id"
				value="<%=CmmUtil.nvl(rDTO.getEmail())%>" placeholder="이메일"
				readonly />
		</div>


		<div class="form-group">
			<input type="text" class="form-input" name="user_name"
				value="<%=CmmUtil.nvl(rDTO.getUser_name())%>" placeholder="닉네임"
				readonly />
		</div>


		<div class="form-group">
			<input type="password" class="form-input" name="password"
				placeholder="비밀번호" />
		</div>



		<div class="form-group">
			<input type="password" class="form-input" name="password2"
				placeholder="비밀번호 확인" />
		</div>



		<div class="form-group">
			<input type="submit" name="submit" class="form-submit"
				value="탈퇴하기" />
		</div>
		</div>
		</div>
		</section>
		</div>
	</form>

	<!-- 회원정보 수정 끝-->

	<script type="text/javascript">
		// 회원가입 유효성 체크
		function doRegUserCheck(f) {

			if (f.password.value == "") {
				alert("비밀번호를 입력하세요.");
				f.password.focus();
				return false;
			}

			if (f.password2.value == "") {
				alert("비밀번호확인을 입력하세요.");
				f.password2.focus();
				return false;
			}

			}

	</script>
	<script src="../js/jquery-3.5.1.min.js"></script>
</body>
</html>