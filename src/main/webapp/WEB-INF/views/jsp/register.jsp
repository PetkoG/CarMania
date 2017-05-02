<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page errorPage="error.jsp"%>

<!DOCTYPE HTML>
<html>
<head>
<title>The Auto-Tuning Website Template | 404 :: w3layouts</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Anaheim' rel='stylesheet' type='text/css'>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
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
				<form action="register" method="post" class="form-4">
				    <h1>Register User</h1>
				    <p>
				   <c:if test="${(message != null && fn:contains(message, 'Successful'))}">
					<b>	<c:out value="${ message }"></c:out></b>	
					</c:if>
					<c:if test="${(message != null && fn:contains(message, 'taken'))}">
						<c:out value="${ message }"></c:out></b>
					</c:if>
				    </p>
				    <h2 style="color:pink;">Username:</h2>	
				    <p>
				   <c:if test="${(message != null && fn:contains(message, 'username'))}">
						<c:out value="${ message }"></c:out></b>
					</c:if>
				    </p>
				    <p>
				        <label for="login">Username</label>
				        <input type="text" id="username" name="username" placeholder="Please enter desired username" required>
				    </p>
				    <h2 style="color:pink;">E-mail:</h2>
				    <p>
				   <c:if test="${(message != null && fn:contains(message, 'email'))}">
						<c:out value="${ message }"></c:out></b>
					</c:if>
				    </p>
				     <p>
				        <label for="email">E-mail</label>
				        <input type="text" id="email" name="email" placeholder="Please enter your correct E-mail" required>
				    </p>
				    <h2 style="color:pink;">Password:</h2>
				    <p>
				   <c:if test="${(message != null && fn:contains(message, 'password'))}">
						<c:out value="${ message }"></c:out></b>
					</c:if>
				    </p>
				    <p>
				        <label for="password">Password</label>
				        <input type="password" id="password" name='password' placeholder="Please enter at least 8 letter password" required> 
				    </p>
				    <p>
				        <label for="password">Password</label>
				        <input type="password" id="password2" name='password_confirm' placeholder="Please repeat your password" required> 
				    </p>
				    <h2 style="color:pink;">Phones:</h2>
				    <p>
				   <c:if test="${(message != null && fn:contains(message, 'phone'))}">
						<c:out value="${ message }"></c:out></b>
					</c:if>
				    </p>
				    <p>
				        <label for="phone">Phone</label>
				        <input type="text" id="phone" name='phone1' placeholder="Please enter phone #1" required> 
				        <input type="text" id="phone" name='phone2' placeholder="Please enter phone #2 (Optional)">
				        <input type="text" id="phone" name='phone3' placeholder="Please enter phone #3 (Optional)">
				    </p>
				    <h2 style="color:pink;">Age:</h2>
				    <p>
				   <c:if test="${(message != null && fn:contains(message, 'age'))}">
						<c:out value="${ message }"></c:out></b>
					</c:if>
				    </p>
				     <p>
				        <label for="login">Age</label>
				        <input type="text" id="age" name="age" placeholder="Please enter your age" required>
				    </p>

				    <p  align="center">
				        <input type="submit" name="submit" value="Continue">
				    </p>       
				    <br>
				</form>€‹
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
				<p class="w3-link">© All Rights Reserved | Design by&nbsp; <a href="index"> Car Mania Makers</a></p>
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