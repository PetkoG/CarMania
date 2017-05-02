<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>The Auto-Tuning Website Template | Details :: w3layouts</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Anaheim' rel='stylesheet' type='text/css'>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--image slider-->
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 
<script src="js/jquery-slider.js" type="text/javascript"></script>
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
<link href="css/easy-responsive-tabs.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" href="css/global.css">
<style>
.details li {
color: white;
}
.form-custom input[type=submit] {
	background: #585858;
	background: -moz-linear-gradient(top, #585858 0%, #313131 1%, #2d2d2d 20%, #232323 70%, #1f1f1f 99%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#585858), color-stop(1%,#313131), color-stop(20%,#2d2d2d), color-stop(70%,#232323), color-stop(99%,#1f1f1f));
	background: -webkit-linear-gradient(top, #585858 0%,#313131 1%,#2d2d2d 20%,#232323 70%,#1f1f1f 99%);
	background: -o-linear-gradient(top, #585858 0%,#313131 1%,#2d2d2d 20%,#232323 70%,#1f1f1f 99%);
	background: -ms-linear-gradient(top, #585858 0%,#313131 1%,#2d2d2d 20%,#232323 70%,#1f1f1f 99%);
	background: linear-gradient(to bottom, #585858 0%,#313131 1%,#2d2d2d 20%,#232323 70%,#1f1f1f 99%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#585858', endColorstr='#1f1f1f',GradientType=0 );
	display: -moz-inline-stack;
	display: inline-block;
	vertical-align: middle;
	zoom: 1;
	border: 1px solid #272525;
	line-height: 32px;
	padding: 2px 20px;
	font-weight: 300;
	font-size: 14px;
	font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
	color: #666666;
	text-shadow: 0 1px 1px rgba(5, 5, 5, 0.47);
	text-decoration: none;
	text-align: center;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	-o-border-radius: 3px;
}
.form-custom h2 {
color: #969696;
	text-transform: capitalize;
	font-size: 1.3em;
	font-weight: normal;
	font-family: 'Anaheim', sans-serif;
}
.form-custom {
  	 width: 26%;
    padding: -50px;
    position: relative;
}
.bigFont li {	
font-size: 18px;
}
a {
    text-decoration: none;
    color: #969696;
}
h1 {
	color: #969696;
	text-transform: capitalize;
	font-size: 1.3em;
	font-weight: normal;
	font-family: 'Anaheim', sans-serif;
}
h5 {
	color: #969696;
	text-transform: capitalize;
	font-size: 1em;
	font-weight: normal;
	font-family: 'Anaheim', sans-serif;
}

</style>
<script src="js/slides.min.jquery.js"></script>
<script>
		$(function(){
			$('#products').slides({
				preload: true,
				preloadImage: 'img/loading.gif',
				effect: 'slide, fade',
				crossfade: true,
				slideSpeed: 350,
				fadeSpeed: 500,
				generateNextPrev: true,
				generatePagination: false
			});
		});
	</script>
</head>
<body>
<div class="wrap">
<div class="header">
	<div class="logo">
		<h1><a href="index.html"><img src="img/logo.png" alt=""></a></h1>
	</div>
	<div class="h_right">
	<div class="drp-dwn">
		<ul>
		<li style="visibility:hidden"><h3 style="margin-left: 10px;">Currency :</h3></li>
			<li>	 	<select style="visibility:hidden" onchange="window.location=this.options[this.selectedIndex].value">
				<option value="">US Dollar-USD</option>
				<option value="">Euro-EUR</option>
				<option value="">Indian Rupee-INR</option>
			</select></li>
			<li><h3 style="visibility:hidden">Select your Language :</h3></li>
			<li>	 	<select style="visibility:hidden" onchange="window.location=this.options[this.selectedIndex].value">
				<option value="">English</option>
				<option value="">German</option>
				<option value="">French</option>
			</select></li>
			
		</ul>
	</div>
	<div class="header_top_right">
	   <c:if
				test="${sessionScope.username == null}">
	   <div class="login">
			   	   <span><a href="log"><img src="img/login.png" alt="" title="login"></a></span>
			   </div>
			   <div class="shopping_cart">
				    		<div class="cart_img" style="visibility: hidden;">
				    	
				    	</div>
						<div class="cart">
							<a href="reg" title="Register New User" rel="nofollow">
									<span class="cart_title">Register<span class="no_product"> (New User)</span></span>
								</a>
						</div>
				     </div>
			    </c:if>
			   <c:if
				test="${sessionScope.username != null}">
				<div class="login">
			   	   <span><a href="logout"><img src="img/login.png" alt="" title="logout"></a></span>
			   </div>
			    <div class="shopping_cart">
				    		<div class="cart_img" style="visibility: hidden;">
				    	
				    	</div>
						<div class="cart">
							<a href="profile" title="View My Profile" rel="nofollow">
									<span class="cart_title">Profile<span class="no_product">(${sessionScope.username })</span></span>
								</a>
						</div>
				     </div>
				 </c:if>
			 <div class="clear"></div>
		 </div>
	</div>
	<div class="clear"></div>
	<div class="h_main">
		<ul class="nav">
	        <li class="active"><a href="index">Home</a></li>
	        <li><a href="showSearch">Search</a></li>
	     </ul>
	     
	<div class="clear"></div>
	</div>
</div>
<div class="main">
<div class="main1">
<div class="details">
				  <div class="product-details">				
					<div class="images_3_of_2">
						<div id="container">
						   <div id="products_example">
							<div id="products">
								<div class="slides_container">
									<a href="image/${sessionScope.advert.image }" target="_blank"><img src="image/${sessionScope.advert.image }" alt=" " /></a>
									<a href="#" target="_blank"><img src="image/${sessionScope.advert.image }" /></a>
									<a href="#" target="_blank"><img src="image/${sessionScope.advert.image }" alt=" " /></a>
									<a href="#" target="_blank"><img src="image/${sessionScope.advert.image }" alt=" " /></a>
								</div>
								<ul class="pagination">
									<li><a href="#"><img src="image/${sessionScope.advert.image }" alt=" " /></a></li>
									<li><a href="#"><img src="image/${sessionScope.advert.image }" alt=" " /></a></li>
									<li><a href="#"><img src="image/${sessionScope.advert.image }" alt=" " /></a></li>
									<li><a href="#"><img src="image/${sessionScope.advert.image }" alt=" " /></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="desc span_3_of_2">
					<h2>${sessionScope.advert.title }</h2>
					<p style="color:white">${sessionScope.advert.mark } ${sessionScope.advert.model }</p>					
					<div class="price">
						<p style="color:white">Price: <span >${sessionScope.advert.price }</span> BGN</p>
					</div>
					<div class="available">
						<p>Advert Characteristics :</p>
					<ul class="bigFont">
						<li>Color:</li><a>${sessionScope.advert.color }</a>
						<li>Horse power:</li><a>${sessionScope.advert.horsePower }</a>
						<li>Year:</li><a>${sessionScope.advert.year }</a>
						<br><br>
						<li>Category:</li><a>${sessionScope.advert.category }</a>
						<li>Mileage:</li><a>${sessionScope.advert.mileage }</a>
						<li>Transmission type:</li><a>${sessionScope.advert.transmissionType }</a>
						<br><br>
						<li>Fuel Type:</li><a>${sessionScope.advert.fuelType }</a>
						<li>Body Type:</li><a>${sessionScope.advert.bodyType }</a>
						<li>Added on:</li><a>${sessionScope.advert.creationTime }</a>
					</ul>
					</div>
				<div class="share-desc">
					
					<div class="button1"><span><a href="downloadPdf.pdf" class="button button-rounded" >Export as Pdf</a></span></div>					
					<div class="clear"></div>
				</div>
				 
			</div>
			<div class="clear"></div>
		  </div>
		<div class="product_desc">	
			<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
				<ul class="resp-tabs-list">
					<li class="resp-tab-item resp-tab-active" aria-controls="tab_item-0" role="tab">Details</li>
					<li class="resp-tab-item" aria-controls="tab_item-2" role="tab">Comments</li>
					<div class="clear"></div>
				</ul>
				<div class="resp-tabs-container">
					<h2 class="resp-accordion resp-tab-active" role="tab" aria-controls="tab_item-0"><span class="resp-arrow"></span>Product Details</h2><div class="product-desc resp-tab-content resp-tab-content-active" style="display:block" aria-labelledby="tab_item-0">
						<h1>Description:</h1>
						<p>${sessionScope.advert.description }</p> </div>
				<h2 class="resp-accordion" role="tab" aria-controls="tab_item-2"><span class="resp-arrow"></span>Product Reviews</h2><div class="review resp-tab-content" aria-labelledby="tab_item-2">
					<h1>Comments:</h1> <br>
					<c:forEach var="comment" items="${advert.comments}">

					<h5><c:out value="${comment.user.username}"/> commented: </h5><br>
					<h5>	<c:out value="${comment.text}"/> 			</h5>
					<br>
						<br>
					</c:forEach>
					<c:if test="${ sessionScope.username == null }">
					<h1>To comment, please log in first</h1>
					</c:if>
					<c:if test="${ sessionScope.username != null }">
					<p>
				  	  <form class="form-custom" action="addComment" method="post" >
					    	<div>
						    	<h2>Write Your Own Comment?<span class="red"></h2>
						    	<span><textarea name="comment" id="comment" rows="4" cols="50" > </textarea></span>
						    </div>
						   <div>
						   		<span><input type="submit" value="Submit Comment"></span>
						  </div>
						  
					    </form>
					    </p>
					    </c:if>
				  	 </div>				
				</div>
			</div>
		 </div>
	 </div>
	    <script type="text/javascript">
    $(document).ready(function () {
        $('#horizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion           
            width: 'auto', //auto or any width like 600px
            fit: true   // 100% fit in a container
        });
    });
   </script>		
   <div class="content_bottom">
   	<div class="text-h1 top1 btm">
			<h2>Popular adverts</h2>
	  	</div>
 <div class="div2">
        <div id="mcts1">
        <c:forEach var="advert" items="${applicationScope.vipAdverts}"> 
        	<a href="advert?id=${advert.id }"><img src="image/${advert.image }" height="180" width="220" alt=""/></a>
           </c:forEach>
       </div>
	</div>
</div>
</div>
<div class="clear"></div>
</div>
</div>
<div class="footer">
	<div class="f_left">
		<div class="f_nav">
			<ul>
		        <li><a href="index">Home</a></li>
				<li><a href="showSearch">Search</a></li>
		     </ul>	
		</div>
		<div class="copy">
				<p class="w3-link">© All Rights Reserved | Design by&nbsp; <a href="index"> Car Mania Makers </a></p>
			</div>
		</div>
	<div class="social-icons">
	   		  	<ul>	
	 			  <li class="icon1"><a href="#" target="_blank"> </a></li>
			      <li class="icon2"><a href="#" target="_blank"> </a></li>
			      <li class="icon3"><a href="#" target="_blank"> </a></li>
			      <li class="icon4"><a href="#" target="_blank"> </a></li>	
			      
		     </ul>
	 </div>
	 <div class="clear"></div>
</div>
</div>
</body>
</html>