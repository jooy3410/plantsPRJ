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
	List<ImgDTO> rList = (List<ImgDTO>)request.getAttribute("rList");
    
    if (rList == null) {
        rList = new ArrayList<ImgDTO>();
    }

%>
<!DOCTYPE html>
<html>
<head>


<META HTTP-EQUIV="Page-Enter" CONTENT="BlendTrans(Duration=0.5)">
<META HTTP-EQUIV="Page-exit" CONTENT="BlendTrans(Duration=0.5)">


<meta charset="UTF-8">
<title>Insert title here</title>


<script src="/js/jquery-3.2.1.min.js"></script>






<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Amoeba Bootstrap Template - Home</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../mainboot/assets/img/favicon.png" rel="icon">
  <link href="../mainboot/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Lato:400,300,700,900" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../mainboot/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../mainboot/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="../mainboot/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="../mainboot/assets/vendor/venobox/venobox.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../mainboot/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Amoeba - v2.0.0
  * Template URL: https://bootstrapmade.com/free-one-page-bootstrap-template-amoeba/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>






<script type="text/javascript">
	$(document).ready(function() {
		var user_no = <%=SS_USER_NO%>;
		console.log("가져온 회원 번호 : " + user_no);
		
		$.ajax({
			url: "/getMyImg.do",
			type: "post",
			dataType: "JSON",
			success: function(json) {
				
				var resHTML = "";
				
				resHTML += '<div class="container"><div class="row">';
				
				console.log("받아온 rList : " + json + typeof json);
				
			for (var i=0; i<json.length; i++) {
				console.log("받아온 rList 값들 : " + json[i].user_no);
				console.log("받아온 rList 이미지 : " + json[i].save_folder_name);
				
				resHTML += '<div class="col-lg-4 col-md-6 filter-app">'
				resHTML += '<div class="portfolio-item">'
				//resHTML += '<div class="block-20">'
				resHTML += '<a href="javascript:doDetail(' + json[i].seq + ')"><img src="/resource/images/' + json[i].save_folder_name + '/' + json[i].save_file_name + '" style="width: 384px; height: 302px; display: block; margin: 0 auto;"/>'
				resHTML += '</a>'
				//resHTML += '</div>'
				resHTML += '</div>'
				resHTML += '</div>'
			}
			
				resHTML += '</div></div>';
			//id=myimg에 결과값을 넣어주기위해서 결과값을 넣어주는 변수
			
			$("#myImg").html(resHTML);
			
			
			}
			
		})
		
	})
	
	function doDetail(seq) {
		console.log("가져온 게시글 번호 : " + seq);
		//get방식으로 no를 가져온다. 주소에다가 get방식으로 호출할때
		location.href = "/img/imgDetail.do?no=" + seq;
	}

</script>

    <style>
.btn_area {
position: fixed;
bottom: 0;
width:100%;
 }
 
 
 .toCenter {
 display:block; 
 margin: 0 auto;
 margin-top: 20px;
 }
 
 .doCenter{
 display:block; 
 margin: 0 auto;
 }
 </style>



</head>
<body>



<!-- top 네비게이션바 -->



 <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container">

      <div class="logo float-left">
        <h1 class="text-light"><a href="index.html"><span>Amoeba</span></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav class="nav-menu float-right d-none d-lg-block">
        <ul>
          <li class="active"><a href="#header">Home</a></li>
          <li><a href="#about">About Us</a></li>
          <li><a href="#services">Services</a></li>
          <li><a href="#portfolio">Portfolio</a></li>
          <li><a href="#team">Team</a></li>
          <li class="drop-down"><a href="">Drop Down</a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="drop-down"><a href="#">Drop Down 2</a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
              <li><a href="#">Drop Down 5</a></li>
            </ul>
          </li>
          <li><a href="#contact">Contact Us</a></li>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End #header -->




<main id="main">

<!--
 
    <div class="row" style="
    margin: 10px;"></div>
    
    <div class="row">
	<div class="col-3" style="display:block; margin: 0 auto;"><a href="/logOut.do"><img class="toCenter" src="../mainboot/images/door_icon.png" style="width: 32px;"></a></div>
	<div class="col-6" ></div>
	<div class="col-3" style="display:block; margin: 0 auto;"><a href="/board/boardList.do"><img class="toCenter" src="../mainboot/images/speaker_icon.png" style="width: 32px;"></a></div>
    </div>
    
    <br><br>
    
    <div class="row">
    <div class="col-5"></div>
    <div class="col-2">
    <img class="dpCenter" src="../mainboot/images/user_icon.png" style="width: 62px; display:block; 
 margin: 0 auto;">
    </div>
    <div class="col-5"></div>
    
    </div>
    <br><br>
    <hr>
	
    
    
    <div class="btn btn-primary btn-outline-primary py-3 px-5 text-center" style=" display: block; margin: 100px;" > 
    <a href="/routine/routineList.do"> 아침 루틴을 확인해 보세요</a></div>
 
     <hr>
     --> 
 
 
 
 
 
 
 
	<hr>
	<div class="row">
	
	<div class="col-4 text-center">
	<h6 style="display:block; margin: 0 auto;">스토리</h6>
	</div>
	
	<div class="col-4"></div>
	
	<div class="col-4 text-center">
	
	 <h6 ><a href="/img/ImageFileUpload.do">  추가하기 </a> </h6>
	
	</div>
	
	</div>
	
	
<!-- 이미지 게시판 시작 -->
	<br>
	<div id="myImg"></div>
	
	<br><br>
	
	<!-- 이미지 게시판 끝 -->
	
 
 
 <!-- ======= Our Portfolio Section ======= 
    <section id="portfolio" class="portfolio">
      <div class="container">

        <div class="section-title">
          <h2>나의 가드닝 기록</h2>
        </div>

        

        <div class="row portfolio-container">

          <div class="col-lg-4 col-md-6 filter-app">
            <div class="portfolio-item">
              <img src="assets/img/portfolio/portfolio-1.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h3><a href="assets/img/portfolio/portfolio-1.jpg" data-gall="portfolioGallery" class="venobox" title="App 1">App 1</a></h3>
                <a href="assets/img/portfolio/portfolio-1.jpg" data-gall="portfolioGallery" class="venobox" title="App 1"><i class="icofont-plus"></i></a>
              </div>
            </div>
          </div>


        </div>

      </div>
    </section>  End Our Portfolio Section -->
 
 
 
 
 
 
</main>
      
<!-- 하단바 
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
 하단바 끝 -->

    
  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Amoeba</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/free-one-page-bootstrap-template-amoeba/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End #footer -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
  <script src="../mainboot/assets/vendor/jquery/jquery.min.js"></script>
  <script src="../mainboot/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../mainboot/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="../mainboot/assets/vendor/php-email-form/validate.js"></script>
  <script src="../mainboot/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="../mainboot/assets/vendor/venobox/venobox.min.js"></script>

  <!-- Template Main JS File -->
  <script src="../mainboot/assets/js/main.js"></script>

</body>

</html>