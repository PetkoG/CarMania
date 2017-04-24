<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page errorPage="error.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.page{
font-size:115%;
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Results</title>
</head>
<body>
<a href="index"><img src="img/CarManiaLogo.jpg" alt="CARMANIA"
				style="width: 128px; height: 64px;"></a>
<h1 align="center">Found results</h1>



	<c:if test="${sessionScope.matched==null || sessionScope.matched.isEmpty()}">



	<br><br><h2 align="center">No results were found matching your criteria</h2>

</c:if>

<c:forEach var="advert" items="${sessionScope.matched}">
	<div class="adv" align="center">
	<img src="${applicationScope.imagePath}${advert.image}">
	<h2 align="center"><a href="advert?id=${advert.id}"><c:out value="${advert.title}"/> </a></h2>
		<p align="center"><b><c:out value="${advert.mark}"/> <c:out value="${advert.model}"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Price: <c:out value="${advert.price}"/> </b><br>
		<c:out value="${advert.fuelType}"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Year: <c:out value="${advert.year}"/> 
		</p>
	</div><br>
</c:forEach>
<div align="center" class="">
Page:
<c:set var="pg" scope="session" value="${sessionScope.maxPages }"/>
<c:forEach var="i" begin="1" end="${pg}">
   <a href="searchpage?page=<c:out value="${i}"/>"><c:out value="${i}"/></a>
</c:forEach>

</div>
<br><br><br><br><br><br>
</body>
</html>