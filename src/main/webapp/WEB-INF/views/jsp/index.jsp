<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="error.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
<title>The Auto-Tuning Website Template | Home :: w3layouts</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Anaheim' rel='stylesheet' type='text/css'>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--slider-->
<script type="text/javascript" src="js/modernizr.custom.53451.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.gallery.js"></script>
<script type="text/javascript">
		$(function() {
		$('#dg-container').gallery({
		autoplay	:	true
	});
});
</script>
<style>
.container h2 {
	color: #969696;
	text-transform: capitalize;
	font-size: 2em;
	font-weight: normal;
	font-family: 'Anaheim', sans-serif;
	margin-top: -5%;
	margin-bottom: 2%;
}

.main h2 {
	color: #969696;
	text-transform: capitalize;
	font-size: 2em;
	font-weight: normal;
	font-family: 'Anaheim', sans-serif;
	margin-top: -3%;
	margin-bottom: 2%;
}
</style>

</head>
<body>
<div class="wrap">
<div class="header">
	<div class="logo">
		<h1><a href="index"><img src="img/logo.png" alt=""></a></h1>
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
<div class="container">
<h2 align="center">Some fresh VIP Adverts:</h2>
	<section id="dg-container" class="dg-container">
			<div class="dg-wrapper" id="gallery">
			<c:forEach var="advert" items="${applicationScope.vipAdverts}">
  				<a href="advert?id=${advert.id }"><img src="image/${advert.image }" alt="Image of advert ${advert.id }" height="360" width="480"/></a>
			</c:forEach>
			</div>
	</section>
</div>
<div class="main">
<h2 align="center"> Some More Hot Adverts:</h2>
<div class="section group">
	<c:forEach var="advert" items="${applicationScope.vipAdverts}" begin="0" end="3"> 
	<div class="grid_1_of_4 images_1_of_4">
			  <a href="image/${advert.image }"><img src="image/${advert.image }" height="180" width="220"></a>
			   <a href="advert?id=${advert.id }"><h2 style="color:white">${ advert.mark } </h2><h2 style="color:white">${ advert.model } </h2><h3>${advert.description }</h3></a>
		</div>
	</c:forEach>
		<div class="clear"></div>
	</div>
	<div class="section group btm">
		<c:forEach var="advert" items="${applicationScope.vipAdverts}" begin="4" end="7"> 
	<div class="grid_1_of_4 images_1_of_4">
			  <a href="image/${advert.image }"><img src="image/${advert.image }" height="180" width="220"></a>
			   <a href="advert?id=${advert.id }"><h2 style="color:white">${ advert.mark } </h2><h2 style="color:white">${ advert.model } </h2><h3>${advert.description }</h3></a>
		</div>
	</c:forEach>
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
			      <div class="clear"></div>
		     </ul>
	 </div>
	 <div class="clear"></div>
</div>
</div>
</body>
</html>