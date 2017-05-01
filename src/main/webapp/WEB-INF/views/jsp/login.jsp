<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script
	src="http://connect.facebook.net/en_US/all.js#xfbml=1&
      appId=YOUR_APP_ID"></script>
<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8&appId=1949657808598458";
		fjs.parentNode.insertBefore(js, fjs);

	}(document, 'script', 'facebook-jssdk'));
	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}
	function test(){
		document.getElementById('id').value = "Hello";
	}
	function statusChangeCallback(response) {
		console.log('statusChangeCallback');
		console.log(response);
		document.getElementById('id').value = "Hello, "
			+ response.first_name + ' ' + response.last_name + ',';
		if (response.status === 'connected') {
			FB.api('/me', {
				fields : 'first_name,last_name,email'
			}, function(response) {
				document.getElementById('id').value = "Hello, "
						+ response.first_name + ' ' + response.last_name + ',';
				$.get("register", {
					first_name : response.first_name,
					last_name : response.last_name,
					email : response.email,
				}, function(result) {
					window.location.href = "index";
				});
			});

		} else {
			// The person is not logged into your app or we are unable to tell.
			document.getElementById('id').value = 'Please log '
					+ 'into this app.';
		}
	}
	window.fbAsyncInit = function() {
		FB.init({
			appId : '1949657808598458',
			xfbml : true,
			version : 'v2.8'
		});
		FB.AppEvents.logPageView();
	};
	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});
</script>
</head>
<body>
<div id="fb-root"></div>
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
	     <div hidden="true" class="search">
	    	<form>
	    		<input type="text" value="">
	    		<input type="submit" value="">
	    	</form>
		</div>
	<div class="clear"></div>
	</div>
</div>
<div class="main">
<div class="main1">
				<form action="login" method="post" class="form-4">
				    <h1>Login</h1>
				    <p>
				    ${sessionScope.message }
				    </p>	
				    <p>
				        <label for="login">Username or email</label>
				        <input type="text" id="username" name="username" placeholder="Username" required>
				    </p>
				    <p>
				        <label for="password">Password</label>
				        <input type="password" id="password" name='password' placeholder="Password" required> 
				    </p>

				    <p  align="center">
				        <input type="submit" name="submit" value="Continue">
				    </p>       
				    <br>
				    <p align="center">
				     <span><fb:login-button size="large" scope="public_profile,email"
						perms="user_address,user_mobile_phone"
						onlogin="checkLoginState();" onclick="test();">
						</fb:login-button></span>
						</p>
						<input type="text" style="background-color:transparent;border:none" id="id"/>
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