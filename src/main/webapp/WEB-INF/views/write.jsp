<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
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
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFhvndwTb7zd3egLZQsUDFAIaDJtZLhjo&callback=initMap&libraries=&v=weekly"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript" src="${root }/main.js"></script>
<script type="text/javascript" src="${root }/area.js"></script>
<style>
#map {
	height: 500px;
	margin-bottom: 10px;
}
</style>
  
</head>
<body id="page-top">
	<!-- Navigation-->
	<jsp:include page="header.jsp"></jsp:include>
<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
	
	<section class="page-section" id="contact">
	
	<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<h2>공지사항 글쓰기</h2>
		<form id="writeform" method="post" enctype="multipart/form-data" action="${root}/article/write">
		 <input type="hidden" id="userid"  name="userid" value="${userinfo.userid}" />
			<div class="form-group" align="left">
				<label for="subject">제목:</label>
				<input type="text" class="form-control" id="subject" name="subject">
			</div>
			<div class="form-group" align="left">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="15" id="content" name="content"></textarea>
			</div>
			<div class="form-group" align="left">
				<label for="subject">파일:</label>
				<input type="file" class="form-control-file border" name="upfile" multiple="multiple">
			</div>
			<button type="submit" id="writeBtn" class="btn btn-primary">글작성</button>
			<button type="reset" class="btn btn-warning">초기화</button>
		</form>
	</div>
</div>
</section>
</div>

	<!-- Footer-->
	<jsp:include page="footer.jsp"></jsp:include>
		
</body>
</html>
