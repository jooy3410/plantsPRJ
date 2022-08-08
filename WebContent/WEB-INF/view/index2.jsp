<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script src="/jquery.min.js"></script>
<%
String SS_USER_AUTH = (String)session.getAttribute("SS_USER_AUTH");
String SS_USER_NAME = (String)session.getAttribute("SS_USER_NAME");
String SS_USER_NO = (String)session.getAttribute("SS_USER_NO");
%>


	<head>
		<title>Stellar by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		


</head>
	<body class="is-preload">


		<!-- Wrapper -->
			<div id="wrapper">

				
				<!-- Main -->
					<div id="main" style="
    margin-left: 20px;
    margin-right: 20px;">

						<!-- Introduction -->
							
							<div class="row" style="
   							 margin-top: 0px;
  							  padding-top: 300px;
   							 padding-bottom: 200px;"
							>
							
								
								<h1>미라클모닝</h1>
									
								
									
									
								</div>
								
								
								
								
						
							
							
							
							

					</div>

<br><br>
								
													<footer class="major" style="
    margin-left: 20px;
    margin-right: 20px;">
					<div class= "row">
					
					<div class= "col-5">
					<ul class="actions special">		
					
					<% if (SS_USER_NO == null) { %>
					<li><a href="/user/Login.do" class="button primary">함께하기</a></li>
					<% } else { %>
					<li><a href="/logOut.do" class="button primary">로그아웃</a></li>
					<% } %>
					</ul>
										</div>
										
					<div class ="col-2"></div>
					
					<div class ="col-5">
					<ul class="actions special">
										<li><a href="/img/getimg.do" class="button primary">둘러보기</a></li></ul>
										</div>
									
								
								</div>
								</footer>
								


			</div>
<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<!-- ><script src="assets/js/util.js"></script>  -->
			<!--  <script src="assets/js/main.js"></script>  -->





</body>
</html>