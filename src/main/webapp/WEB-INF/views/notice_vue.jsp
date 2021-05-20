<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="icon" href="/favicon.ico">
<title>Happy House</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${root }/css/styles.css" rel="stylesheet" />
<link href="${root }/css/custom.css" rel="stylesheet" />
<link href="${root}/css/app.css" rel="preload" as="style">
<link href="${root}/js/app.js" rel="preload" as="script">
<link href="${root}/css/app.css" rel="stylesheet">

<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFhvndwTb7zd3egLZQsUDFAIaDJtZLhjo&callback=initMap&libraries=&v=weekly"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
       
        <style>
        	#map{
        		height:500px;
        		margin-bottom: 10px;
        	}
        	
        </style>
        
        
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
		
		
		$(function(){
		     
		   //군구 리스트 받기
		$("#city").change(function(){
			let si = $('#city').val();
		$.ajax({
			url:'${root}/address/gugun/' + si,  
			type:'GET',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			success:function(address) {
				var list= "<option value=all >시/군</option>";
	            $("#gu").empty();
	            $.each(address, function(index,item){
	                list+= "<option value=" +item.gugun+" >"+item.gugun+"</option>";
	            });
	            $("#gu").append(list);
			},
			error:function(xhr,status,msg){
				console.log("상태값 : " + status + " Http에러메시지 : "+msg);
			},
			statusCode: {
				500: function() {
					alert("서버에러.");
					// location.href = "/error/e500";
				},
				404: function() {
					alert("페이지없다.");
					// location.href = "/error/e404";
				}
			}	
		});
		})
		
		
		//동 리스트 받기
		$("#gu").change(function(){
			let gugun = $('#gu').val();
		$.ajax({
			url:'${root}/address/dong/' + gugun,  
			type:'GET',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			success:function(address) {
				var list= "<option value=all >동</option>";
	            $("#dong").empty();
	            $.each(address, function(index,item){
	                list+= "<option value=" +item.dong+" >"+item.dong+"</option>";
	            });
	            $("#dong").append(list);
			},
			error:function(xhr,status,msg){
				console.log("상태값 : " + status + " Http에러메시지 : "+msg);
			},
			statusCode: {
				500: function() {
					alert("서버에러.");
					// location.href = "/error/e500";
				},
				404: function() {
					alert("페이지없다.");
					// location.href = "/error/e404";
				}
			}	
		});
		})
		
		})
		
		
        
   function initMap() {
       const myLatLng = {  lat: 37.570705, lng: 126.981354};
       const map = new google.maps.Map(document.getElementById("map"), {
         zoom: 15,
         center: myLatLng,
       });
     }
   function search(){
		
       
	   var form =document.getElementById("frm");
       var dong = form.dong.value;
       var gu = form.gu.value;
       form.act.value = "searchhouse";
       $("#frm").attr("action", "${root}/search/searchDong").submit();
   }
   
   
   
    </script>


</head>
<body>
	<noscript>
		<strong>We're sorry but vue_happyhouse doesn't work properly
			without JavaScript enabled. Please enable it to continue.</strong>
	</noscript>

	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<div class="dropdown">
				<button type="button" class="btn btn-primary dropdown-toggle mr-3"
					data-toggle="dropdown">More</button>
				<div class="dropdown-menu">
					<h3 class="dropdown-header">Lists</h3>
					<a class="dropdown-item" href="${root}/mvnotice">공지사항</a> <a
						class="dropdown-item" href="#" id="todaynews">오늘의 뉴스</a> <a
						class="dropdown-item" href="#" id="search">주변 탐방</a>
					<c:if test="${userinfo ne null}">
						<a class="dropdown-item"
							href="${root }/interest/list?userid=${userinfo.userid}">관심 지역
							둘러보기</a>
					</c:if>
				</div>
			</div>


			<a class="navbar-brand js-scroll-trigger" href="${root }/">Happy
				House</a>
			<button
				class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<c:if test="${ userinfo eq null }">
						<li class="nav-item mx-0 mx-lg-1" id="signupli"><a
							class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
							id="signup" href="${root}/user/mvsignup">Sign up</a></li>
						<li class="nav-item mx-0 mx-lg-1" id="signinli"><a
							class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
							data-toggle="modal" data-target="#loginModal">Sign in</a></li>
					</c:if>
					<c:if test="${ userinfo ne null }">
						<li class="nav-item mx-0 mx-lg-1" id="logoutli"><a
							class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
							id="logout">Logout</a></li>
						<li class="nav-item mx-0 mx-lg-1" id="userinfoli"><a
							class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
							data-toggle="modal" data-target="#infoModal">UserInfo</a></li>
					</c:if>
				</ul>

				<input class="form-control" id="myInput" name="searchbyapt"
					type="text" placeholder="Search.." style="width: 500px">
				<button class="btn btn-warning" id="searchbyapt" type="submit">검색</button>
			</div>
		</div>
	</nav>
	
	<header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">Happy House</h1><br>
                <h2 class="masthead-heading text-uppercase mb-0" id ="happy">행복한 우리집</h2>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <div class="sorting-filters text-center mb-20 d-flex justify-content-center">
 <form class="form-inline" id="frm" method = "post" action="">
         <input type="hidden" id="code"  name="act" value="" />
         <input type="hidden" id="userid"  name="userid" value="${userinfo.userid }" />
          <div class="form-group md">
            <select class="form-control" name="city" id="city">
                 <c:if test="${gugunlist eq null}">
                 <option value="all" >도/광역시</option>
	              <option value="서울특별시" >서울시</option>
	              <option value="인천광역시" >인천시</option>
	              <option value="대전광역시" >대전시</option>
	              <option value="대구광역시" >대구시</option>
	              <option value="부산광역시" >부산시</option>
	              <option value="울산광역시" >울산시</option>
	              <option value="광주광역시" >광주시</option>
	              <option value="경기도" >경기도</option>
	              <option value="세종특별자치시" >세종시</option>
	              <option value="강원도" >강원도</option>
	              <option value="경상북도" >경상북도</option>
	              <option value="경상남도" >경상남도</option>
	              <option value="충청북도" >충청북도</option>
	              <option value="충청남도" >충청남도</option>
	              <option value="전라남도" >전라남도</option>
	              <option value="전라북도" >전라북도</option>
	              <option value="제주특별자치도" >제주도</option>
                 </c:if>
                 <c:if test="${gugunlist ne null}">
	              <option value="${selectedsi}" >${selectedsi}</option>                 
                 </c:if>
                 
            </select>
          </div>
          <div class="form-group md-1">
            <select class="form-control" name="gugun" id="gu">
            <c:if test="${donglist eq null}">
              <option value="all" >구/군</option>
              <c:forEach var="guguns" items = "${gugunlist}" varStatus="status">
              <option value="${guguns.gugun}">${guguns.gugun}</option>
              </c:forEach>
            </c:if>
            <c:if test="${donglist ne null }">
	              <option value="${selectedgu}" >${selectedgu}</option>                             
            </c:if>
            </select>
          </div>
          <div class="form-group md-1">
            <select class="form-control" name="dong" id="dong">
              <option value="all">동</option>
              <c:forEach var="dongs" items = "${donglist}" varStatus="status">
              <option value="${dongs.dong}">${dongs.dong}</option>
              </c:forEach>
            </select>
          </div>
          <div class="form-group md-1">
          <input  class="btn btn-warning" type="button" value="검색"  onclick="javascript:search()"/>
          </div>
          <div class="form-group md-1">
          <input  class="btn btn-secondary" type="button" onclick='interest()'  value="관심 목록에 추가"/>
          </div>
        </form>
      </div>
            </div>
        </header>
	
	<div class="container mt-3 mb-3">
		<div id="app"></div>
		<script src="${root}/js/app.js"></script>
	</div>

	<!-- Footer-->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Find Us</h4>
					<p class="lead mb-0">
						(SSAFY) 서울시 강남구 테헤란로 멀티스퀘어 <br /> 1544-9001 <br />
						admin@ssafy.com
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright © SSAFY. All rights reserved.</small>
		</div>
	</div>
	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
	<div class="scroll-to-top d-lg-none position-fixed">
		<a class="js-scroll-trigger d-block text-center text-white rounded"
			href="#page-top"><i class="fa fa-chevron-up"></i></a>
	</div>
	<!-- Portfolio Modals-->
	<!-- Portfolio Modal 1-->
	<div class="portfolio-modal modal fade" id="portfolioModal1"
		tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label"
		aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"><i class="fas fa-times"></i></span>
				</button>
				<div class="modal-body text-center">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- Portfolio Modal - Title-->
								<h2
									class="portfolio-modal-title text-secondary text-uppercase mb-0"
									id="portfolioModal1Label">Maps</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- Portfolio Modal - Image-->
								<div id="map"></div>
								<!-- Portfolio Modal - Text-->
								<button class="btn btn-primary" data-dismiss="modal">
									<i class="fas fa-times fa-fw"></i> Close Window
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
							<label for="loginId">ID:</label> <input type="text"
								class="form-control" placeholder="Enter ID" id="userid"
								name="userid">
						</div>
						<div class="form-group">
							<label for="loginPwd">Password:</label> <input type="password"
								class="form-control" placeholder="Enter password" id="userpwd"
								name="userpwd">
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

	<div class="modal fade" id="infoModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="color: black">회원
						정보 확인</h5>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<h1 style="color: black">회원 정보 확인</h1>
					<table class="table table-hover">
						<tbody>
							<tr>
								<td>아이디 :</td>
								<td>${ userinfo.userid }</td>
							</tr>
							<tr>
								<td>비밀번호 :</td>
								<td>${ userinfo.userpwd }</td>
							</tr>
							<tr>
								<td>이름 :</td>
								<td>${ userinfo.username }</td>
							</tr>
							<tr>
								<td>e-mail :</td>
								<td>${ userinfo.email }</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">확인</button>
					<button type="button" class="btn btn-primary" id="modify-btn"
						onclick="location.href='${root}/user/usermodify'">수정</button>
					<button type="button" class="btn btn-danger" id="delete-btn">회원
						탈퇴</button>
				</div>
			</div>
		</div>
	</div>
	<div class="toast">
		<div class="toast-header">회원 탈퇴 확인</div>
		<div class="toast-body">정말 탈퇴하시겠습니까 ?</div>
	</div>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Contact form JS-->
	<script src="assets/mail/jqBootstrapValidation.js"></script>
	<script src="assets/mail/contact_me.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>

</html>