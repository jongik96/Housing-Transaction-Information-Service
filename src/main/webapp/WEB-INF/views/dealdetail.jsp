<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
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
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Happy House</h1>
			<br>
			<h2 class="masthead-heading text-uppercase mb-0" id="happy">행복한
				우리집</h2>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-home"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<div
				class="sorting-filters text-center mb-20 d-flex justify-content-center">

			</div>
		</div>

	</header>

	<section class="container mt-5 mb-5">
		<div class="row text-center align-items-center h-100"">
			<div class="col-md-3 text-center"></div>
			<div class="col-md-6 text-center">
			<h2>${house.aptName}</h2><br>
				<table class="table table-striped table-bordered">

					<tbody>
					<c:if test="${house ne null }">
						<tr>
							<td>거래번호</td>
							<td>${house.no}</td>
						</tr>
						<tr>
							<td>법정동</td>
							<td>${house.dong}</td>
						</tr>
						<tr>
							<td>아파트명</td>
							<td>${house.aptName}</td>
						</tr>
						<tr>
							<td>거래량</td>
							<td>${house.dealAmount}</td>
						</tr>
						<tr>
							<td>건축년도</td>
							<td>${house.buildYear}년</td>
						</tr>
						<tr>
							<td>거래일</td>
							<td>${house.dealYear}년 ${house.dealMonth }월 ${house.dealDay }일</td>
						</tr>
						<tr>
							<td>면적</td>
							<td>${house.area}</td>
						</tr>
						<tr>
							<td>층수</td>
							<td>${house.floor}</td>
						</tr>
						<tr>
							<td>주소지</td>
							<td>${house.jibun}</td>
						</tr>
					</c:if>
					</tbody>
				</table>
			</div>
			<div class="col-md-3 text-center"></div>
		</div>

</section>




	<!-- Footer-->
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>