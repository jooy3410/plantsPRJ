<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<!-- Main css -->
<link rel="stylesheet" href="../userboot/css1/style.css">
<script src="https://kit.fontawesome.com/54d6336788.js"
   crossorigin="anonymous"></script>
<script src="/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
   var pass = 0;
   var pass2 = 0;
   // 회원가입 유효성 체크
   function Validator() {
      if (pass == 0) {
         alert("이메일을 다시 입력해주세요.")
         return (false);
      } else if (pass2 == 0) {
         alert("아이디를 다시 입력해주세요.")
         return (false);
      } else {
         return (true);
      }
   }

	//이메일 중복체크
	var expEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; //이메일 형식 저장
	function emailCheck() {
		if (expEmail.test($("#email").val()) == false) {
			if ($("#email").val() == "") {
				document.getElementById("emailCheck").innerHTML = '이메일을 입력해주세요.';
				document.getElementById("emailCheck").style.color = "#FF0000";
			} else {
				document.getElementById("emailCheck").innerHTML = '올바르지 않은 이메일 형식입니다.';
				document.getElementById("emailCheck").style.color = "#FF0000";
			}
			pass = 0;
			return (false);
		} else {
			//ajax 호출
			$
					.ajax({
						//function을 실행할 url
						url : "/signup/emailCheck.do",
						
						type : "post",
						dataType : "json",
						data : {
							"email" : $("#email").val()
						},
						success : function(data) {
							if (data == 0) { // 가입되지 않은 이메일이면 0
								document.getElementById("emailCheck").innerHTML = '사용 가능한 이메일입니다.';
								document.getElementById("emailCheck").style.color = "#008000";
								pass = 1;
							} else if (data == 1) { // 회원이면 1
								document.getElementById("emailCheck").innerHTML = '이미 가입한 이메일입니다.';
								document.getElementById("emailCheck").style.color = "#FF0000";
								pass = 0;
							}

						}
					})
		}
	}

	   //ID 중복체크
	   function nameCheck() {
	      if ($("#user_name").val() == false) {
	         pass2 = 0;
	         document.getElementById("nameCheck").innerHTML = '닉네임를 입력해주세요.';
	         document.getElementById("nameCheck").style.color = "#FF0000";
	         return false;
	      } else {
	         //ajax 호출
	         $
	               .ajax({
	                  //function을 실행할 url
	                  url : "/signup/nameCheck.do",
	                  type : "post",
	                  dataType : "json",
	                  data : {
	                     "user_name" : $("#user_name").val()
	                  },
	                  success : function(data) {
	                     if (data == 0) { // 가입되지 않은 아이디면 0
	                        document.getElementById("nameCheck").innerHTML = '사용 가능한 닉네임입니다.';
	                        document.getElementById("nameCheck").style.color = "#008000";
	                        pass2 = 1;
	                     } else if (data == 1) { // 회원이면 1
	                        document.getElementById("nameCheck").innerHTML = '이미 사용중인 닉네임입니다.';
	                        document.getElementById("nameCheck").style.color = "#FF0000";
	                        pass2 = 0;
	                        return false;
	                     }

	                  }
	               })
	      }
	   }

	   //비밀번호 체크
	   function pwCheck() {
	      if ($("#password").val() != $("#password").val()) {
	         document.getElementById("pwCheck").innerHTML = '비밀번호가 일치하지 않습니다.';
	         document.getElementById("pwCheck").style.color = "#FF0000";
	         return false;
	      }
	      else {
	         document.getElementById("pwCheck").innerHTML = '비밀번호가 일치합니다.';
	         document.getElementById("pwCheck").style.color = "#008000";
	      }
	   }
	</script>

</head>
<body>
	<form name="f" id="f" action="/user/insertUserInfo.do" method="post"
		onsubmit="return Validator(this)">

		<!-- 부트스트랩 시작 -->
		<div class="main">

			<section class="signup">
				<!-- <img src="images/signup-bg.jpg" alt=""> -->
				<div class="container">
					<div class="signup-content">
						<h2 class="form-title">회원가입</h2>
						
						
						<div class="form-group">
							<input type="email" id="email" class="form-input" name="email"
								placeholder="Email" onkeyup="emailCheck()" required >
								<div id="emailCheck"></div>
						</div>

						<div class="form-group">
							<input type="text" class="form-input" name="user_name" id="user_name"
								placeholder="닉네임" onkeyup="nameCheck()" required > 
								<div id="nameCheck"></div>
						</div>
						

						
                  <div class="form-group">
                     <input type="password" id="password" class="form-input" name="password"
                        placeholder="비밀번호" required /> 
                  </div>



                  <div class="form-group">
                     <input type="password" id="password2" class="form-input" name="password2"
                        placeholder="비밀번호 확인" onkeyup="pwCheck()" required /> 
                  </div>
                  <span id="pwCheck">비밀번호를 입력하세요</span>
						



						

						<div class="form-group">
							<input type="submit" name="submit" class="form-submit"
								value="가입하기" />
						</div>
					</div>
				</div>
			</section>
		</div>
	</form>
</body>
</html>