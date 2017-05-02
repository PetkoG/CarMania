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
.form-search textarea {
background: rgba(4, 5, 0, 0.3);
color: #969696;
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
    width:400px;
    margin-right:auto; margin-left:auto; border:1px solid #000;
    padding: 10px;
    position: relative;

}
</style>
<script>
window.onload = populateCategory;
function populateCategory(){	
	var category = [""];
	var select = document.getElementById("category");
	select.innerHTML = "";
	<c:forEach var="category" items="${applicationScope.catMarkModel}">
		category.push("${category.key}");
	</c:forEach>
	var size = category.length;
	
	
	for (var i = 0; i<size; i++){
		var newOption = document.createElement("option");
		newOption.value = category[i];
		newOption.innerHTML = category[i];
		select.appendChild(newOption);
	}
}
function populateMark(category, mark){
	var mark = [""];
	var select = document.getElementById("mark");
	var category = document.getElementById("category");
	select.innerHTML = "";
	<c:forEach var="entry" items="${applicationScope.catMarkModel}">
		if ("${entry.key}" == category.value){
			<c:forEach var="entry1" items="${entry.value}">
				mark.push("${entry1.key}");
			</c:forEach>
		}
	</c:forEach>
	var size = mark.length;
	for (var i = 0; i<size; i++){
		var newOption = document.createElement("option");
		newOption.value = mark[i];
		newOption.innerHTML = mark[i];
		select.appendChild(newOption);
	}
	
}

function populateBodyType(category,bodyType){
	var bodyType = [""];
	var select = document.getElementById("bodyType");
	var category = document.getElementById("category");
	select.innerHTML = "";
	<c:forEach var="entry" items="${applicationScope.catBody}">
	if ("${entry.key}" == category.value){
		<c:forEach var="entry1" items="${entry.value}">
			bodyType.push("${entry1}");
		</c:forEach>
	}
	</c:forEach>
	var size = bodyType.length;
	for (var i = 0; i<size; i++){
		var newOption = document.createElement("option");
		newOption.value = bodyType[i];
		newOption.innerHTML = bodyType[i];
		select.appendChild(newOption);
	}
}

function populateModel(){
	var model = [""];
	var mark = document.getElementById("mark");
	var category = document.getElementById("category");
	var select = document.getElementById("model");
	select.innerHTML = "";
	<c:forEach var="entry" items="${applicationScope.catMarkModel}">
		if ("${entry.key}" == category.value){
			<c:forEach var="entry1" items="${entry.value}">
				if ("${entry1.key}" == mark.value){
					<c:forEach var="entry2" items="${entry1.value}">
						model.push("${entry2}");
					</c:forEach>
				}
			</c:forEach>
		}
	</c:forEach>
	var size = model.length;
	for (var i = 0; i<size; i++){
		var newOption = document.createElement("option");
		newOption.value = model[i];
		newOption.innerHTML = model[i];
		select.appendChild(newOption);
	}
	
}
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
				<div class="mainDiv">
				<form action="addAdvert" method="post" class="form-search" enctype="multipart/form-data">
				<h1> Create Advert </h1>
				<h2>Title:</h2> <input type="text" name="title" id="title" size="100">
					<h2>Choose category:</h2> <select id="category" name="category"
						onchange="populateMark(this.id,'mark');populateBodyType(this.id,'bodyType')">
					</select>
					<hr />
					<h2>Choose Car mark:</h2> <select id="mark" name="mark"
						onchange="populateModel()">

					</select>&emsp;&emsp;&emsp; <h2>Choose Car model:</h2> <select id="model"
						name="model"></select>&emsp;&emsp;&emsp; <h2>Choose body type:</h2> <select
						id="bodyType" name="bodyType"></select>&emsp;&emsp; 
						<br> <h2>Choose transmission:</h2> <select name="transmissionType">
						<option value=""></option>
						<option value="manual">Manual</option>
						<option value="automatic">Automatic</option>
						<option value="semiautomatic">Semi-Automatic</option>
					</select>
					<hr />
					<h2>year of manufacture:</h2> <select name="year">
			<option value="2017">2017
			<option value="2016">2016
			<option value="2015">2015
			<option value="2014">2014
			<option value="2013">2013
			<option value="2012">2012
			<option value="2011">2011
			<option value="2010">2010
			<option value="2009">2009
			<option value="2008">2008
			<option value="2007">2007
			<option value="2006">2006
			<option value="2005">2005
			<option value="2004">2004
			<option value="2003">2003
			<option value="2002">2002
			<option value="2001">2001
			<option value="2000">2000
			<option value="1999">1999
			<option value="1998">1998
			<option value="1997">1997
			<option value="1996">1996
			<option value="1995">1995
			<option value="1994">1994
			<option value="1993">1993
			<option value="1992">1992
			<option value="1991">1991
			<option value="1990">1990
			<option value="1989">1989
			<option value="1988">1988
			<option value="1987">1987
			<option value="1986">1986
			<option value="1985">1985
			<option value="1984">1984
			<option value="1983">1983
			<option value="1982">1982
			<option value="1981">1981
			<option value="1980">1980
			<option value="1979">1979
			<option value="1978">1978
			<option value="1977">1977
			<option value="1976">1976
			<option value="1975">1975
			<option value="1974">1974
			<option value="1973">1973
			<option value="1972">1972
			<option value="1971">1971
			<option value="1970">1970
			<option value="1969">1969
			<option value="1968">1968
			<option value="1967">1967
			<option value="1966">1966
			<option value="1965">1965
			<option value="1964">1964
			<option value="1963">1963
			<option value="1962">1962
			<option value="1961">1961
			<option value="1960">1960
			<option value="1959">1959
			<option value="1958">1958
			<option value="1957">1957
			<option value="1956">1956
			<option value="1955">1955
			<option value="1954">1954
			<option value="1953">1953
			<option value="1952">1952
			<option value="1951">1951
			<option value="1950">1950
			<option value="1949">1949
			<option value="1948">1948
			<option value="1947">1947
			<option value="1946">1946
			<option value="1945">1945
			<option value="1944">1944
			<option value="1943">1943
			<option value="1942">1942
			<option value="1941">1941
			<option value="1940">1940
			<option value="1939">1939
			<option value="1938">1938
			<option value="1937">1937
			<option value="1936">1936
			<option value="1935">1935
			<option value="1934">1934
			<option value="1933">1933
			<option value="1932">1932
			<option value="1931">1931
			<option value="1930">1930
		</select>&emsp;&emsp;&emsp; <h2>Engine type:</h2> <select name="fuel">
						<option value=""></option>
						<option value="petrol">Petrol</option>
						<option value="diesel">Diesel</option>
						<option value="electric">Electric</option>
						<option value="hybrid">Hybrid</option>
					</select>&emsp;&emsp;&emsp; <h2>Color:</h2> <select name="color">
						<option value=""></option>
						<option value="white">white</option>
						<option value="red">red</option>
						<option value="blue">blue</option>
						<option value="black">black</option>
						<option value="rainbow">rainbow</option>
					</select>&emsp;&emsp;&emsp;

					<h2>Price:</h2><input type="text" name="priceText">&emsp;&emsp;&emsp;&emsp;
						<h2>Horse power:</h2><input type="text" name="hpText">&emsp;&emsp;&emsp;&emsp;
							<h2>Mileage:</h2> <input type="text" name="mileageText">&emsp;&emsp;&emsp;
								<h2>Description:</h2>
						<textarea name="description" rows="4" cols="50"></textarea>
						<h2>Do you want your advert to be VIP:</h2> <select name="vip">
						<option value="vip">Vip</option>
						<option value="normal">Normal</option>
					</select>
					<h2>Please upload photo:</h2>
					<input type="file" id="image" name="image" accept="image/*">
					<p align="center">
					<input type="submit" value="Add Advert">
					</p>

				</form>
			</div>
				€‹
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