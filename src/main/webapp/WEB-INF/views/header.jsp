<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		      $("#sendMessageButton").click(function() {
	                $("#contactForm").attr("action", "${root}/user/regist").submit();
	            });
		      $("#usermodify").click(function() {
                  $("#sendForm").attr("action", "${root}/user/modify").submit();
          });
		});
		  function search(){
			   var form = document.getElementById("frm");
		       var dong = form.dong.value;
		       var gugun = form.gu.value;
		       var city = form.city.value;
		       form.act.value = "searchhouse";
		       $("#frm").attr("action", "${root}/search/searchDong").submit();
		       
		   }

		  
		    </script>

</head>
<body>
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
					<a class="dropdown-item" href="${root}/mvNews" id="todaynews">오늘의 뉴스</a>
    			
    				<c:if test="${userinfo ne null}">
    				<a class="dropdown-item" href="${root }/interest/list?userid=${userinfo.userid}">관심 지역 둘러보기</a>
    				</c:if>
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
                    
							<input class="form-control form-control-lg" id="myInput" name = "searchbyapt" type="text" value="${aptname }" placeholder="Search.." style="width: 500px">
							<button  class="btn btn-primary btn-outline-link font-weight-bolder	" id = "searchbyapt" type = "submit" >검색</button>						
                </div>
            </div>
        </nav>
        
       
        
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
<div class="toast">
  <div class="toast-header">
    회원 탈퇴 확인
  </div>
  <div class="toast-body">
    정말 탈퇴하시겠습니까 ? 
  </div>
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
        <script src="js/scripts.js"></script>
</body>
</html>