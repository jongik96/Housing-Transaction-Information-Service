<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
String root = request.getContextPath();
pageContext.setAttribute("root", root);
--%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Happy House</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${root }/css/styles.css" rel="stylesheet" />
        <link href="${root }/css/custom.css" rel="stylesheet" />
        <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFhvndwTb7zd3egLZQsUDFAIaDJtZLhjo&callback=initMap&libraries=&v=weekly"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
       
        <script type="text/javascript" src="${root }/main.js"></script>
        <script type="text/javascript" src="${root }/area.js"></script>
          <script type="text/javascript">
        
        //로그인 기능 연결
		$(document).ready(function() {
			$("#btn-login").click(function() {
				if($("#loginId").val() == "") {
					alert("아이디 입력!!!");
					return;
				} else if($("#loginPwd").val() == "") {
					alert("비밀번호 입력!!!");
					return;
				} else {
					$("#loginform").attr("action", "${root}/user/login").submit();
				}
			});
			
			//로그아웃 기능 연결
			$('#logout').click(function(){
			    alert('로그아웃되었습니다.');
			    location.href = "${root}/user/logout";
			})
			
			//회원정보삭제 기능 연결
			$("#delete-btn").click(function() {			
				let userid="<c:out value='${userinfo.userid}'/>";
				location.href = "${root}/user/deleteMember?userid="+userid;
			})
			
			
			
			$("#searchbyapt").click(function() {
				let aptname = $("#myInput").val();
				location.href = "${root}/search/aptSearch?aptname="+aptname;
			});
		});
		</script>
        <style>
        	#map{
        		height:500px;
        		margin-bottom: 10px;
        	}
        	
        </style>
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
            <div class="dropdown">
            	<button type="button" class="btn btn-primary dropdown-toggle mr-3" data-toggle="dropdown">
    				More
  				</button>
  					<div class="dropdown-menu">
  					<h3 class="dropdown-header">Lists</h3>
    				<a class="dropdown-item" href="${root}/mvnotice">공지사항</a>
					<a class="dropdown-item" href="#" id="todaynews">오늘의 뉴스</a>
    				<a class="dropdown-item" href="#" id="search">주변 탐방</a>
    				<a class="dropdown-item" href="${root }/interest/list?userid=${userinfo.userid}">관심 지역 둘러보기</a>
  					</div>
            </div>
            	
  					
                    <a class="navbar-brand js-scroll-trigger" href="${root }/">Happy House</a>
                <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">	
                		<c:if test="${ userinfo eq null }">	
	                        <li class="nav-item mx-0 mx-lg-1" id="signupli"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" id="signup" href="${root}/user/mvsignup">Sign up</a></li>
	                        <li class="nav-item mx-0 mx-lg-1" id="signinli"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" data-toggle="modal" data-target="#loginModal">Sign in</a></li>
                        </c:if>
                        <c:if test="${ userinfo ne null }">	
	                        <li class="nav-item mx-0 mx-lg-1" id="logoutli" ><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" id="logout">Logout</a></li>
	                        <li class="nav-item mx-0 mx-lg-1" id="userinfoli"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" data-toggle="modal" data-target="#infoModal">UserInfo</a></li>
                    	</c:if>
                    </ul>
                    
							<input class="form-control" id="myInput" name = "searchbyapt" type="text" placeholder="Search.." style="width: 500px">
							<button  class="btn btn-warning" id = "searchbyapt" type = "submit" >검색</button>						
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <!-- 
        <header class="masthead bg-primary text-white text-center">
        	<h1 class="masthead-heading text-uppercase mb-0">Happy House</h1><br>

		</header>
         -->
        <!-- Sign up Section-->
        <br>
        <br>
        <br>
        <br>
        <br>
        <section class="page-section" id="contact">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Sign up</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-home"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Sign up Section Form-->
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19.-->
                        <form id="sendForm" name="sendForm" novalidate="novalidate" method="post" action="">
                        	<input type="hidden" name="act" id="act" value="modify" >
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>ID</label>
                                    <input class="form-control" id="id" name="userid" type="text" readonly value="${userinfo.userid}" placeholder="${userinfo.userid}" required="required" data-validation-required-message="Please enter your id." />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>Password</label>
                                    <input class="form-control" id="password" name="userpwd" type="password" value="${userinfo.userpwd}" required="required" data-validation-required-message="Please enter your password."/>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>Name</label>
                                    <input class="form-control" id="name" name="username" type="text" value="${ userinfo.username }" required="required" data-validation-required-message="Please enter your name." />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>Email Address</label>
                                    <input class="form-control" id="email" name="email" type="email" value="${ userinfo.email }" required="required" data-validation-required-message="Please enter your email address." />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <br />
                            <div id="success"></div>
                            <div class="form-group"><button type="submit" class="btn btn-primary btn-xl" id="modify-btn">Modify</button></div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
		
        
        <!-- Footer-->
        <jsp:include page="footer.jsp"></jsp:include>
        
            <!-- The Modal -->
	<div class="modal" id="loginModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Login</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form method="post" id="loginform" action="">
						<div class="form-group">
							<label for="loginId">ID:</label>
							<input type="text" class="form-control" placeholder="Enter ID" id="userid" name="userid">
						</div>
						<div class="form-group">
							<label for="loginPwd">Password:</label>
							<input type="password" class="form-control" placeholder="Enter password" id="userpwd" name="userpwd">
						</div>
						
						
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="btn-login">LogIn</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	
<div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="color: black">회원 정보 확인</h5>
       
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       
      <div class="modal-body">
        <h1 style="color: black">회원 정보 확인</h1>
        <table class="table table-hover">
				<tbody>
					<tr>
						<td>아이디 : </td>
						<td>${ userinfo.userid }</td>
					</tr>
					<tr>
						<td>비밀번호 : </td>
						<td>${ userinfo.userpwd }</td>
					</tr>
					<tr>
						<td>이름 :  </td>
						<td>${ userinfo.username }</td>
					</tr>
					<tr>
						<td>e-mail : </td>
						<td>${ userinfo.email }</td>
					</tr>
				</tbody>
			</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" >확인</button>
        <button type="button" class="btn btn-primary" id="modify-btn" onclick="location.href='${root}/user/usermodify'" >수정</button>
        <button type="button" class="btn btn-danger" id="delete-btn">회원 탈퇴</button>
      </div>
    </div>
  </div>
</div>
        <!-- Copyright Section-->
        
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small>Copyright © SSAFY. All rights reserved.</small></div>
        </div>
        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
        <div class="scroll-to-top d-lg-none position-fixed">
            <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top"><i class="fa fa-chevron-up"></i></a>
        </div>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js">
        function getRoot(){
    		var hostIndex = location.href.indexOf(location.host) + location.host.length;
    		var root = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex+1));
    		return root;
    	}
        
        $(sendMessageButton).click(function(){
        	location.href = getRoot() + "/main?act=regist";
        })
        </script>
    </body>
</html>
