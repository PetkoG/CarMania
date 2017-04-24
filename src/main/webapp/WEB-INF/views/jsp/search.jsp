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
	<script>
	window.onload = populateCategory;
	function populateCategory() {
		var category = [ "" ];
		var select = document.getElementById("category");
		select.innerHTML = "";
		<c:forEach var="category" items="${applicationScope.catMarkModel}">
		category.push("${category.key}");
		</c:forEach>
		var size = category.length;

		for (var i = 0; i < size; i++) {
			var newOption = document.createElement("option");
			newOption.value = category[i];
			newOption.innerHTML = category[i];
			select.appendChild(newOption);
		}
	}
	function populateMark(category, mark) {
		var mark = [ "" ];
		var select = document.getElementById("mark");
		var category = document.getElementById("category");
		select.innerHTML = "";
		<c:forEach var="entry" items="${applicationScope.catMarkModel}">
		if ("${entry.key}" == category.value) {
			<c:forEach var="entry1" items="${entry.value}">
			mark.push("${entry1.key}");
			</c:forEach>
		}
		</c:forEach>
		var size = mark.length;
		for (var i = 0; i < size; i++) {
			var newOption = document.createElement("option");
			newOption.value = mark[i];
			newOption.innerHTML = mark[i];
			select.appendChild(newOption);
		}

	}
	function populateBodyType(category, bodyType) {
		var bodyType = [ "" ];
		var select = document.getElementById("bodyType");
		var category = document.getElementById("category");
		select.innerHTML = "";
		<c:forEach var="entry" items="${applicationScope.catBody}">
		if ("${entry.key}" == category.value) {
			<c:forEach var="entry1" items="${entry.value}">
			bodyType.push("${entry1}");
			</c:forEach>
		}
		</c:forEach>
		var size = bodyType.length;
		for (var i = 0; i < size; i++) {
			var newOption = document.createElement("option");
			newOption.value = bodyType[i];
			newOption.innerHTML = bodyType[i];
			select.appendChild(newOption);
		}
	}
	function populateModel() {
		var model = [ "" ];
		var mark = document.getElementById("mark");
		var category = document.getElementById("category");
		var select = document.getElementById("model");
		select.innerHTML = "";
		<c:forEach var="entry" items="${applicationScope.catMarkModel}">
		if ("${entry.key}" == category.value) {
			<c:forEach var="entry1" items="${entry.value}">
			if ("${entry1.key}" == mark.value) {
				<c:forEach var="entry2" items="${entry1.value}">
				model.push("${entry2}");
				</c:forEach>
			}
			</c:forEach>
		}
		</c:forEach>
		var size = model.length;
		for (var i = 0; i < size; i++) {
			var newOption = document.createElement("option");
			newOption.value = model[i];
			newOption.innerHTML = model[i];
			select.appendChild(newOption);
		}

	}
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
	        <li class="active"><a href="index.html">Home</a></li>
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
<div class="main">
<div class="main1">
				<div>

			<h1 style="color:pink;">Choose Your vehicle</h1>
			<div class="mainDiv">
				<form action="search" method="get" class="form">
					Choose category: <select id="category" name="category"
						onchange="populateMark(this.id,'mark');populateBodyType(this.id,'bodyType')">
					</select>
					<hr />
					Choose Car mark: <select id="mark" name="mark"
						onchange="populateModel()">

					</select>&emsp;&emsp;&emsp; Choose Car model: <select id="model"
						name="model"></select>&emsp;&emsp;&emsp; Choose body type: <select
						id="bodyType" name="bodyType"></select>&emsp;&emsp; 
						<br> Choose transmission: <select name="transType">
						<option value=""></option>
						<option value="manual">Manual</option>
						<option value="automatic">Automatic</option>
						<option value="semiautomatic">Semi-Automatic</option>
					</select>
					<hr />
					year of manufacture: <select name="yearFrom">
						<option value=""></option>
						<option value="1980">from 1980</option>
						<option value="1990">from 1990</option>
						<option value="2000">from 2000</option>
						<option value="2010">from 2010</option>
					</select> <select name="yearTo">
						<option value=""></option>
						<option value="1980">to 1980</option>
						<option value="1990">to 1990</option>
						<option value="2000">to 2000</option>
						<option value="2010">to 2010</option>
						<option value="2017">to 2017</option>
					</select>&emsp;&emsp;&emsp; Engine type: <select name="fuelType">
						<option value=""></option>
						<option value="petrol">Petrol</option>
						<option value="diesel">Diesel</option>
						<option value="electric">Electric</option>
						<option value="hybrid">Hybrid</option>
					</select>&emsp;&emsp;&emsp; Color: <select name="color">
						<option value=""></option>
						<option value="white">white</option>
						<option value="red">red</option>
						<option value="blue">blue</option>
						<option value="black">black</option>
						<option value="rainbow">rainbow</option>
					</select>&emsp;&emsp;&emsp;

					<hr />
					Price:&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					&emsp;&emsp;&emsp;&emsp;&emsp; Horse power:<br> from <input type="text"
						name="priceFrom"> to <input type="text" name="priceTo">&emsp;|&emsp;
					from <input type="text" name="hpFrom"> to <input
						type="text" name="hpTo">
					<hr />
					Max mileage: <select name="maxMileage">
						<option value=""></option>
						<option value="10000">to 10000</option>
						<option value="20000">to 20000</option>
						<option value="30000">to 30000</option>
						<option value="40000">to 40000</option>
						<option value="50000">to 50000</option>
						<option value="100000">to 100000</option>
						<option value="120000">to 120000</option>
						<option value="140000">to 140000</option>
						<option value="160000">to 160000</option>
						<option value="180000">to 180000</option>
						<option value="200000">to 200000</option>
					</select>&emsp;&emsp;&emsp; Sort by: <select name="sortBy">
						<option value="mark">Mark</option>
						<option value="price">price</option>
						<option value="mileage">mileage</option>
						<option value="year">date of manufacture</option>
						<option value="creation">Newest adverts</option>
					</select>&emsp;&emsp;&emsp; <input type="hidden" value="1" name="page">
					<input type="submit" name="submit" value="Search">

				</form>
			</div>
		</div>€‹
</div>
</div>
<div class="footer">
	<div class="f_left">
		<div class="f_nav">
			<ul>
		        <li><a href="index">Home</a></li>
				<li><a href="">Search</a></li>
				<li><a href="">Categories</a></li>
				<li><a href="">More</a></li>
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