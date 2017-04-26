<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page errorPage="error.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My adverts</title>
<style>
.page{
font-size:115%;
}
.inp{
padding: 10px 10px 10px !important;
font-size: 18px !important;
background-color: DeepSkyBlue;
font-weight: bold;
text-shadow: 1px 1px red;
color: black;
border-radius: 100px;
-moz-border-radius: 100px;
-webkit-border-radius: 100px;
border: 1px solid #F36C8C;
cursor: pointer;
box-shadow: 0 1px 0 rgba(255, 255, 255, 0.5) inset;
-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.5) inset;
-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.5) inset;
}

.adv {
	border-radius: 25px;
	box-shadow: 5px 5px 5px #888888;
    background-color: PowderBlue;
    margin: auto;
    width: 50%;
    border: 1px;
    padding: 10px;
    font-size:100%;
}
</style>
</head>
<body>
<c:set var="message" scope="session" value="${sessionScope.message }"/>


<c:if test="${sessionScope.username == null}">

	<c:set var="message" scope="session" value="Not logged in, please log in!"/>

<c:redirect url="login" />

</c:if>


	<c:if test="${sessionScope.myAdverts.isEmpty()}">
	<br><br><h2 align="center">You have no adverts yet! to create, <a href="addAdvert">click here</a></h2>
</c:if>





<a href="index"><img src="img/CarManiaLogo.jpg" alt="CARMANIA" style="width:128px;height:64px;"></a>
<h1 align="center">My adverts</h1>

<c:forEach var="advert" items="${myAdverts}">
	<div class="adv" align="center">
		<h2 align="center"><a href="advert?id=${advert.id}">${advert.title}</a></h2>
		<p align="center"><b><c:out value="${advert.mark}"/> <c:out value="${advert.model}"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Price: <c:out value="${advert.price}"/> </b><br>
		<c:out value="${advert.fuelType}"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Year: <c:out value="${advert.year}"/> 
		</p>
		<form action="deleteAdvert" method="post">
		<input type="hidden" value="${advert.id}" name="advertId">
		<input type="submit" value="delete advert" class="inp">
		</form>
	</div><br>
</c:forEach>



</body>
</html>