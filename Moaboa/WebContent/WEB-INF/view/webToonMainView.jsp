<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico" />

<!-- Web Fonts -->
<link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin' />

<!-- CSS Global Compulsory -->
<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/shop.style.css" />

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="assets/css/headers/header-v5.css" />
<link rel="stylesheet" href="assets/css/footers/footer-v4.css" />

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="assets/plugins/animate.css" />
<link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css" />
<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css" />
<link rel="stylesheet" href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css" />
<link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings.css" />

<!-- materialize CSS --> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>

<script type="text/javascript">
  	$(function(){
		$("#mon").on("click", function(param){
			location.href="webToon.do?week=mon"
		})
		$("#tue").on("click", function(param){
			location.href="webToon.do?week=tue"
		})
		$("#wed").on("click", function(param){
			location.href="webToon.do?week=wed"
		})
		$("#thu").on("click", function(param){
			location.href="webToon.do?week=thu"
		})
		$("#fri").on("click", function(param){
			location.href="webToon.do?week=fri"
		})
		$("#sat").on("click", function(param){
			location.href="webToon.do?week=sat"
		})
		$("#sun").on("click", function(param){
			location.href="webToon.do?week=sun"
		})
	}); 
</script>

<!-- CSS Customization -->
<link rel="stylesheet" href="assets/css/custom.css" />
</head>
<body class="header-fixed">
<div class="wrapper">
       <!-- 헤더 인클루드 -->
	<%@include file="include/header_inc.jsp" %>
    
    <!-- 오늘 업데이트 된 웹툰 시작 -->
    <div class="todayToon">
       <c:forEach var="i" items="${topWebToonList }" begin="1" end="3" step="1">
            <div class="toonBox">
               <div class="toonImg">
                  <img src="${i.wImage }" alt="" />
               </div>
               <div class="toonDesc">
                  <a href="webToonDetail.do?wname=${i.wName }&site=${i.webSite}"><strong class="title">${i.wName }</strong></a>
               </div>
            </div>
      </c:forEach>
    </div>
    <!-- // 오늘 업데이트 된 웹툰 -->
    </div>
    <!-- // 오늘 업데이트 된 웹툰 -->


		<!--=== Sponsors ===-->
		<div class="container content">
			<div class="heading heading-v1 margin-bottom-10">
				<h2>추천 웹툰</h2>
			</div>

			<div class="recoToon">
 				<c:forEach var="i" items="${rndWebToon }">
				${i }
					<div class="toonBox">
						<div class="img">
							<img src="${i.wImage }" alt="" />
						</div>
						<div class="desc">
							<span class="tit">${i.wName }</span> <span class="writer">작가명</span>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!--=== End Sponsors ===-->

	<!--=== Illustration v4 ===-->
	<div class="row illustration-v4 margin-bottom-40">
		<!-- 월~일 구분 버튼 추가 -->
		<div class="dotwBtn">
			<a class="btn-floating btn-large waves-effect waves-light gray">
				<i class="material-icons" id="mon" value="mon">월</i>
			</a>
			<a class="btn-floating btn-large waves-effect waves-light gray">
				<i class="material-icons" id="tue" value="tue">화</i>
			</a>
			<a class="btn-floating btn-large waves-effect waves-light gray">
				<i class="material-icons" id="wed" value="wed">수</i>
			</a>
			<a class="btn-floating btn-large waves-effect waves-light gray">
				<i class="material-icons" id="thu" value="thu">목</i>
			</a>
			<a class="btn-floating btn-large waves-effect waves-light gray">
				<i class="material-icons" id="fri" value="fri">금</i>
			</a>
			<a class="btn-floating btn-large waves-effect waves-light gray">
				<i class="material-icons" id="sat" value="sat">토</i>
			</a>
			<a class="btn-floating btn-large waves-effect waves-light gray">
				<i class="material-icons" id="sun" value="sun">일</i>
			</a>
		</div>
		<div class="col-md-4">
			<div class="heading heading-v1 margin-bottom-20">
				<!-- Naver Webtoon -->
				<h2>Naver</h2>
			</div>

			<c:forEach var="i" items="${webToonList }">
				<div class="thumb-product">
					<img class="thumb-product-img" src="${i.wImage }" alt="">

					<div class="thumb-product-in">
						<h4>
							<a href="webToonDetail.do?wname=${i.wName }&site=${i.webSite}">${i.wName }</a>
						</h4>
						<span class="thumb-product-type">작가이름</span>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- Daum Webtoon -->
		<div class="col-md-4">
			<div class="heading heading-v1 margin-bottom-20">
				<h2>Daum</h2>
			</div>
			<c:forEach var="i" items="${webToonList }">
				<div class="thumb-product">
					<img class="thumb-product-img" src="${i.wImage }" alt="">

					<div class="thumb-product-in">
						<h4>
							<a href="shop-ui-inner.html">${i.wName }</a>
						</h4>
						<span class="thumb-product-type">작가이름</span>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- Lezhin Webtoon -->
		<div class="col-md-4 padding">
			<div class="heading heading-v1 margin-bottom-20">
				<h2>lezhin</h2>
			</div>
			<c:forEach var="i" items="${webToonList }">
				<div class="thumb-product">
					<img class="thumb-product-img" src="${i.wImage }" alt="">

					<div class="thumb-product-in">
						<h4>
							<a href="shop-ui-inner.html">${i.wName }</a>
						</h4>
						<span class="thumb-product-type">작가이름</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!--/end row-->
	<!--=== End Illustration v4 ===-->

    <!--=== Footer v4 ===-->
    <div class="footer-v4">
        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">                     
                        <p>
                            2014 &copy; Unify. ALL Rights Reserved. 
                            <a target="_blank" href="https://twitter.com/htmlstream">Htmlstream</a> | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
                        </p>
                    </div>
                    <div class="col-md-6">  
                        <ul class="list-inline sponsors-icons pull-right">
                            <li><i class="fa fa-cc-paypal"></i></li>
                            <li><i class="fa fa-cc-visa"></i></li>
                            <li><i class="fa fa-cc-mastercard"></i></li>
                            <li><i class="fa fa-cc-discover"></i></li>
                        </ul>
                    </div>
                </div>
            </div> 
        </div><!--/copyright--> 
    </div>
    <!--=== End Footer v4 ===-->
</div><!--/wrapper-->

<!-- JS Global Compulsory -->
<script src="assets/plugins/jquery/jquery-migrate.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script src="assets/plugins/back-to-top.js"></script>
<script src="assets/plugins/smoothScroll.js"></script>
<script src="assets/plugins/jquery.parallax.js"></script>
<script src="assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
<script src="assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script src="assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<!-- JS Customization -->
<script src="assets/js/custom.js"></script>
<!-- JS Page Level -->
<script src="assets/js/shop.app.js"></script>
<script src="assets/js/plugins/owl-carousel.js"></script>
<script src="assets/js/plugins/revolution-slider.js"></script>
<script>
    jQuery(document).ready(function() {
        App.init();
        App.initScrollBar();
        App.initParallaxBg();
        OwlCarousel.initOwlCarousel();
        RevolutionSlider.initRSfullWidth();
});
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/js/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>