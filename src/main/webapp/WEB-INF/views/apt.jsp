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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Happy House</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"	rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${root }/css/styles.css" rel="stylesheet" />
<link href="${root }/css/custom.css" rel="stylesheet" />
<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFhvndwTb7zd3egLZQsUDFAIaDJtZLhjo&callback=initMap&libraries=&v=weekly"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${root }/main.js"></script>
<script type="text/javascript" src="${root }/area.js"></script>
<style>
#map {
	height: 500px;
	margin-bottom: 10px;
}
</style>
<script type="text/javascript">
        
       
		</script>
<script>
   var blat = ${address.lat};
   var blng = ${address.lng};
   function initMap() {
       var myLatLng = { lat: blat, lng: blng };
       const map = new google.maps.Map(document.getElementById("map"), {
         zoom: 14,
         center: myLatLng,
       });
       $.ajax({
           url : '${root }/search/searchMarker', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
           mathod : 'post',
           data : {
                 "apt": "${apt}", "dong":"${dong}"  //0 아파트 1 동검색 
           },
           datatype:"json",
           contentType: 'application/json;charset=utf-8',
           success : function(data){ //DB접근 후 가져온 데이터
               $.each(data, function(index,item){
            	    var marker = {  lat: item.lat*=1, lng: item.lng*=1}; // 그냥받으면 문자열이기때문에 형변환
                   marker = new google.maps.Marker({
                          position: marker, // 마커가 위치할 위도와 경도(변수)
                          map: map,
                          title: '검색 결과' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                   });
                   var content = "아파트명 : "+item.aptName+"<br>아파트 가격 : "+item.dealAmount;
                   var infowindow = new google.maps.InfoWindow({ content: content});

                   google.maps.event.addListener(marker, "click", function() {
                       infowindow.open(map,marker);
                   }); 
               });
           }
       })
     }
   
	</script>
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
				<div class="col-md-4"></div>
				<div class="col-md-8">
					<h3>${address.city} ${address.gugun} ${address.dong}</h3>
				</div>
				<div class="col-md-2"></div>
			</div>
			
			<div class="row mt-5">
				<div class="col-md-6">
					<div class ="row">
						<div id="map" style="width: 100%; height: 500px; margin: auto;"></div>
					</div>
					<div class="row mt-4">
						<h5>해당 동 아파트 정보</h5>
						<table class="table table-hover">
							<tbody>
							<c:if test="${hlist ne null }">
								<c:forEach var="house" items="${hlist}">
									<tr>
										<td><a href="${root}/search/mvdetail/${house.no}">${house.aptName}</a><br>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
						${navigation.navigator}
					</div>
				</div>
				
				<div class="col-md-6">
				<input type="hidden" name="pg" id="pg" value="1">
					<table class="table table-hover">
						<h4>거래 정보</h4>
						<tbody>
							<c:if test="${houselist ne null }">
								<c:forEach var="house" items="${houselist}">
									<tr>
										<td>이름 : <a href="${root}/search/mvdealdetail/${house.no}">${house.aptName}</a><br>
											거래금액: ${house.dealAmount}<br> 면적: ${house.area }<br>
											등록일 : ${house.dealYear }.${house.dealMonth }.${house.dealDay }<br>
											<img src="${root}/img/${house.img}" width="350" height="260"
											alt="no search image">
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${aptlist ne null }">
								<c:forEach var="house" items="${aptlist}">
									<tr>
										<td>이름 :<a href="${root}/search/mvdealdetail/${house.no}"> ${house.aptName}</a><br> 거래금액:
											${house.dealAmount}<br> 면적: ${house.area }<br> 등록일
											: ${house.dealYear }.${house.dealMonth }.${house.dealDay } <img
											src="${root}/img/${house.img}" width="350" height="260">
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<tr>
								<td>더이상의 검색 결과가 없습니다!</td>
							</tr>
						</tbody>
					</table>
				</div>
				

			</div>
		</div>
	</section>


	<!-- Footer-->
	<jsp:include page="footer.jsp"></jsp:include>
	
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

</body>
</html>
