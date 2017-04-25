<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page errorPage="error.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<style>
fieldset{
display:inline-block;
 background-color: PowderBlue;
box-shadow: 5px 5px 5px #888888;
width: full;
    height: full;
    border: 1px solid black;
    box-sizing: border-box;
    border-radius: 25px;
}

</style>
</head>
<body>
<c:set var="message" scope="session" value="${sessionScope.message}"/>
<a href="index"><img src="img/CarManiaLogo.jpg" alt="CARMANIA" style="width:128px;height:64px;"></a>

<form action="register" method="post">
  <fieldset>
  <b><c:if test="${(message != null && fn:contains(message, 'Successful'))}">
<c:out value="${ message }"></c:out></b>
</c:if>
     <h2>Registration</h2> 
      <b><c:if test="${(message != null && fn:contains(message, 'taken'))}">
<c:out value="${ message }"></c:out></b>
</c:if>
    <div class="control-group">
      <!-- Username -->
      <b><c:if test="${(message != null && fn:contains(message, 'username'))}">
<c:out value="${ message }"></c:out></b><br>
</c:if>
      <label class="control-label"  for="username">Username</label>
      <div class="controls">
        <input type="text" id="username" name="username" class="input-xlarge"><br><br>
        Please insert username with 5 or more symbols
      </div>
    </div>
 	<br>
    <div class="control-group">
      <!-- E-mail -->
      <b><c:if test="${(message != null && fn:contains(message, 'email'))}">
<c:out value="${ message }"></c:out></b><br>
</c:if>
      <label class="control-label" for="email">E-mail</label>
      <div class="controls">
        <input type="text" id="email" name="email" class="input-xlarge">
        <p class="help-block">Please provide your E-mail</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- Password-->
      <b><c:if test="${(message != null && fn:contains(message, 'password'))}">
<c:out value="${ message }"></c:out></b><br>
</c:if>
      <label class="control-label" for="password">Password</label>
      <div class="controls">
        <input type="password" id="password" name="password" class="input-xlarge">
        <p class="help-block">Password should be at least 8 characters</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- Password -->
      <label class="control-label"  for="password_confirm">Password (Confirm)</label>
      <div class="controls">
        <input type="password" id="password_confirm" name="password_confirm"  class="input-xlarge">
        <p class="help-block">Please confirm password</p>
      </div>
    </div>
    <div class="control-group">
      <!-- Password -->
      <b><c:if test="${(message != null && fn:contains(message, 'phone'))}">
<c:out value="${ message }"></c:out></b><br>
</c:if>
      <label class="control-label"  for="password_confirm">Phone Number</label>
      <div class="controls">
        <input type="text" id="phone" name="phone1"  class="input-xlarge">&emsp;;&emsp;
        <input type="text" id="phone" name="phone2"  class="input-xlarge">&emsp;;&emsp;
        <input type="text" id="phone" name="phone3"  class="input-xlarge">
        <p class="help-block">Enter up to 3 Phone Numbers</p>
      </div>
    </div>
    <div class="control-group">
      <!-- Years -->
      <b><c:if test="${(message != null && fn:contains(message, 'age'))}">
<c:out value="${ message }"></c:out></b><br>
</c:if>
      <label class="control-label"  for="age">Age</label>
      <div class="controls">
        <input type="text" id="age" name="age"class="input-xlarge">
        <p class="help-block">Enter age</p>
      </div>
    </div>
    <div class="control-group">
      <!-- Button -->
      <div class="controls">
        <input type="submit" value="REGISTER">
      </div>
    </div>
  </fieldset>
</form>

</body>
</html>