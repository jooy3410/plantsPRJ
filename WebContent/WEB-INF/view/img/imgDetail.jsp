<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.ImgDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="poly.dto.ImgDTO"%>
    <%@page import="java.util.List"%>
    <%@ page import="java.util.ArrayList" %>
    <%
    	String SS_USER_AUTH = (String)session.getAttribute("SS_USER_AUTH");
    	String SS_USER_NAME = (String)session.getAttribute("SS_USER_NAME");
    	String SS_USER_NO = (String)session.getAttribute("SS_USER_NO");
    %>
    
 
 <%
 	ImgDTO rDTO = (ImgDTO) request.getAttribute("rDTO");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
    
    <!-- 버튼 css -->
    <!-- <link rel="stylesheet" href="../assets/css/main.css" /> -->
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

<script src="/js/jquery-3.2.1.min.js"></script>


</head>

<body>
<%--  이미지 게시판 상세페이지
<div>
<p>이미지 게시번호 : <%=CmmUtil.nvl(rDTO.getSeq())%> </p>
</div> 
 --%>


 
 
 <%-- <section class="ftco-section bg-light">--%>
 
 <br><br>
      <div class="container">
        <div class="row">
          <div class="col-md-4 ftco-animate">
           <div class="blog-entry">
           <div class="block-20">
              <img class="block-20" src="/resource/images/<%=rDTO.getSave_folder_name()%>/<%=rDTO.getSave_file_name()%>" />
              </div>
              <div class="text p-4 d-block">
                <div class="meta mb-3">
                  <div><%=CmmUtil.nvl(rDTO.getReg_dt())%></div>
                  <div><%=CmmUtil.nvl(rDTO.getReg_id())%></div>
                  
                </div>
                <h3 class="heading"><%=CmmUtil.nvl(rDTO.getNote())%></h3>
              </div>
            </div>
          </div>
          </div>
          
           <div class="row">
           <div class="col-6 btn btn-primary py-3 px-5 text-center"
           onclick="location.href=' /img/updateimg.do?no=<%=CmmUtil.nvl(rDTO.getSeq())%>'">수정
		</div>
		<div class="col-6 btn btn-primary btn-outline-primary py-3 px-5 text-center"
		onclick="location.href=' /img/imgDelete.do?no=<%=CmmUtil.nvl(rDTO.getSeq())%>'">삭제
		</div>
	</div>
          </div>
         <%--  </section> --%>
          
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