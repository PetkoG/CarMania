<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page errorPage="error.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
html {
	font-size: 62.5%;
}
body {
	background-color: white;
	color: black;
	font-family: helvetica, arial, sans-serif;
	font-size: 1.4em; /* equiv 14px */
	line-height: 1.5; /* adapt to your design */
}
/* you shall not pass */
div, textarea, table, td, th, code, pre, samp {
	word-wrap: break-word;
}
.left {
    float: left;
}
.w50 {
    width: 50%;
}
.main{
background-color: PowderBlue;
box-shadow: 5px 5px 5px #888888;
width: full;
    height: 480px;
    border: 1px solid blue;
    box-sizing: border-box;
    border-radius: 25px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>
<c:out value="${sessionScope.advert.title}"/>
</title>
</head>
<body>
<a href="index"><img src="img/CarManiaLogo.jpg" alt="CARMANIA" style="width:128px;height:64px;"></a>
<div id="content" class="main">
	<div class="left w50">
		<h1 align="center"><c:out value="${sessionScope.advert.title}"/></h1>
		<div class="left w50" align="center">
			<h3 align="center"><c:out value="${sessionScope.advert.mark}"/> <c:out value="${sessionScope.advert.model}"/></h3>
			Category: <b> <c:out value="${sessionScope.advert.category}"/></b><br>
			Year: <b> <c:out value="${sessionScope.advert.year}"/> </b><br>
			Mileage: <b><c:out value="${sessionScope.advert.mileage}"/></b><br>
			Transmission type: <b><c:out value="${sessionScope.advert.transmissionType}"/></b><br>
		</div>
		<div class="left w50">
			<h3>Price: <c:out value="${sessionScope.advert.price}"/> bgn</h3>
			Body type: <b> <c:out value="${sessionScope.advert.bodyType}"/> </b><br>
			Horse power: <b><c:out value="${sessionScope.advert.horsePower}"/></b><br>
			Fuel type: <b> <c:out value="${sessionScope.advert.fuelType}"/> </b><br>
			Color: <b> <c:out value="${sessionScope.advert.color}"/> </b><br>
		</div>
	</div>
	<div class="left w50">
		<h1 align="center"></h1>
		<div class="left w50">
			<h2>For Contact</h2>
<c:set var="user" scope="session" value="${sessionScope.user}"/>
			
			<b>User: </b><c:out value="${user.username}"/> <br>
			<b>Email: </b><c:out value="${user.email}"/><br>
			<b>Tel.: </b><br>
	<c:forEach var="phone" items="${user.phoneNumbers}">
	<c:out value="${phone}"/> <br>
</c:forEach>

	<h3 align="center">Add comment</h3>

<c:if test="${ sessionScope.username == null }">


		<h3>to add comments, please log in first!</h3>
			<form action="log" method="post">
			<input type="submit" value="login">
			</form>
</c:if>
<c:if test="${ sessionScope.username != null }">

			<form action="addComment" method="post">
			<textarea rows="10" cols="30" name="comment"></textarea>
			<input type="hidden" value="<c:out value="${advert.id}"/>" name="advertId">
			<br><input type="submit" value="Submit comment">
			</form>
</c:if>
			
		</div>
		<div class="left w50">
			<h2 align="center">Comments</h2>
<c:forEach var="comment" items="${advert.comments}">

<b><c:out value="${comment.user.username}"/>: </b><br>
	<c:out value="${comment.text}"/> 			
<br>
	<br>
</c:forEach>
	<form action="downloadPdf.pdf">
	<input type="submit" value="Download This Advert As PDF"></form>
		</div>
	</div>
	
</div>
</body>
</html>