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
       
        <style>
        	#map{
        		height:500px;
        		margin-bottom: 10px;
        	}
        	
        </style>
        
        
        <script type="text/javascript">
        
      
		
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
 
   
   
    </script>
    <!--  동적으로 콤보박스 바꾸기 END -->
    </head>
    <body id="page-top">
        <!-- Navigation-->
	<jsp:include page="header.jsp"></jsp:include>
        <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">Happy House</h1><br>
                <h2 class="masthead-heading text-uppercase mb-0" id ="happy">행복한 우리집</h2>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line "></div>
                    <div class="divider-custom-icon"><i class="fas fa-home"></i></div>
                    <div class="divider-custom-line "></div>
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
          <div class="form-group md-1 ml-2">
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
          <div class="form-group md-1 ml-2"">
            <select class="form-control" name="dong" id="dong">
              <option value="all">동</option>
              <c:forEach var="dongs" items = "${donglist}" varStatus="status">
              <option value="${dongs.dong}">${dongs.dong}</option>
              </c:forEach>
            </select>
          </div>
          <div class="form-group md-1 ml-2"">
          <input  class="btn btn-warning" type="button" value="검색"  onclick="javascript:search()"/>
          </div>
          <div class="form-group md-1 ml-2"">
          <input  class="btn btn-secondary" type="button" onclick='interest()'  value="관심 목록에 추가"/>
          </div>
        </form>
      </div>
            </div>
        </header>
        
        <!-- Map Section-->
        <section class="page-section portfolio" id="portfolio">
            <div class="container">
                <!-- Portfolio Grid Items-->
                <div class="row justify-content-center">
                    <!-- Portfolio Item 1-->
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal1">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img class="img-fluid" src="${root }/assets/img/portfolio/cabin.png" alt="" />
                        </div>
                    </div>
                   
                </div>
            </div>
        </section>
        <!-- About Section-->
        <section class="page-section bg-primary text-white mb-0" id="about">
            <div class="container">
                <!-- About Section Content-->
                <div class="row" id = "cos_contents">
                	<div class="col">
                		<h3>오늘의 뉴스</h3>
                		<div class="divider-custom divider-light">
                    	<div class="divider-custom-line"></div>
                    	<div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    	<div class="divider-custom-line"></div>
                		</div>
                	</div>
                </div>
               </div>
        </section>
        
        <!-- Footer-->
        <jsp:include page="footer.jsp"></jsp:include>

      
       
        <!-- Portfolio Modals-->
        <!-- Portfolio Modal 1-->
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fas fa-times"></i></span>
                    </button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal1Label">Maps</h2>
                                    <!-- Icon Divider-->
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <!-- Portfolio Modal - Image-->
                                    <div id="map">
                                    </div>
                                    <!-- Portfolio Modal - Text-->
                                    <button class="btn btn-primary" data-dismiss="modal">
                                        <i class="fas fa-times fa-fw"></i>
                                        Close Window
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
