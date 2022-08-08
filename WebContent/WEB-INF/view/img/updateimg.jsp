<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="poly.dto.ImgDTO"%>
<%@page import="poly.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.ArrayList" %>
<%@page import="poly.util.CmmUtil"%>    
<%

String SS_USER_AUTH = (String)session.getAttribute("SS_USER_AUTH");
String SS_USER_NAME = (String)session.getAttribute("SS_USER_NAME");
String SS_USER_NO = (String)session.getAttribute("SS_USER_NO");
String user_no = CmmUtil.nvl((String) request.getAttribute("user_no"));
ImgDTO rDTO = (ImgDTO) request.getAttribute("rDTO");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토리 수정하기</title>


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
bottom: 0;
width:100%;
}
 
 .doCenter{
 display:block; 
 margin: 0 auto;
 }
 
</style>

</head>
<body>
	<br><br>
	<div style="
    padding-left: 20px;
    padding-right: 20px;
">
	<%-- <div class="container bg-light">--%>
	<form name="form1" method="post" action="/img/updateImg.do">

    <%--<div>
		<br/>
		
		 <div><input type="file" name="fileUpload" 
		 value="img src="/resource/images/<%=rDTO.getSave_folder_name()%>/<%=rDTO.getSave_file_name()%>"  style="width:350px; height:300px;"/></div>
		
		</div>
		--%>
		
		<%--<input type="file" name="fileUpload" style="float: none; margin:100 auto;" />
		<br/>
		<br/>
		--%>
		
		<div class="form-group">
		<input type="text" name="note" cols="30" rows="7" class="form-control" placeholder="글을 남겨 주세요" value="<%=CmmUtil.nvl(rDTO.getNote())%>"/>
		<input type="text" name="seq" style="display:none" value='<%=rDTO.getSeq()%>'/>
		
		
		</div>
		
		<br/>
		<br/>
	
	<input class="btn btn-primary py-3 px-5" type="submit" value="수정하기" style="display:block; 
 margin: 0 auto;"/>
	</form>
	</div>
	<%-- </div>--%>
	
	<!-- 하단바 -->
<div class="btn_area">
<footer class="ftco-footer ftco-bg-dark ftco-section" style="
    padding-top: 15px;
    padding-bottom: 15px;
    background: #e9ecef;
"
>
<div class="row">
<div class="col-4">
<a href="/img/getimg.do"><img class="doCenter" src="../mainboot/images/menu_icon.png" style="width: 24px;"></a>
</div>
<div class="col-4">
<a href="/user/mypage.do"><img class="doCenter" src="../mainboot/images/user_icon_f.png" style="width: 24px;"></a>
</div>
<div class="col-4">
<a href="/chat/chat.do"><img class="doCenter" src="../mainboot/images/chat_icon.png" style="width: 24px;"></a>
</div>
</div>
</footer>
</div>
<!-- 하단바 끝 -->
	
	
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