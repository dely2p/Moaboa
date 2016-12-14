<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="header-v5 header-static">
    <!-- Topbar v3 -->
    <div class="topbar-v3">
        <div class="search-open">
            <div class="container">
                <input type="text" class="form-control" placeholder="Search">
                <div class="search-close"><i class="icon-close"></i></div>
            </div>    
        </div>

        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                </div>
                <div class="col-sm-6">
                    <ul class="list-inline right-topbar pull-right">
						<%
							String userId = (String) session.getAttribute("userId");
							if (userId == null) {
						%>
						<li><a href="login.do">Login</a> | <a href="register.do">Register</a></li>
						<%
							} else {
						%>
						<span class="welTxt"><%=userId%>님 환영합니다</span>
						<li><a href="logout.do">Logout</a></li>
						<%
							}
						%>
					</ul>
                </div>
            </div>
        </div><!--/container-->
    </div>
    <!-- End Topbar v3 -->

    <!-- Navbar -->
    <div class="navbar navbar-default mega-menu" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand logo" href="webToon.do">
                    MOABOA
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-responsive-collapse">

                <!-- Nav Menu -->
                <ul class="nav navbar-nav">

                    <li class="dropdown">
                        <a href="webToon.do" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown" data-delay="1000">
                            WebToon
                        </a>
						<ul class="dropdown-menu">
							<li><a href="webToon.do">웹툰</a></li>
						</ul>
					</li>
                    
                    <li class="dropdown">
                        <a href="movie.do" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown" data-delay="1000">
                            Movie
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="movie.do">상영 영화</a></li>
                            <li><a href="timeSearch.do">시간별 검색</a></li>
                        </ul>
                    </li>
                    
                </ul>
                <!-- End Nav Menu -->
            </div>
        </div>    
    </div>            
    <!-- End Navbar -->
</div>