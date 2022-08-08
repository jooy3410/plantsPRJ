<%@page import="poly.dto.ImgDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ImgDTO> rList = (List<ImgDTO>)request.getAttribute("rList");
	
String SS_USER_AUTH = (String)session.getAttribute("SS_USER_AUTH");
String SS_USER_NAME = (String)session.getAttribute("SS_USER_NAME");
String SS_USER_NO = (String)session.getAttribute("SS_USER_NO");
	




%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>이미지 게시판 리스트</title>

    <link href="https://fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,700,800" rel="stylesheet">

    <link rel="stylesheet" href="../mainboot/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../mainboot/css/animate.css">
    
    <link rel="stylesheet" href="../mainboot/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../mainboot/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../mainboot/css/magnific-popup.css">

    <link rel="stylesheet" href="../mainboot/css/aos.css">

    <link rel="stylesheet" href="../mainboot/css/ionicons.min.css">

    <link rel="stylesheet" href="../mainboot/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../mainboot/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../mainboot/css/flaticon.css">
    <link rel="stylesheet" href="../mainboot/css/icomoon.css">
    <link rel="stylesheet" href="../mainboot/css/style.css">
    
    
    <style>
.btn_area {
position: fixed;
bottom: 5%;
width:100%;
 }
 </style>



<META HTTP-EQUIV="Page-Enter" CONTENT="BlendTrans(Duration=0.5)">
<META HTTP-EQUIV="Page-exit" CONTENT="BlendTrans(Duration=0.5)">

<script src="/js/jquery-3.2.1.min.js"></script>

</head>
<body>
<br><br>

<div class="container"><div class="row">


<% for(ImgDTO rDTO : rList) { %>

<div class="col-md-4 ftco-animate fadeInUp ftco-animated">
<div class="blog-entry">
				
	
 	<img src="/resource/images/<%=rDTO.getSave_folder_name()%>/<%=rDTO.getSave_file_name()%>"  style="width:350px; height:300px; display:block; margin: 30px auto;">
 	
 	
</div>
</div>
<% } %>


</div></div>



<div class="btn_area">
<div class="col-6 btn btn-primary py-3 px-5 text-center"  style="display:block; 
 margin: 0 auto;"
onclick="location.href= '/user/Login.do'">
함께하기
</div>
</div>


<script src="/js/jquery-3.2.1.min.js"></script>
  <script src="../mainboot/js/jquery.min.js"></script>
  <script src="../mainboot/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../mainboot/js/popper.min.js"></script>
  <script src="../mainboot/js/bootstrap.min.js"></script>
  <script src="../mainboot/js/jquery.easing.1.3.js"></script>
  <script src="../mainboot/js/jquery.waypoints.min.js"></script>
  <script src="../mainboot/js/jquery.stellar.min.js"></script>
  <script src="../mainboot/js/owl.carousel.min.js"></script>
  <script src="../mainboot/js/jquery.magnific-popup.min.js"></script>
  <script src="../mainboot/js/aos.js"></script>
  <script src="../mainboot/js/jquery.animateNumber.min.js"></script>
  <script src="../mainboot/js/bootstrap-datepicker.js"></script>
  <script src="../mainboot/js/jquery.timepicker.min.js"></script>
  <script src="../mainboot/js/particles.min.js"></script>
  <script src="../mainboot/js/particle.js"></script>
  <script src="../mainboot/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../mainboot/js/google-map.js"></script>
  <script src="../mainboot/js/main.js"></script>
</body>

</html>