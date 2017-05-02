<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>The Auto-Tuning Website Template | Maintains :: w3layouts</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link href='http://fonts.googleapis.com/css?family=Anaheim' rel='stylesheet' type='text/css'>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<style>
h3 {
	color: #FF3760;
	text-transform: capitalize;
	font-size: 1em;
	font-weight: normal;
	font-family: 'Anaheim', sans-serif;
	margin-bottom: 6%;
}
h2 {
	color: #969696;
	text-transform: capitalize;
	font-size: 1.3em;
	font-weight: normal;
	font-family: 'Anaheim', sans-serif;
}

input[type=submit] {
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
.form-custom {
   width: 26%;
    margin: -30px auto 0px;
    padding: -50px;
    position: relative;

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
<div class="main">
<div class="main1">
	<div class="profileinfo">
		<div class="form-4">
			<h1 align="center" class="hdr_s">Profile</h1>
			<h2>Username:</h2><h3> ${username}</h3> <h2>Email:</h2> <h3> ${email} </h3>
			<h2>Age:</h2> <h3>${age}<br></h3><h2>Phone numbers:</h2>

			<c:forEach var="phone" items="${phoneNumbers}">
				<h3><c:out value="${phone}" /></h3>
			</c:forEach>
		</div>
		<form action="myAdverts" method="get" class="form-4"  >
			<input type="submit" value="My Adverts" ></input>
		</form>
		<form action="addAdvert" class="form-custom">
			<input type="submit" value="Add Advert" ></input>
		</form>
		<br><br>
		<c:if test="${(message != null && fn:contains(message, 'password'))}">
						<c:out value="${ message }"></c:out></b>
					</c:if>
		<form action="changePass" class="form-custom">
			<input type="text" name="newPass" placeholder="Please enter your new Password" ></input>
			<input type="submit" value="Change Password" ></input>
		</form>
   </div>
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
</body>
</html>