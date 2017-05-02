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
<style>
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
.form-search input[type=text], .form-search select {
    width: 100%;
    padding: 2px 4px;
    margin: 4px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    font-family: 'Anaheim', sans-serif;
    text-shadow: 0 1px 0 rgba(4, 4, 0, 0.4);
    background: rgba(4, 5, 0, 0.3);
    color: #969696;
}
.form-search select option {
    margin: 4px;
    background: rgba(4, 5, 0, 0.3);
    color: black;
    text-shadow: 0 1px 0 rgba(0, 0, 0, 0.4);
}	
.form-search h1 {
	color: #969696;
	text-transform: capitalize;
	font-size: 2em;
	font-weight: normal;
	font-family: 'Anaheim', sans-serif;
	margin-bottom: 6%;
}
.form-search h2 {
	color: #969696;
	text-transform: capitalize;
	font-size: 1em;
	font-weight: normal;
	font-family: 'Anaheim', sans-serif;
}
.form-search {
    width:700px;
    margin-right:auto; margin-left:auto; border:1px solid #000;
    padding: 10px;
    position: relative;
	display: compact;
}
</style>
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
				<div>

			
			<div class="mainDiv">
				<form action="search" method="get" class="form-search">
				<h1> Choose Your vehicle </h1>
				  	<table width="700" cellspacing="200" cellpadding="200" border="1" style="margin: auto;">
        					<tbody>
          						<tr>
          						 	<td>
          						 		<h2>Choose category:</h2> <select id="category" name="category"
											onchange="populateMark(this.id,'mark');populateBodyType(this.id,'bodyType')">
										</select>
          						 	</td>
          						 	<td>
          						 	<h2>Choose Car mark:</h2> <select id="mark" name="mark"
						onchange="populateModel()">
								</select>
          						 	</td>
          						 			</tr>
          						 	<tr> <td> <h2>Choose Car model:</h2> <select id="model"
						name="model"></select> </td>
          						 			<td> <h2>Choose body type:</h2> <select
						id="bodyType" name="bodyType"></select> </td> </tr>
          						 	<tr> 	<td> <h2>Choose transmission:</h2> <select name="transType">
						<option value=""></option>
						<option value="manual">Manual</option>
						<option value="automatic">Automatic</option>
						<option value="semiautomatic">Semi-Automatic</option>
					</select> </td>
          						 			<td> <h2>Engine type:</h2> <select name="fuelType">
						<option value=""></option>
						<option value="petrol">Petrol</option>
						<option value="diesel">Diesel</option>
						<option value="electric">Electric</option>
						<option value="hybrid">Hybrid</option>
					</select></td> </tr>
          						 	<tr> 	<td> <h2>Year of manufacture from:</h2> <select name="yearFrom">
						<option value=""></option>
						<option value="1980">from 1980</option>
						<option value="1990">from 1990</option>
						<option value="2000">from 2000</option>
						<option value="2010">from 2010</option>
					</select> </td>
          						 			<td><h2>To</h2>
					<select name="yearTo">
						<option value=""></option>
						<option value="1980">to 1980</option>
						<option value="1990">to 1990</option>
						<option value="2000">to 2000</option>
						<option value="2010">to 2010</option>
						<option value="2017">to 2017</option>
					</select> </td> </tr>
          						 	<tr> 	<td> <h2>Color:</h2> <select name="color">
						<option value=""></option>
						<option value="white">white</option>
						<option value="red">red</option>
						<option value="blue">blue</option>
						<option value="black">black</option>
						<option value="rainbow">rainbow</option>
					</select> </td>
          						 			<td> <h2>Max mileage:</h2> <select name="maxMileage">
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
					</select> </td>
          						</tr>
          						
          						<tr> 	<td><h2>Price from:</h2> <input type="text"
						name="priceFrom"> </td>
          						 			<td> <h2>To</h2> <input type="text" name="priceTo"> </td>
          						</tr>
          						
          						<tr> 	<td> <h2> Horse power from:</h2> <input type="text" name="hpFrom"> </td> 
          						 			<td><h2>To</h2> <input
						type="text" name="hpTo"> </td>
          						</tr>
          						<tr> 	<td> <h2>Sort by:</h2> <select name="sortBy">
						<option value="mark">Mark</option>
						<option value="price">Price</option>
						<option value="mileage">Mileage</option>
						<option value="year">Date of Manufacture</option>
						<option value="creation">Newest adverts</option>
					</select></td>
          						</tr>
          					</tbody>
          			</table>
					
					
					 
					
					<p align="center">
					<input type="submit" name="submit" value="Search">
					</p>

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