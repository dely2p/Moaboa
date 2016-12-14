<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Shop UI | Unify - Responsive Website Template</title>

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
    <link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="assets/css/custom.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script>
    	$(function(){
    		$("#searchBtn").on("click", function(){
    			location.href= "timeSearch.do?location=" + $("#mSearch").val() + "&sTime=" + $("#mTime option:selected").val();
    		})
    	});
    </script>
    
</head>	

<body class="header-fixed">
<div class="wrapper">
	
		<!-- 헤더 인클루드 -->
		<%@include file="include/header_inc.jsp" %>
	
		<!-- 영화 검색 박스 -->
        <div class="heading heading-v1 margin-bottom-20 pt50">

            <h2>상영중인 영화 검색</h2>

			<div class="searchBox">
				<div class="txt">
					<label for="mSearch">상영관 </label>
					<input type="text" name="mSearch" id="mSearch" />
				</div>
				<label for="mTime">시간 선택</label>
				<select class="sel" id="mTime">
					<option value="00">00:00 ~ 00:59</option>
					<option value="01">01:00 ~ 01:59</option>
					<option value="02">02:00 ~ 02:59</option>
					<option value="03">03:00 ~ 03:59</option>
					<option value="04">04:00 ~ 04:59</option>
					<option value="05">05:00 ~ 05:59</option>
					<option value="06">06:00 ~ 06:59</option>
					<option value="07">07:00 ~ 07:59</option>
					<option value="08">08:00 ~ 08:59</option>
					<option value="09">09:00 ~ 09:59</option>
					<option value="10">10:00 ~ 10:59</option>
					<option value="11">11:00 ~ 11:59</option>
					<option value="12">12:00 ~ 12:59</option>
					<option value="13">13:00 ~ 13:59</option>
					<option value="14">14:00 ~ 14:59</option>
					<option value="15">15:00 ~ 15:59</option>
					<option value="16">16:00 ~ 16:59</option>
					<option value="17">17:00 ~ 17:59</option>
					<option value="18">18:00 ~ 18:59</option>
					<option value="19">19:00 ~ 19:59</option>
					<option value="20">20:00 ~ 20:59</option>
					<option value="21">21:00 ~ 21:59</option>
					<option value="22">22:00 ~ 22:59</option>
					<option value="23">23:00 ~ 23:59</option>
				</select>
				<button type="button" class="searchBtn" id="searchBtn">검색</button>
			</div>

        </div>
		<!-- // 영화 검색 박스 -->
		
		<!-- 검색하면 나오는 영역 -->
		<div class="resultBox">
 		<c:forEach var="i" items="${theaterNameList}">
			<div class="theaterBox">
				<div class="theater">## ${i} ##</div>
				
				<c:forEach var="j" items="${movieSearchResult}">
					<c:if test="${i eq j.getTheaterName()}">
						<div class="desc">
							<div class="title">${j.getMName()}</div>
							<c:if test="${!empty j.getsTime()}">	
								<c:forEach var="k" items="${j.getsTime().split(' ')}">
									<a href="${j.getInterpark()}" class="time">${k}</a>
								</c:forEach>
							</c:if>
						</div>
					</c:if>
				</c:forEach>
			
			</div>
		</c:forEach>
		</div>
		<!-- // 검색하면 나오는 영역 -->

		
		

        <!-- 영화 리스트 -->
        <div class="illustration-v2 margin-bottom-60">
            <ul class="list-inline owl-slider">

				<c:forEach var="i" items="${movieList }" begin="1" end="4" varStatus="status">
                <li class="item">
                    <div class="product-img cImg">
                       <%--  <a href="shop-ui-inner.html"><img class="full-width img-responsive" src="${movieList.get([status.index]).mImage.split("###")[0] }" alt=""></a> --%>
                        <a href="shop-ui-inner.html"><img class="full-width img-responsive" src="${i.mImage.split("###")[0]}" alt="" /></a>
                    </div>
                    <div class="product-description product-description-brd">
                        <div class="overflow-h margin-bottom-5">
                            <div class="pull-left">
                                <h4 class="title-price"><a href="movieInfo.do?mno=${i.mno }">${i.mName }</a></h4>
                            </div>    

                        </div>    
                        <ul class="list-inline product-ratings">
                            <li><i class="rating-selected fa fa-star"></i></li>
                            <li><i class="rating-selected fa fa-star"></i></li>
                            <li><i class="rating-selected fa fa-star"></i></li>
                            <li><i class="rating fa fa-star"></i></li>
                            <li><i class="rating fa fa-star"></i></li>
                            <li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
                        </ul>    
                    </div>
                </li>
				</c:forEach>
            </ul>
            
        </div> 
       	<!-- 영화 리스트 끝 -->
		


        <div class="heading heading-v1 margin-bottom-40">
            <h2>Latest products</h2>
        </div>

		<!-- 영화 예고 편 -->
		<div class="row margin-bottom-50">
			<c:forEach var="i" items="${movieList }" begin="1" end="6" varStatus="status">
			<div class="col-md-2">
                <div class="overflow-h">
                    <a class="illustration-v3 illustration-img1" href="#">
                        <span class="illustration-bg">

                        <video src="${i.preView}"></video>
                        </span>    
                    </a>
                </div>    
            </div>
			</c:forEach>
		</div>
		<!-- 영화 예고 편 -->
	</div>
    <!--=== End Product Content ===-->

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