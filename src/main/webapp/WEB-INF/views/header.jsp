<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	   var form = document.getElementById("frm");
       var dong = form.dong.value;
       var gugun = form.gu.value;
       var city = form.city.value;
       form.act.value = "searchhouse";
       $("#frm").attr("action", "${root}/search/searchDong").submit();
   }
   function interest(){
	   var form = document.getElementById("frm");
       var dong = form.dong.value;
       var gugun = form.gu.value;
       var city = form.city.value;
       form.act.value = "registerInterest";
       $("#frm").attr("action", "${root}/interest/insert").submit();
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
					<a class="dropdown-item" href="#" id="todaynews">오늘의 뉴스</a>
    			
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
                    
							<input class="form-control" id="myInput" name = "searchbyapt" type="text" placeholder="Search.." style="width: 500px">
							<button  class="btn btn-warning" id = "searchbyapt" type = "submit" >검색</button>						
                </div>
            </div>
        </nav>
</body>
</html>