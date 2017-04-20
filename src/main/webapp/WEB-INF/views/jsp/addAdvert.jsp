<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page errorPage="error.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.back {
	position: absolute;
	right: 0px;
	width: 100px;
	background-color: red;
}
.main {
background-color: PowderBlue;
box-shadow: 5px 5px 5px #888888;
width: 1000px;
    height: 100%;
    border: 1px solid black;
    box-sizing: border-box;
    padding: 15px 30px; 
    border-radius: 25px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create your advert</title>
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
	<c:if test="${sessionScope.username == null}">

	<c:set var="message" scope="session" value="Not logged in, please log in!" />

<c:redirect url="index" />
</c:if>

	<a href="index"><img src="img/CarManiaLogo.jpg" alt="CARMANIA"
		style="width: 128px; height: 128px;"></a>
	<form action="profile" method="get">
		<button type="submit" class="back">Back to profile</button>
	</form>
	<h2>Create your advert</h2>
<c:set var="message" scope="session" value="${sessionScope.message }"/>
<c:if test="${(message != null) }">
<c:out value="${message}"/>
</c:if>
	<div class="main">
	<form action="addAdvert" method="post" enctype="multipart/form-data">
		Title: <input name="title" size="100">
		<hr />
		Choose category: <select id="category" name="category" onchange="populateMark(this.id,'mark');populateBodyType(this.id,'bodyType')">
			
		</select>
		<hr />
		Choose Car mark: <select id="mark" name="mark" onchange="populateModel(this.id,'model')">

		</select>&emsp;&emsp;&emsp; Choose Car model: <select id="model" name="model"></select>&emsp;&emsp;&emsp;
		Choose body type: <select id="bodyType" name="bodyType"></select>&emsp;&emsp;
		Choose transmission: <select name="transmissionType">
			<option value="manual">Manual</option>
			<option value="automatic">Automatic</option>
			<option value="semiautomatic">Semi-Automatic</option>
		</select>
		<hr />
		year of manufacture: <select name="year">
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
		</select> Engine type: <select name="fuel">
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
		Price:<input type="text" name="priceText">&emsp;&emsp;&emsp;&emsp;
		Horse power:<input type="text" name="hpText">&emsp;&emsp;&emsp;&emsp;
		Mileage: <input type="text" name="mileageText">&emsp;&emsp;&emsp;
		<hr />
		<textarea name="description" rows="4" cols="50"></textarea>
		<input type="file" id="image" name="image" accept="image/*">
		<input type="submit" value="CREATE ADVERT">

	</form>
	</div>
</body>
</html>