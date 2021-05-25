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
	<jsp:include page="../header.jsp"></jsp:include>
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
			<h2>${subway.name}</h2> 
				<table class="table table-striped table-bordered">

					<tbody>
					<c:if test="${subway ne null }">
						<tr>
							<td>역 명</td>
							<td>${subway.name}</td>
						</tr>
						<tr>
							<td>호선</td>
							<td>${subway.route_name}</td>
						</tr>
						<tr>
							<td>구분</td>
							<td>${subway.transfer}</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td>${subway.phone}</td>
						</tr>
					</c:if>
					</tbody>
				</table>
			</div>
			<div class="col-md-3 text-center"></div>
		</div>

</section>


<jsp:include page="${root}/footer.jsp"></jsp:include>


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
	
</body>
</html>