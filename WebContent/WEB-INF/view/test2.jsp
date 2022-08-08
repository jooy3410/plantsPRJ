<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">

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
<script src="/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(window).on("load", function() {

		// 미래 날씨 정보 api 실행
		weatherFuture();
	});
	
	// 미래 날씨 정보 api
	function weatherFuture() {
		var weatherFutureApiURL = "https://api.openweathermap.org/data/2.5/forecast?q=seoul&id=524901&appid=ddee8cc2c5200bcd83e14e7967de3af3";
		$.ajax({
			url : weatherFutureApiURL,
			dataType : "json",
			type : "GET",
			success : function(res) {
				
				console.log(res)
				for(var i = 0; i < 40; i++){			
				
				console.log("dt_txt : " + res["list"][i]["dt_txt"]);
				console.log("temp : " + Math.ceil(res.list[i].main.temp - 273.15) + "℃");
				console.log("temp_min : " + Math.ceil(res.list[i].main.temp_min - 273.15) + "℃");
				console.log("temp_max : " + Math.ceil(res.list[i].main.temp_max - 273.15) + "℃");
				console.log("humidity : " + res.list[i].main.humidity + "%");
				
				console.log("weather : " + res.list[i].weather[0].main);
				var icon = res.list[i].weather[0].icon;
				console.log("icon : " + "http://openweathermap.org/img/w/" + icon + ".png");
				
				console.log("clouds : " + res.list[i].clouds.all);
				
				console.log("speed : " + res.list[i].wind.speed);
				console.log("deg : " + res.list[i].wind.deg);
				console.log("gust : " + res.list[i].wind.gust);
				
				$('#temp' + i).html(Math.ceil(res.list[i].main.temp - 273.15) + "℃");
				$('#temp_min' + i).html(Math.ceil(res.list[i].main.temp_min - 273.15) + "℃");
				$('#temp_max' + i).html(Math.ceil(res.list[i].main.temp_max - 273.15) + "℃");
				$('#humidity' + i).html(res.list[i].main.humidity + "%");
				$('#weather' + i).html(res.list[i].weather[0].main);
				$('#icon' + i).attr("src", "http://openweathermap.org/img/w/" + res.list[i].weather[0].icon + ".png");
				$('#clouds' + i).html(res.list[i].clouds.all + "%");
				$('#speed' + i).html(res.list[i].wind.speed + "㎧");
				$('#deg' + i).html(res.list[i].wind.deg + "°");
				$('#gust' + i).html(res.list[i].wind.gust + "㎧");
				$('#dt_txt' + i).html(res["list"][i]["dt_txt"]);
				
				}
				
				
			}
		})
	}
	
</script>
<body>



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


  <section id="about" class="about">
      <div class="container">

        <div class="section-title">
          <h2>날씨</h2>
        </div>



<!--  <div class="table">
<div class="row">
<div class="col-6">asdasd</div>
<div class="col-6">asdads</div>

</div>
</div>
-->


<%for(int i=0; i<40; i++){ %>
<div class="table">
	<div class="row" id="dt_txt<%=i%>" >
		
	</div>
	
	<br>
	
	<div class="row">
	
		<div class="col-2">온도</div>
		<div class="col-2" id="temp<%=i%>"></div>
		<div class="col-2">최저 온도</div>
		<div class="col-2" id="temp_min<%=i%>"></div>
		<div class="col-2">최고 온도</div>
		<div class="col-2" id="temp_max<%=i%>"></div>
	
	</div>
	
	<br>

	<div class="row">
		<div class="col-2">습도</div>
		<div class="col-2" id="humidity<%=i%>"></div>
		<div class="col-2">아이콘</div>
		<div class="col-2"><img id="icon<%=i%>"></div>
		<div class="col-2">운량</div>
		<div class="col-2" id="clouds<%=i%>"></div>
	</div>
	
	<br>
	
	<div class="row">
		<div class="col-2">풍속</div>
		<div class="col-2" id="speed<%=i%>"></div>
		<div class="col-2">풍향</div>
		<div class="col-2" id="deg<%=i%>"></div>
		<div class="col-2">돌풍</div>
		<div class="col-2" id="gust<%=i%>"></div>
	</div>
<br>
</div>
<%} %>



    </section><!-- End About Us Section -->





</main>


  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <div class="copyright">
         <strong><span></span></strong>
      </div>
      <div class="credits" style="padding-bottom: 25%;">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/free-one-page-bootstrap-template-amoeba/ -->
         <a href="https://bootstrapmade.com/"></a>
      </div>
    </div>
  </footer><!-- End #footer -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>






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