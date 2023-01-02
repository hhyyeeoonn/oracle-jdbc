<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>News  HTML-5 Template </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	
	<script>
		$(document).ready(function() {
			$('#rowPerPage').change(function() {
				$('#pageForm').submit();
			});
			$('#searchBtn').click(function() {
				$('#pageForm').submit();
			});
		});
	</script>
	
	
    <!-- CSS here -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ticker-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    
    
    <style>
    	A:link {color : black;
    			text-decoration:none}
    	A:visited {color : black;
    			text-decoration:none}
    </style>
</head>

<body>
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="${pageContext.request.contextPath}/resources/img/logo/board.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start-->
    <header>
        <!-- Header Start -->
       <div class="header-area">
            <div class="main-header ">
               
                <div class="header-mid gray-bg">
                   <div class="container">
                        <div class="row d-flex align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-3 col-lg-3 col-md-3 d-none d-md-block">
                                <div class="logo">
                                    <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/img/logo/board.png" alt=""></a>
                                </div>
                            </div>
                            
                        </div>
                   </div>
                </div>
               <div class="header-bottom header-sticky">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-xl-8 col-lg-8 col-md-12 header-flex">
                                <!-- sticky -->
                                <div class="sticky-logo">
                                    <a href="index.html"><img src="${pageContext.request.contextPath}/resources/img/logo/logo.png" alt=""></a>
                                </div>
                                <!-- Main-menu -->
                                <div class="main-menu d-none d-md-block">
                                    <nav>                  
                                        <ul id="navigation">
                                            <li><a href="${pageContext.request.contextPath}">Home</a></li>
                                            <li><a href="${pageContext.request.contextPath}">board</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>             
                          
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-md-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>
  
    <!--================Blog Area =================-->
    <section class="blog_area section-padding">
        <div class="container">
            <div class="row">
                
                <div class="col-lg-10 mb-5 mb-lg-0">
                
                	<h1>BOARD LIST</h1>
					<div>
						<a href = "${pageContext.request.contextPath}/board/addBoard">글 쓰기</a>
					</div>
					<form id = "pageForm" method = "get" action ="${pageContext.request.contextPath}/board/boardList">
						<input type ="text" id = "word" name = "word" value = "${word}">
						<button type = "button" id = "searchBtn">검색</button>
						<select name = "rowPerPage" id = "rowPerPage">
							<c:if test = "${rowPerPage == 10}">
								<option value = "10" selected = "selected">10</option>
								<option value = "20">20</option>
								<option value = "30">30</option>
							</c:if>
							<c:if test = "${rowPerPage == 20}">
								<option value = "10">10</option>
								<option value = "20" selected = "selected">20</option>
								<option value = "30">30</option>
							</c:if>
							<c:if test = "${rowPerPage == 30}">
								<option value = "10">10</option>
								<option value = "20">20</option>
								<option value = "30" selected = "selected">30</option>
							</c:if>
						</select>
					</form>
					<table>
						<tr>
							<th>No.</th>
							<th>Title</th>
							<th>ID</th>
							<th>CreateDate</th>
						</tr>
						<c:forEach var = "b" items = "${boardList}">
							<tr>
								<td>${b.boardNo}</td>
								<td>
									<a href = "${pageContext.request.contextPath}/board/boardOne?boardNo=${b.boardNo}">${b.boardTitle}</a>
								</td>
								<td>${b.memberId}</td>
								<td>${b.createdate}</td>
							</tr>
						</c:forEach>
					</table>
					<div>
						<c:if test = "${currentPage > 1}">
							<a href = "${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage - 1}&word=${word}">이전</a>
						</c:if>
							<a href = "${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage + 1}&word=${word}">다음</a>
					</div>
                
                </div>
            
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->
    
    <footer>
        <!-- Footer Start-->
        <div class="footer-main footer-bg">
           
            <!-- footer-bottom aera -->
            <div class="footer-bottom-area footer-bg">
                <div class="container">
                    <div class="footer-border">
                            <div class="row d-flex align-items-center">
                                <div class="col-xl-12 ">
                                    <div class="footer-copy-right text-center">
                                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End-->
    </footer>
    <!-- Search model Begin -->
    <div class="search-model-box">
        <div class="d-flex align-items-center h-100 justify-content-center">
            <div class="search-close-btn">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Searching key.....">
            </form>
        </div>
    </div>
    <!-- Search model end -->

    <!-- JS here -->

    <script src="${pageContext.request.contextPath}/resources/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>

    <!-- One Page, Animated-HeadLin -->
    <script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/animated.headline.js"></script>
    
    <!-- Scrollup, nice-select, sticky -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.scrollUp.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.sticky.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.js"></script>

    <!-- contact js -->
    <script src="${pageContext.request.contextPath}/resources/js/contact.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail-script.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="${pageContext.request.contextPath}/resources/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>
</html>