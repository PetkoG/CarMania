<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page errorPage="error.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
*{
font-size:110%;
}

.input{
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
div{
display:block;
 background-color: PowderBlue;
box-shadow: 5px 5px 5px #888888;
margin:auto;
width: 50%;
    height: full;
    border: 1px solid black;
    box-sizing: border-box;
    border-radius: 25px;
}
.back{
    position: absolute;
    right: 0px;
    width: 100px;
    height: 50px;
    background-color: red;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Profile</title>
</head>
<body>

<c:if test="${sessionScope.username == null}">

	<c:set var="message" scope="session" value="Not logged in, please log in!"/>

<c:redirect url="login" />
</c:if>
<a href="index"><img src="img/CarManiaLogo.jpg" alt="CARMANIA" style="width:128px;height:64px;"></a>
<div align="center">

<c:if test="${(message != null) }">
<c:out value="${message}"/>
</c:if>

<h3>PROFILE</h3>
<b>Username:</b> &emsp;${username}<br>
<b>Email:</b>&emsp;${email}<br>
<b>Age:</b>&emsp;${age}<br>
<b>Phone numbers:</b><br> 

<c:forEach var="phone" items="${sessionScope.phoneNumbers}">
	<c:out value="${phone}"/> <br>
</c:forEach>
<table>
<tr>
<th><form action="myAdverts" method="get">
	<button type="submit" class="input">My Adverts</button>
</form></th>
<th><form action="addAdvert" method="get">
	<button type="submit" class="input">Add Advert</button>
</form></th>
</tr>
</table>

<br>
</div>
</body>
</html>