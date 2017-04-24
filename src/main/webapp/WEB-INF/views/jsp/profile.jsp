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
<link href='http://fonts.googleapis.com/css?family=Anaheim' rel='stylesheet' type='text/css'>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div class="wrap">
<div class="header">
	<div class="logo">
		<h1><a href="index.html"><img src="images/logo.png" alt=""></a></h1>
	</div>
	
	<div class="clear"></div>
	<div class="h_main">
		<ul class="nav">
	        <li class="active"><a href="index.html">Home</a></li>
	        <li><a href="maintain.html">Maintains</a></li>
	        <li><a href="repair.html">Repairs</a></li>
	        <li><a href="contact.html">Contact</a></li>
	     </ul>
	     
	<div class="clear"></div>
	</div>
</div>
<div class="main">
<div class="main1">
	<h2 class="hdr_s">PROFILE</h2><br>
	
	
	<div class="profileinfo">
		<b>Username:</b> ${username}<br> <b>Email:</b> ${email}<br>
		<b>Age:</b> ${age}<br> <b>Phone numbers:</b><br>

		<c:forEach var="phone" items="${phoneNumbers}">
			<c:out value="${phone}" />
			<br>
		</c:forEach>
		<table class="h_main">
			<tr>
				<th><form action="myadverts" method="post" class="nav">
						<button type="submit">My Adverts</button>
					</form></th>
				<th><form action="addAdvert.jsp" method="post" class="nav">
						<button type="submit">Add Advert</button>
					</form></th>
			</tr>
		</table>
   </div>
</div>
</div>
</div>
</body>
</html>