<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
String root = request.getContextPath();
pageContext.setAttribute("root", root);
--%>
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

	<!-- Map Section-->
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover">
						<h4>관심 지역</h4>
						<tbody>
							<c:if test="${interestlist ne null }">
								<c:forEach var="item" items="${interestlist}">
									<tr>
									<td>
											<div class="form-group md-1">
												${item.city } ${item.gugun } ${item.dong} 
												<a class="btn btn-primary" href="${root }/search/searchDong?city=${item.city }&gugun=${item.gugun }&dong=${item.dong} ">검색</a>
												<a class="btn btn-primary" href="${root }/interest/delete?userid=${userinfo.userid }&dong=${item.dong} ">삭제</a>
											</div></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>


	<!-- Footer-->
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script src="js/scripts.js"></script>
</body>
</html>
