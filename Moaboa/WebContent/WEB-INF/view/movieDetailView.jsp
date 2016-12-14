<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Details | Unify - Responsive Website Template</title>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/shop.style.css">
    
    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="assets/css/headers/header-v5.css">
    <link rel="stylesheet" href="assets/css/footers/footer-v4.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="assets/plugins/animate.css">    
    <link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
    <link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
    <link rel="stylesheet" href="assets/plugins/master-slider/quick-start/masterslider/style/masterslider.css">
    <link rel='stylesheet' href="assets/plugins/master-slider/quick-start/masterslider/skins/default/style.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="assets/css/custom.css">
	
<style type="text/css">
	.mainContainer{
	position: relative;
	}
	#map_div{
		position: relative;
	    width : 100%;
		height: 500px;
	}
	#MDTitle{
			font-size: 38px;
	}
	.movieTimeTable{
	   margin-bottom: 30px;
	}
	.ms-slide-bgcont{
		/* 얘 크기 줄이고 싶음!!! */
	}
	.pBox{
		width: 100%;
		text-align: center;
	}
	.timeTablePasing{
	    
	}
	.departInput{
	    position: absolute;
    	top: 20px;
    	right: 10px;
    	z-index: 100;
	}
    .ms-thumb-frame img {
	    width: 100%;
	    height: 100%;
	}
	.movieInfo {
	   margin-top: 80px;
   	 margin-left: 100px;
	}
	.shop-product {
	   /*  height: 910px; */
	}
       #map-canvas, #map_canvas {
         height: 100%;
         margin: 0;
         padding: 0;
       }

       @media print {
         html, body {
           height: auto;
         }

         #map_canvas {
           height: 650px;
         }
       }

       #panel {
         position: absolute;
         top: 5px;
         right: 10px;
         z-index: 5;
         background-color: #fff;
         padding: 5px;
         border: 1px solid #999;
         display: none;
       }
       #pathFind {
    	margin-left: 208px;
		}
		.movieImg img{
			width: 100%;
		}
</style>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2_XHoUZ5JMTmtxD3oe_IA5F2nmjn_OF0" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
    //지도관련 스크립트 및 제이쿼리!!!
       //--------------주소 좌표변환-----------------
		//난 지금 theaterName을 for문으로 다 마크찍을꺼야 
		var theaterLocation = new Array();
    	
    	console.dir("${theaterLocation}"); 
    	//theaterLocation 가져오기
    	 <c:forEach var="lo" items="${theaterLocation}">
    		theaterLocation.push("${lo.getLocation()}");
    	</c:forEach>
    	console.dir(theaterLocation);
    	
    	
 
    		var markers = new Array();
    		var pos = new Array();
    		var count = 0;
    		var name ;
   			var geocoder = new google.maps.Geocoder();
    	for (var i = 0; i < theaterLocation.length; i++) {
	    	geocoder.geocode({'address':theaterLocation[i],'partialmatch':true},geocodeResult);			
		}
    
	function geocodeResult(results,status,name){
		if(status == 'OK' && results.length > 0){
			//alert(" lat : " + results[0].geometry.location.lat()+" lng : " + results[0].geometry.location.lng());
			pos[count] = new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng());
			count++;
		}else{
			alert("Geocode was not successful for the following reason : "+status);
		}
		
	} 
	
	
 	//-------------------------------------------
    var directionsDisplay;
    var directionsService = new google.maps.DirectionsService();
    var map;
 
    function initialize() {
      directionsDisplay = new google.maps.DirectionsRenderer();
      
      var chicago = pos[0];
      
      var mapOptions = {
        zoom:13,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: chicago
      }
      map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
      
       for(var i =0; i<theaterLocation.length;i++){
    	   
    	  markers[i] = new google.maps.Marker({
    		  position : pos[i],
    		  map : map,
    		  label : theaterLocation[i],
    		  draggable : true,
              icon : "https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi.png",
              animation : google.maps.Animation.DROP
    	  });
    	  
    	  
      } 
      directionsDisplay.setMap(map);
    }
 
    function calcRoute() {
      var start = document.getElementById('start').value;
      var end = document.getElementById('end').value;
      var mode = document.getElementById('mode').value;
 
      var request = {
          origin:start,
          destination:end,
          travelMode: eval("google.maps.DirectionsTravelMode."+mode)
      };
      directionsService.route(request, function(response, status) {
        //alert(status);  // 확인용 Alert..미사용시 삭제
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
      });
    }
 
    google.maps.event.addDomListener(window, 'load', initialize);
    
 
</script>

<script type="text/javascript">
	$(function(){
		
/* 		console.log("찎"+request.getAttribute("totaltest"));
 */		
		$("#pathFind").on("click",function(){
			$(".departInput").hide();
			 var state = $("#panel").css('display'); // state 변수에 ID가 panel인 요소의 display의 속성을 '대입'
		        if(state == 'none'){ // state가 none 상태일경우 
		            $('#panel').show(); // ID가 panel인 요소를 show();
		        }else{ // 그 외에는
		            $('#panel').hide(); // ID가 panel인 요소를 hide();         
		        }
		})
	})
</script>
</head> 

<body class="header-fixed"> 
<%
String str=request.getParameter("totaltest");
System.out.print(str);

%>

<div class="wrapper">
      <!-- 헤더 인클루드 -->
	<%@include file="include/header_inc.jsp" %>

    <!--=== Shop Product ===-->
    <div class="shop-product">
        <!-- Breadcrumbs v5 -->
        <div class="container">
            <ul class="breadcrumb-v5">
                <li class="active"><span id="MDTitle">MovieDetail</span></li>
            </ul> 
        </div>
        <!-- End Breadcrumbs v5 -->

        <div class="container">
            <div class="row">
            	 <div class="col-md-4 md-margin-bottom-50 movieImg">
                    <img src="http://t1.search.daumcdn.net/thumb/R438x0.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fcddd173cc90a484888a7ef35875ad3a0095a7395" alt="" />
                </div> 
                <div class="col-md-6 movieInfo">
                    <div class="shop-product-heading">
                        <h2>${movieInfo.mName}</h2>
                        	<img src="assets/img/moving.png" alt="현재상영중" />
                    </div><!--/end shop product social-->
					
                    <ul class="list-inline product-ratings margin-bottom-30">
                          평점	<li><i class="rating-selected fa fa-star"></i></li>
                        <li><i class="rating-selected fa fa-star"></i></li>
                        <li><i class="rating-selected fa fa-star"></i></li>
                        <li><i class="rating fa fa-star"></i></li>
                        <li><i class="rating fa fa-star"></i></li>
                    </ul><!--/end shop product ratings-->

                    <p>
	                    <strong>장르</strong>&nbsp;&nbsp;${movieInfo.mGenre}<br />
	                    <strong>감독</strong>&nbsp;&nbsp;${movieInfo.director}<br />
	                    <strong>출연</strong>&nbsp;&nbsp;${movieInfo.actor}<br />
	                    <strong>등급</strong>&nbsp;&nbsp;15세 관람가<br />
	                    <strong>개봉</strong>&nbsp;&nbsp;${movieInfo.mDate}<br />
                    </p><br>

                    <ul class="list-inline add-to-wishlist add-to-wishlist-brd">
                        <li class="wishlist-in">
                            <i class="fa fa-heart"></i>
                            <a href="#">Add to Wishlist</a>
                        </li>
                        <li class="compare-in">
                            <i class="fa fa-exchange"></i>
                            <a href="#">Add to Compare</a>
                        </li>
                    </ul>    
                    <p class="wishlist-category"><strong>Categories:</strong> <a href="#">Clothing,</a> <a href="#">Shoes</a></p>
                </div>
            </div><!--/end row-->
        </div>    
    </div>
    <!--=== End Shop Product ===-->

    <!--=== Content Medium ===-->
		<div class="content-md container mainContainer">
			<!--=== Product Service ===-->
			<div class="row">
			
			<div class="col-md-4">
				<c:forEach var="i"  items="${showTimePaging }">
					<div class="product-service movieTimeTable">
						<div class="product-service-heading">
							<h3 style="color: white;">${i.getTheaterName() }</h3>
						</div>
						<c:forEach var="time" items="${i.getsTime() }" >					
							<div class="product-service-in">
								<a href="${i.getInterpark()}">${time}</a>&nbsp;
							</div>
						</c:forEach>
					</div>
					
					<!-- 춓언니 help!!!! -->
				</c:forEach>
				<!-- 영화관 시간표 검색결과 페이징 -->
				<div class="pBox">
					<ul class="pagination pagination-sm timeTablePasing">
					    <li>
					      <a href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <c:forEach var="page" begin="${startPage}" end="${endPage }">
						    <li><a href="movieInfo.do?mno=${param.mno}&currentPage=${page}">${page}</a></li>
					    </c:forEach>
					    <li>
					      <a href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
				</div>
				<!-- 영화관 시간표 검색결과 페이징 end-->	
			</div>
				
				<div class="col-md-8">

				<!-- 영화관 지도 출력 -->
				<div id="map_div">
					<div id="map-canvas">
						
					</div>
					<!-- 지도 길찾기 -->
					<div id="panel" >
			            <b>출발지: </b>
			            <input type="text" id="start" />
			            <b>도착지: </b>
			            <input type="text" id="end" />
			            <div style="margin-top: 7px">
			                <strong>교통수단: </strong>
			                <select id="mode">
			                <option value="DRIVING">자동차</option>
			                <option value="WALKING">걷기</option>
			                <option value="BICYCLING">자전거</option>
			                <option value="TRANSIT">대중교통</option>
			                </select>
			                <input type="button" value="길찾기" onclick="Javascript:calcRoute();" />
			            </div>
			        </div>
					<!-- 지도 길찾기 end -->
					<!-- 지도 현재 위치 검색 -->
						  <div class="departInput">
						  	<input type="button" value="길찾기" id="pathFind" />
						  </div>
					<!-- 지도 현재 위치 검색 end -->
				
				</div>
				<!-- 영화관 지도 출력 end -->
				</div>
			</div>
			<!--/end row-->
			<!--=== End Product Service ===-->



			<!--=== Shop Suvbscribe ===-->
			<div class="shop-subscribe">
				<div class="container">
					<div class="row">
						<div class="col-md-8 md-margin-bottom-20">
							<h2>
								subscribe to our weekly <strong>newsletter</strong>
							</h2>
						</div>
						<div class="col-md-4">
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Email your email..."> <span
									class="input-group-btn">
									<button class="btn" type="button">
										<i class="fa fa-envelope-o"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
				</div>
				<!--/end container-->
			</div>
			<!--=== End Shop Suvbscribe ===-->

			<!--=== Footer v4 ===-->
			<div class="footer-v4">
				<div class="footer">
					<div class="container">
						<div class="row">
							<!-- About -->
							<div class="col-md-4 md-margin-bottom-40">
								<a href="index.html"><img class="footer-logo"
									src="assets/img/logo-2.png" alt=""></a>
								<p>About Unify dolor sit amet, consectetur adipiscing elit.
									Maecenas eget nisl id libero tincidunt sodales.</p>
								<br>
								<ul class="list-unstyled address-list margin-bottom-20">
									<li><i class="fa fa-angle-right"></i>California, US, Lorem
										Lis Street, Orange, 25</li>
									<li><i class="fa fa-angle-right"></i>Phone: 800 123 3456</li>
									<li><i class="fa fa-angle-right"></i>Fax: 800 123 3456</li>
									<li><i class="fa fa-angle-right"></i>Email: info@anybiz.co</li>
								</ul>

								<ul class="list-inline shop-social">
									<li><a href="#"><i
											class="fb rounded-md fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="tw rounded-md fa fa-twitter"></i></a></li>
									<li><a href="#"><i
											class="gp rounded-md fa fa-google-plus"></i></a></li>
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
						</div>
						<!--/end row-->
					</div>
					<!--/end continer-->
				</div>
				<!--/footer-->

				<div class="copyright">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<p>
									2014 &copy; Unify. ALL Rights Reserved. <a target="_blank"
										href="https://twitter.com/htmlstream">Htmlstream</a> | <a
										href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
								</p>
							</div>
							<div class="col-md-6">
								<ul class="list-inline sponsors-icons pull-right">
									<li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
									<li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
									<li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
									<li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!--/copyright-->
			</div>
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
<script src="assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
<script src="assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Master Slider -->
<script src="assets/plugins/master-slider/quick-start/masterslider/masterslider.min.js"></script>
<script src="assets/plugins/master-slider/quick-start/masterslider/jquery.easing.min.js"></script>
<!-- JS Customization -->
<script src="assets/js/custom.js"></script>
<!-- JS Page Level -->
<script src="assets/js/shop.app.js"></script>
<script src="assets/js/plugins/owl-carousel.js"></script>
<script src="assets/js/plugins/master-slider.js"></script>
<script src="assets/js/forms/product-quantity.js"></script>
<script>
    jQuery(document).ready(function() {
        App.init();
        App.initScrollBar();        
        OwlCarousel.initOwlCarousel();
        MasterSliderShowcase2.initMasterSliderShowcase2();
    });
</script>

<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/js/plugins/placeholder-IE-fixes.js"></script>    
<![endif]-->

</body>
</html>