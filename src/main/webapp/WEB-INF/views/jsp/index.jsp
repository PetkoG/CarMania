<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="error.jsp"%>

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
			<li><h3>Select ur Language :</h3></li>
			<li>	 	<select onchange="window.location=this.options[this.selectedIndex].value">
				<option value="">English</option>
				<option value="">German</option>
				<option value="">French</option>
			</select></li>
			<li><h3 style="margin-left: 10px;">Currency :</h3></li>
			<li>	 	<select onchange="window.location=this.options[this.selectedIndex].value">
				<option value="">US Dollar-USD</option>
				<option value="">Euro-EUR</option>
				<option value="">Indian Rupee-INR</option>
			</select></li>
		</ul>
	</div>
	<div class="header_top_right">
	   <div class="login">
			   	   <span><a href="/MyProject/log"><img src="img/login.png" alt="" title="login"></a></span>
			   </div>
			   			    <div class="shopping_cart">
				    		<div class="cart_img" style="visibility: hidden;">
				    	
				    	</div>
						<div class="cart">
							<a href="profile" title="View my shopping cart" rel="nofollow">
									<span class="cart_title">Profile<span class="no_product">(${sessionScope.username })</span></span>
								</a>
						</div>
				     </div>
			 <div class="clear"></div>
		 </div>
	</div>
	<div class="clear"></div>
	<div class="h_main">
		<ul class="nav">
	        <li class="active"><a href="index">Home</a></li>
	        <li><a href="maintain.html">Search</a></li>
	        <li><a href="repair.html">Categories</a></li>
	        <li><a href="contact.html">More</a></li>
	     </ul>
	     <div class="search">
	    	<form>
	    		<input type="text" value="">
	    		<input type="submit" value="">
	    	</form>
		</div>
	<div class="clear"></div>
	</div>
</div>
<div class="container">
	<section id="dg-container" class="dg-container">
			<div class="dg-wrapper" id="gallery">
			<c:forEach var="i" begin="1" end="5">
  				
			</c:forEach>
					<a href="#"><img src="img/Ceca.jpeg" alt="image1" height="360" width="480"/></a>
					<a href="#"><img src="img/CarManiaLogo.jpg" alt="image2" height="360" width="480"/></a>
					<a href="#"><img src="file:\\C:\Users\Petko\Desktop\CarManiaImages\1.jpeg" alt="image3" /></a>
					<a href="#"><img src="images/4.jpg" alt="image4" /></a>
					<a href="#"><img src="images/5.jpg" alt="image5" /></a>
					<a href="#"><img src="images/6.jpg" alt="image1" /></a>
					<a href="#"><img src="images/7.jpg" alt="image2" /></a>
					<a href="#"><img src="images/8.jpg" alt="image3" /></a>
			</div>
	</section>
</div>
<div class="main">
	<div class="section group">
		<div class="grid_1_of_4 images_1_of_4">
			  <a href="details.html"><img src="images/pic1.jpg"></a>
			   <a href="details.html"><h3>Lorem Ipsum is</h3></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			  <a href="details.html"><img src="images/pic3.jpg"></a>
			  <a href="details.html"><h3>Lorem is simply </h3></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			  <a href="details.html"><img src=".pic2.jpg"></a>
			  <a href="details.html"><h3>Lorem Ipsum is</h3></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			  <a href="details.html"><img src="images/pic4.jpg"></a>
			  <a href="details.html"><h3>Lorem is simply </h3></a>
		</div>
		<div class="clear"></div>
	</div>
	<div class="section group btm">
		<div class="grid_1_of_4 images_1_of_4">
			  <a href="details.html"><img src="images/pic5.jpg"></a>
			  <a href="details.html"><h3>Lorem Ipsum is</h3></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			  <a href="details.html"><img src="images/pic6.jpg"></a>
			  <a href="details.html"><h3>Lorem is simply </h3></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			  <a href="details.html"><img src="images/pic7.jpg"></a>
			  <a href="details.html"><h3>Lorem Ipsum is</h3></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			  <a href="details.html"><img src="images/pic8.jpg"></a>
			  <a href="details.html"><h3>Lorem is simply </h3></a>
		</div>
			<div class="clear"></div>
		</div>
</div>
<div class="footer">
	<div class="f_left">
		<div class="f_nav">
			<ul>
		        <li><a href="">Home</a></li>
				<li><a href="">Search</a></li>
				<li><a href="">Categories</a></li>
				<li><a href="">More</a></li>
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