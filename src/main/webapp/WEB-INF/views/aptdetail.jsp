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
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFhvndwTb7zd3egLZQsUDFAIaDJtZLhjo&callback=initMap&libraries=&v=weekly"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<script type="text/javascript" src="${root }/main.js"></script>
<script type="text/javascript" src="${root }/area.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
<style>
#map {
	height: 500px;
	margin-bottom: 10px;
}
</style>

</head>

<script>


function initMap() {
    var myLatLng = { lat: ${house.lat}, lng: ${house.lng} };
    const map = new google.maps.Map(document.getElementById("map"), {
    	 mapId: "8e0a97af9386fef",
    	zoom: 16,
      center: myLatLng,
      
    });
    const transitLayer = new google.maps.TransitLayer();
    transitLayer.setMap(map);
    $.ajax({ // 주변 공원 데이터를 받아온다
        url : '${root}/search/searchMarkerPark/${house.no}', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
        method : 'get',
        data : {},
        datatype:"json",
        contentType: 'application/json;charset=utf-8',
        success : function(data){ //DB접근 후 가져온 데이터
            $.each(data, function(index,item){
            	var parkmarker = {  lat: item.lat*=1, lng: item.lit*=1 }; // 그냥받으면 문자열이기때문에 형변환
         	   
         	    parkmarker = new google.maps.Marker({
                	  icon:
                	   {
                		   url: "http://maps.google.com/mapfiles/kml/pal2/icon4.png"
                	   },
                       position: parkmarker, // 마커가 위치할 위도와 경도(변수)
                       map: map,
                       animation: google.maps.Animation.DROP,
                      
                       title: '검색 결과' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                });
                
                var content = "공원명 : "+item.parkname+"<br>공원분류 : "+ item.parkdiv; // 말풍선 안에 들어갈 내용
                // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
                var infowindow = new google.maps.InfoWindow({content: content});
           
                google.maps.event.addListener(parkmarker, "click", function() {
                	
                    infowindow.open(map,parkmarker);
                }); 
                if (parkmarker) {
                	parkmarker.addListener('click', function() {
                        
                        //중심 위치를 클릭된 마커의 위치로 변경
                        map.setCenter(this.getPosition());
 
                        //마커 클릭 시의 줌 변화
                        map.setZoom(17);
                        
                    });
                }
            });
        }
    })

    
    $.ajax({ // 주변 상점 데이터를 받아온다
        url : '${root}/search/searchMarkerMarket/${house.no}', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
        method : 'get',
        data : {},
        datatype:"json",
        contentType: 'application/json;charset=utf-8',
        success : function(data){ //DB접근 후 가져온 데이터
            $.each(data, function(index,item){
         	    var marketmarker = {  lat: item.lat*=1, lng: item.lit*=1 }; // 그냥받으면 문자열이기때문에 형변환
         	    
         	    var storeimage = new google.maps.MarkerImage("/image/policeimg.png", null, null, null, new google.maps.Size(12,20));
         	   marketmarker = new google.maps.Marker({
                	 icon: 
                	 {
                		
              		  url: "http://maps.google.com/mapfiles/kml/pal2/icon32.png"
              	 },
                       position: marketmarker, // 마커가 위치할 위도와 경도(변수)
                       map: map,
                       animation: google.maps.Animation.DROP,
                       title: '검색 결과' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                });
         	  	
                var content = " - "+item.mname+"<br>분류 "+ item.type_lit; // 말풍선 안에 들어갈 내용
                // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
                var infowindow = new google.maps.InfoWindow({content: content});

                google.maps.event.addListener(marketmarker, "click", function() {
                    infowindow.open(map,marketmarker);
                }); 
                if (marketmarker) {
                	marketmarker.addListener('click', function() {
                        
                        //중심 위치를 클릭된 마커의 위치로 변경
                        map.setCenter(this.getPosition());
 
                        //마커 클릭 시의 줌 변화
                        map.setZoom(17);
                    });
                }
              
            });
        }
    })
    
    $.ajax({ // 주변 버정 데이터를 받아온다
        url : '${root}/search/searchMarkerBusstop/${house.no}', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
        method : 'get',
        data : {},
        datatype:"json",
        contentType: 'application/json;charset=utf-8',
        success : function(data){ //DB접근 후 가져온 데이터
            $.each(data, function(index,item){
         	    var busmarker = {  lat: item.lat*=1, lng: item.lit*=1 }; // 그냥받으면 문자열이기때문에 형변환
                busmarker = new google.maps.Marker({
                	  icon:
                	   {
                		   url: "http://maps.google.com/mapfiles/kml/pal4/icon54.png"
                	   },
                       position: busmarker, // 마커가 위치할 위도와 경도(변수)
                       map: map,
                       animation: google.maps.Animation.DROP,
                      
                       title: '검색 결과' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                });
                var content = "버정이름 : "+item.busstop_name; // 말풍선 안에 들어갈 내용
                // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
                var infowindow = new google.maps.InfoWindow({content: content});

                google.maps.event.addListener(busmarker, "click", function() {
                    infowindow.open(map,busmarker);
                }); 
                if (busmarker) {
                	busmarker.addListener('click', function() {
                        
                        //중심 위치를 클릭된 마커의 위치로 변경
                        map.setCenter(this.getPosition());
 
                        //마커 클릭 시의 줌 변화
                        map.setZoom(17);
                    });
                }
            });
        }
    })
    
    //마커 이미지
    
    
     $.ajax({ // 주변 경찰서,파출소 데이터를 받아온다
        url : '${root}/search/searchMarkerpolice/${house.no}', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
        method : 'get',
        data : {},
        datatype:"json",
        contentType: 'application/json;charset=utf-8',
        success : function(data){ //DB접근 후 가져온 데이터
            $.each(data, function(index,item){
         	    var policemarker = {  lat: item.lat*=1, lng: item.lit*=1 }; // 그냥받으면 문자열이기때문에 형변환
         	   
         	    policemarker = new google.maps.Marker({
         	    	
                	  icon: 
                	 	{
                		   url: "http://maps.google.com/mapfiles/kml/pal2/icon8.png"
                	   },
                       position: policemarker, // 마커가 위치할 위도와 경도(변수)
                       map: map,
                       animation: google.maps.Animation.DROP,
                      
                       title: '검색 결과' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                });
                var content = "경찰서명 : "+item.police_name; // 말풍선 안에 들어갈 내용
                // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
                var infowindow = new google.maps.InfoWindow({content: content});

                google.maps.event.addListener(marker, "click", function() {
                    infowindow.open(map,policemarker);
                }); 
                if (policemarker) {
                	policemarker.addListener('click', function() {
                        
                        //중심 위치를 클릭된 마커의 위치로 변경
                        map.setCenter(this.getPosition());
 
                        //마커 클릭 시의 줌 변화
                        map.setZoom(17);
                    });
                }
            });
        }
    })
    
         $.ajax({ // 주변 지하철역 데이터를 받아온다
        url : '${root}/search/searchMarkersubway/${house.no}', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
        method : 'get',
        data : {},
        datatype:"json",
        contentType: 'application/json;charset=utf-8',
        success : function(data){ //DB접근 후 가져온 데이터
            $.each(data, function(index,item){
         	    var subwaymarker = {  lat: item.lat*=1, lng: item.lit*=1 }; // 그냥받으면 문자열이기때문에 형변환
         	    
         	   subwaymarker = new google.maps.Marker({
                	  icon:
                	   {
                		   url: "http://maps.google.com/mapfiles/ms/micons/subway.png"
                	   },
                       position: subwaymarker, // 마커가 위치할 위도와 경도(변수)
                       map: map,
                       animation: google.maps.Animation.DROP,
                      
                       title: '검색 결과' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                });
         	    
         	    
         	    
                var content = "역 명 : "+item.name+"역"; // 말풍선 안에 들어갈 내용
                // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
                var infowindow = new google.maps.InfoWindow({content: content});

                google.maps.event.addListener(subwaymarker, "click", function() {
                    infowindow.open(map,subwaymarker);
                }); 
                if (subwaymarker) {
                	subwaymarker.addListener('click', function() {
                        
                        //중심 위치를 클릭된 마커의 위치로 변경
                        map.setCenter(this.getPosition());
 
                        //마커 클릭 시의 줌 변화
                        map.setZoom(17);
                    });
                }
            });
        }
    })
    
    new google.maps.Marker({
    	position: { lat: ${house.lat}, lng: ${house.lng} },
    	//label : "${house.aptName}",
    	map: map,
    	icon: { url: "http://maps.google.com/mapfiles/kml/pal3/icon56.png"},
    	animation: google.maps.Animation.BOUNCE
    });
    
}
/*
        $(function(){
            $('ul.nav-tabs a').click(function (e) {
              e.preventDefault()
              $(this).tab('show');
            })
        });
*/


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


	<section class="container mt-3 mb-3">
		<div>
			<div class="row mt-5 mb-5">
				<div class="col-md-8">
					<h3>${house.aptName}</h3>
				</div>
			</div>

			<div class="row mb-5">
				<div class="col-md-7">
					<div id="map" style="width: 100%; height: 700px; margin: auto;"></div>
				</div>
				<div class="col-md-5">
					<table class="table table-hover">
						<h4>거래 정보</h4>
						<tbody>
							<c:if test="${houselist ne null }">
								<c:forEach var="house" items="${houselist}">
									<tr>
										<td>이름 : <a
											href="${root}/search/mvdealdetail/${house.no}">${house.aptName}</a><br>
											거래금액: ${house.dealAmount}<br> 면적: ${house.area }<br>
											등록일 : ${house.dealYear }.${house.dealMonth }.${house.dealDay }<br>


										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${aptlist ne null }">
								<c:forEach var="house" items="${aptlist}">
									<tr>
										<td>이름 :<a href="${root}/search/mvdealdetail/${house.no}">
												${house.aptName}</a><br> 거래금액: ${house.dealAmount}<br>
											면적: ${house.area }<br> 등록일 : ${house.dealYear }.${house.dealMonth }.${house.dealDay }
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

			<div class="row mb-5">
				<div class="col-sm-1"></div>
				<div class="col-sm-10">
					<nav>
						<ul class="nav nav-tabs" id="myTab" role="tablist">

							<li class="nav-item" role="presentation"><a
								class="btn btn-outline-primary" href="#marketplace"
								data-toggle="tab">주변상권보기</a></li>&nbsp
							<li class="nav-item" role="presentation"><a
								class="btn btn-outline-success" href="#busstopplace"
								data-toggle="tab">주변버정보기</a></li>&nbsp
							<li class="nav-item" role="presentation"><a
								class="btn btn-outline-warning" href="#parkplace"
								data-toggle="tab">주변공원보기</a></li>&nbsp
							<li class="nav-item" role="presentation"><a
								class="btn btn-outline-danger" href="#subwayplace"
								data-toggle="tab">주변쟈철역보기</a></li>&nbsp
							<li class="nav-item" role="presentation"><a
								class="btn btn-outline-dark" href="#policeplace"
								data-toggle="tab">주변경찰서보기</a></li>
						</ul>
					</nav>
					<br>
					<div class="tab-content">
						<div class="tab-pane fade in active" id="marketplace"
							role="tabpanel" aria-labelledby="market-tab">
							<c:if test="${marketlist ne null }">
								<h6>- 주변에 이런 곳들이 있어요</h6>
								<img src="http://maps.google.com/mapfiles/kml/pal2/icon32.png">상권
						<table class="table table-hover" id="marketlist">
									<thead>
										<tr>
											<th>가게 이름</th>
											<th>소분류</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="market" items="${marketlist}">
											<tr>
												<td><a
													href="${root}/search/mvstoredetail/${market.mname}">${market.mname}</a></td>
												<td>${market.type_lit}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							<c:if test="${marketlist eq null }">
					주변에 상권이 없어요
					</c:if>
							<div id="pagination"></div>
						</div>

						<div class="tab-pane fade" id="busstopplace" role="tabpanel"
							aria-labelledby="busstop-tab">
							<c:if test="${busstoplist ne null }">
								<h6>- 근처에 버스정류장이 있어요</h6>
								<img src="http://maps.google.com/mapfiles/kml/pal4/icon54.png">버스정류장
						<table class="table table-hover">
									<thead>
										<tr>
											<th>버정 이름</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="busstop" items="${busstoplist}">
											<tr>
												<td>${busstop.busstop_name}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							<c:if test="${busstoplist eq null }">
					주변에 버정 없어요
					</c:if>
						</div>

						<div class="tab-pane fade" id="parkplace" role="tabpanel"
							aria-labelledby="park-tab">
							<c:if test="${parklist ne null }">
								<h6>- 근처에 공원이 있어요</h6>
								<img src="http://maps.google.com/mapfiles/kml/pal2/icon4.png">공원
						<table class="table table-hover">
									<thead>
										<tr>
											<th>공원 이름</th>
											<th>분류</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="park" items="${parklist}">
											<tr>
												<td><a
													href="${root}/search/mvparkdetail/${park.parkname}">${park.parkname}</a></td>
												<td>${park.parkdiv}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							<c:if test="${parklist eq null }">
					주변에 공원이 없어요
					</c:if>
						</div>

						<div class="tab-pane fade" id="policeplace" role="tabpanel"
							aria-labelledby="police-tab">
							<c:if test="${policelist ne null }">
								<h6>- 근처에 경찰서가 있어요</h6>
								<img src="http://maps.google.com/mapfiles/kml/pal2/icon8.png">경찰서
						<table class="table table-hover">
									<thead>
										<tr>
											<th>경찰서 이름</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="police" items="${policelist}">
											<tr>
												<td>${police.police_name}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							<c:if test="${policelist eq null }">
					주변에 경찰서 없어요
					</c:if>
						</div>

						<div class="tab-pane fade" id="subwayplace" role="tabpanel"
							aria-labelledby="subway-tab">
							<c:if test="${subwaylist ne null }">
								<h6>- 근처에 지하철역이 있어요</h6>
								<img src="http://maps.google.com/mapfiles/ms/micons/subway.png">지하철역
						<table class="table table-hover">
									<thead>
										<tr>
											<th>지하철역 이름</th>
											<th>호선</th>
											<th>역 분류</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="subway" items="${subwaylist}">
											<tr>
												<td><a
													href="${root}/search/mvsubwaydetail/${subway.name}">${subway.name}</a></td>
												<td>${subway.route_name}</td>
												<td>${subway.transfer}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							<c:if test="${subwaylist eq null }">
					주변에 지하철 없어요
					</c:if>
						</div>
					</div>
					<div class="col-sm-1"></div>

				</div>
				<div id="chart_div"></div>
				<!--  
			<div class="tab-content">
				<div class="tab-pane container active" href="#marketplace">
					<c:if test="${marketlist ne null }">
						<h6>- 주변에 이런 곳들이 있어요</h6><img src="https://maps.google.com/mapfiles/ms/icons/yellow-dot.png">상권
						<table class="table">
							<thead>
								<tr>
									<th>가게 이름</th>
									<th>소분류</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="market" items="${marketlist}">
									<tr>
										<td>${market.mname}</td>
										<td>${market.type_lit}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
					<c:if test="${marketlist eq null }">
					주변에 상권이 없어요
					</c:if>
				</div>
				-->
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