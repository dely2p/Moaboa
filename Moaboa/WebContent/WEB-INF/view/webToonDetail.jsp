<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Web Fonts -->
<link rel='stylesheet' type='text/css'
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

<!-- CSS Global Compulsory -->
<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/shop.style.css">

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="assets/css/headers/header-v5.css">
<link rel="stylesheet" href="assets/css/footers/footer-v4.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="assets/plugins/animate.css">
<link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet"
	href="assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
<link rel="stylesheet"
	href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">
<link rel="stylesheet"
	href="assets/plugins/revolution-slider/rs-plugin/css/settings.css">

<!-- materialize CSS --> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="../../assets/css/materialize.min.css"  media="screen,projection"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="assets/js/materialize.min.js"></script>
<script type="text/javascript">
  	$(function(){
		$("#mon").on("click", function(param){location.href="webToon.do?week=mon"});
		$("#tue").on("click", function(param){location.href="webToon.do?week=tue"});
		$("#wed").on("click", function(param){location.href="webToon.do?week=wed"});
		$("#thu").on("click", function(param){location.href="webToon.do?week=thu"});
		$("#fri").on("click", function(param){location.href="webToon.do?week=fri"});
		$("#sat").on("click", function(param){location.href="webToon.do?week=sat"});
		$("#sun").on("click", function(param){location.href="webToon.do?week=sun"});
		

	}); 
  	
	function movepage(i, j){
		
		
		//session.setAttribute("filename", filename);
/* 		session.setAttribute("wno", filename);
		session.setAttribute("cnt", filename); */
		//session.setAttribute("imgurl", filename);
		//session.setAttribute("fileurl", filename);
		//console.log($("#poprecord").attr("class"));

		var imgurl = $(".thumb-product-img").attr("src")

		
		/* localStorage.setItem('imgurl', imgurl);
		localStorage.setItem('wno', '<c:out value = "${webToonDetail.titleId }"/>');
		localStorage.setItem('cnt', j); */
		
		
		setCookie('imgurl', imgurl, 1);
		setCookie('wno', '<c:out value = "${webToonDetail.titleId }"/>', 1);
		setCookie('cnt', j, 1);
		
  		window.open("http://comic.naver.com/webtoon/detail.nhn?titleId="+ '<c:out value = "${webToonDetail.titleId }"/>'+"&no="+ j,"_blank");
  		window.open("view/poprecorder.do", "moaboa_player", 'scrollbars=no,toolbar=no,location=no,resizable=no,status=no,menubar=no,resizable=no,width=200,height=100,left=1300,top=100');
	  		
		//resizable=no,location=no,directories=no,status=no,toolbar=no,scrollbars=no
	}
	
	 // 쿠키 생성
    function setCookie(cName, cValue, cDay){
         var expire = new Date();
         expire.setDate(expire.getDate() + cDay);
         cookies = cName + '=' + escape(cValue) + '; path=/ '; 
         if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
         document.cookie = cookies;
    }

    // 쿠키 가져오기
    function getCookie(cName) {
         cName = cName + '=';
         var cookieData = document.cookie;
         var start = cookieData.indexOf(cName);
         var cValue = '';
         if(start != -1){
              start += cName.length;
              var end = cookieData.indexOf(';', start);
              if(end == -1)end = cookieData.length;
              cValue = cookieData.substring(start, end);
         }
         return unescape(cValue);
    }
</script>


<!-- CSS Customization -->
<link rel="stylesheet" href="assets/css/custom.css">
</head>
<body class="header-fixed">
<div class="wrapper">
       <!-- 헤더 인클루드 -->
	<%@include file="include/header_inc.jsp" %>

    <!--=== Slider ===-->
    <div class="tp-banner-container">
        <div class="tp-banner">
            <ul>
                 <!-- SLIDE -->
                <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000" data-title="Slide 4">
                    <!-- MAIN IMAGE -->
                    <img src="assets/img/toonImage2.png"  alt="darkblurbg"  data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">

                </li>
                <!-- END SLIDE -->                

                <!-- SLIDE -->
  
            </ul>
            <div class="tp-bannertimer tp-bottom"></div>            
        </div>
    </div>
    <!--=== End Slider ===-->
<br />

        <!--=== Illustration v4 ===-->
        <div class="row illustration-v4 margin-bottom-40">
			<!-- 월~일 구분 버튼 추가 -->
				<div>
				<a class="btn-floating btn-large waves-effect waves-light gray"><i class="material-icons" id="mon" value="mon">월</i></a> 
				<a class="btn-floating btn-large waves-effect waves-light gray"><i class="material-icons" id="tue" value="tue">화</i></a> 
				<a class="btn-floating btn-large waves-effect waves-light gray"><i class="material-icons" id="wed" value="wed">수</i></a> 
				<a class="btn-floating btn-large waves-effect waves-light gray"><i class="material-icons" id= "thu" value="thu">목</i></a> 
				<a class="btn-floating btn-large waves-effect waves-light gray"><i class="material-icons" id= "fri" value="fri">금</i></a> 
				<a class="btn-floating btn-large waves-effect waves-light gray"><i class="material-icons" id="sat" value="sat">토</i></a> 
				<a	class="btn-floating btn-large waves-effect waves-light gray"><i class="material-icons" id="sun" value="sun">일</i></a>
				</div>
			<div class="col-md-4">
				<c:forEach var="i" begin="1" end="${webToonDetail.recentlyNo }" step="1">
					<c:set var="j" value="${webToonDetail.recentlyNo-i}"/>
					<div class="thumb-product">
						<img class="thumb-product-img" src="${webToonDetail.wImage }" alt="">
						<div class="thumb-product-in">
							<h4>
								<a href="#" class="titleId=${webToonDetail.titleId }&no=${j}" onclick="movepage(${i},${j});">${j }화</a>							
								<%-- <input type="button" value="http://comic.naver.com/webtoon/detail.nhn?titleId=${webToonDetail.titleId }&no=${j}" onclick="test()"/> --%>
							</h4>
						</div>
					</div>
				</c:forEach>
			</div>
        </div><!--/end row-->
        <!--=== End Illustration v4 ===-->
    </div><!--/end cotnainer-->

    <!--=== Collection Banner ===-->
    <div class="collection-banner">
        <div class="container">
            <div class="col-md-7 md-margin-bottom-50">
                <h2>Makeup collection</h2>
                <p>Duis in posuere risus. Vivamus sed dignissim tellus. In vehicula justo tempor commodo. <br> Nunc lobortis dapibus neque quis lacinia</p><br>
                <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">Shop Now</a>
            </div>
            <div class="col-md-5">
                <div class="overflow-h">
                    <span class="percent-numb">50</span>
                    <div class="percent-off">
                        <span class="discount-percent">%</span>
                        <span class="discount-off">off</span>
                    </div>
                    <div class="new-offers shop-bg-green rounded-x">
                        <p>new</p>
                        <span>Products</span>
                    </div>    
                </div>    
            </div>
        </div>
    </div>
    <!--=== End Collection Banner ===-->

    <!--=== Sponsors ===-->
    <div class="container content">
        <div class="heading heading-v1 margin-bottom-40">
            <h2>Sponsors</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio elit, ultrices vel cursus sed, placerat ut leo. Phasellus in magna erat. Etiam gravida convallis augue non tincidunt. Nunc lobortis dapibus neque quis lacinia. Nam dapibus tellus sit amet odio venenatis</p>
        </div>

        <ul class="list-inline owl-slider-v2">
            <li class="item first-child">
                <img src="assets/img/clients/07.png" alt="">
            </li>
            <li class="item">
                <img src="assets/img/clients/08.png" alt="">
            </li>
            <li class="item">
                <img src="assets/img/clients/10.png" alt="">
            </li>
            <li class="item">
                <img src="assets/img/clients/11.png" alt="">
            </li>
            <li class="item">
                <img src="assets/img/clients/09.png" alt="">
            </li>
            <li class="item">
                <img src="assets/img/clients/12.png" alt="">
            </li>
            <li class="item">
                <img src="assets/img/clients/07.png" alt="">
            </li>
            <li class="item">
                <img src="assets/img/clients/08.png" alt="">
            </li>
            <li class="item">
                <img src="assets/img/clients/09.png" alt="">
            </li>
            <li class="item">
                <img src="assets/img/clients/10.png" alt="">
            </li>
            <li class="item">
                <img src="assets/img/clients/11.png" alt="">
            </li>
            <li class="item">
                <img src="assets/img/clients/12.png" alt="">
            </li>
        </ul><!--/end owl-carousel-->
    </div>
    <!--=== End Sponsors ===-->

    <!--=== Shop Suvbscribe ===-->
    <div class="shop-subscribe">
        <div class="container">
            <div class="row">
                <div class="col-md-8 md-margin-bottom-20">
                    <h2>subscribe to our weekly <strong>newsletter</strong></h2>
                </div>  
                <div class="col-md-4">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Email your email...">
                        <span class="input-group-btn">
                            <button class="btn" type="button"><i class="fa fa-envelope-o"></i></button>
                        </span>
                    </div>    
                </div>
            </div>
        </div><!--/end container-->
    </div>
    <!--=== End Shop Suvbscribe ===-->

    <!--=== Footer v4 ===-->
    <div class="footer-v4">
        <div class="footer">
            <div class="container">
                <div class="row">
                    <!-- About -->
                    <div class="col-md-4 md-margin-bottom-40">
                        <a href="index.html"><img class="footer-logo" src="assets/img/logo-2.png" alt=""></a>
                        <p>About Unify dolor sit amet, consectetur adipiscing elit. Maecenas eget nisl id libero tincidunt sodales.</p>
                        <br>
                        <ul class="list-unstyled address-list margin-bottom-20">
                            <li><i class="fa fa-angle-right"></i>California, US, Lorem Lis Street, Orange, 25</li>
                            <li><i class="fa fa-angle-right"></i>Phone: 800 123 3456</li>
                            <li><i class="fa fa-angle-right"></i>Fax: 800 123 3456</li>
                            <li><i class="fa fa-angle-right"></i>Email: info@anybiz.co</li>
                        </ul>

                        <ul class="list-inline shop-social">
                            <li><a href="#"><i class="fb rounded-md fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="tw rounded-md fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="gp rounded-md fa fa-google-plus"></i></a></li>
                            <li><a href="#"><i class="yt rounded-md fa fa-youtube"></i></a></li>
                        </ul>
                    </div>
                    <!-- End About -->                    

                    <!-- Simple List -->
                    <div class="col-md-2 col-sm-3">
                        <div class="row">
                            <div class="col-sm-12 col-xs-6">
                                <h2 class="thumb-headline">Secciones</h2>
                                <ul class="list-unstyled simple-list margin-bottom-20">
                                    <li><a href="#">Ultima Hora</a></li>
                                    <li><a href="#">Exclusiva</a></li>
                                    <li><a href="#">Documentos </a></li>
                                    <li><a href="#">Francisco papa</a></li>
                                    <li>...</li>
                                </ul>
                            </div>    

                            <div class="col-sm-12 col-xs-6">
                                <h2 class="thumb-headline">Temas</h2>
                                <ul class="list-unstyled simple-list">
                                    <li><a href="#">Ultima Hora</a></li>
                                    <li><a href="#">Exclusiva</a></li>
                                    <li><a href="#">Documentos </a></li>
                                    <li><a href="#">Francisco papa</a></li>
                                    <li>...</li>
                                </ul>
                            </div>
                        </div>
                    </div>    

                    <div class="col-md-2 col-sm-3">
                        <div class="row">
                            <div class="col-sm-12 col-xs-6">
                                <h2 class="thumb-headline">Utilidades</h2>
                                <ul class="list-unstyled simple-list margin-bottom-20">
                                    <li><a href="#">Ultima Hora</a></li>
                                    <li><a href="#">Exclusiva</a></li>
                                    <li><a href="#">Documentos </a></li>
                                    <li>...</li>
                                </ul>
                            </div>    

                            <div class="col-sm-12 col-xs-6">
                                <h2 class="thumb-headline">Documentos</h2>
                                <ul class="list-unstyled simple-list">
                                    <li><a href="#">Ultima Hora</a></li>
                                    <li><a href="#">Exclusiva</a></li>
                                    <li><a href="#">Documentos </a></li>
                                    <li><a href="#">Francisco papa</a></li>
                                    <li>...</li>
                                </ul>
                            </div>
                        </div>        
                    </div>

                    <div class="col-md-2 col-sm-3">
                        <div class="row">
                            <div class="col-sm-12 col-xs-6">
                                <h2 class="thumb-headline">Publicidad</h2>
                                <ul class="list-unstyled simple-list margin-bottom-20">
                                    <li><a href="#">Ultima Hora</a></li>
                                    <li><a href="#">Exclusiva</a></li>
                                    <li><a href="#">Documentos </a></li>
                                    <li><a href="#">Francisco papa</a></li>
                                    <li>...</li>
                                </ul>
                            </div>    

                            <div class="col-sm-12 col-xs-6">
                                <h2 class="thumb-headline">Contacto</h2>
                                <ul class="list-unstyled simple-list">
                                    <li><a href="#">Ultima Hora</a></li>
                                    <li><a href="#">Exclusiva</a></li>
                                    <li><a href="#">Documentos </a></li>
                                    <li><a href="#">Francisco papa</a></li>
                                    <li>...</li>
                                </ul>
                            </div>
                        </div>        
                    </div>

                    <div class="col-md-2 col-sm-3">
                        <div class="row">
                            <div class="col-sm-12 col-xs-6">
                                <h2 class="thumb-headline">Utilidades</h2>
                                <ul class="list-unstyled simple-list margin-bottom-20">
                                    <li><a href="#">Ultima Hora</a></li>
                                    <li><a href="#">Exclusiva</a></li>
                                    <li>...</li>
                                </ul>
                            </div>
                                
                            <div class="col-sm-12 col-xs-6">
                                <h2 class="thumb-headline">Documentos</h2>
                                <ul class="list-unstyled simple-list">
                                    <li><a href="#">Ultima Hora</a></li>
                                    <li><a href="#">Exclusiva</a></li>
                                    <li>...</li>
                                </ul>
                            </div>
                        </div>        
                    </div>
                    <!-- End Simple List -->
                </div><!--/end row-->
            </div><!--/end continer-->
        </div><!--/footer-->

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
<script src="assets/plugins/jquery/jquery.min.js"></script>
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