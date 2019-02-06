<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link  rel="stylesheet" href="<c:url value='/resources/css/form.css'></c:url>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">

<form action="<c:url value='/j_spring_security_check'></c:url>" method="post">
<table align="center">
<th colspan="2"><h2 align="center">Login</h2></th>

	<tr>
	<td></td>
	<td><span style="color:red">${loginError }</span>
		<span>${logoutSuccess }</span></td>
		<td></td>
	</tr>
	<tr>
       <td><label >Email Address</label></td>
       <td><input type="email" name="j_username" class="form-control"  aria-describedby="emailHelp" placeholder="Enter email"></td> 
   </tr>
   <tr>
   	<td></td>
   	<td><small class="form-text text-muted">We'll never share your email with anyone else.</small></td>
   </tr>

   <tr>
   <td><label >Password </label></td>
   <td><input type="password" name="j_password" class="form-control"  placeholder="Password"></td>
   </tr>
   
   <tr>
   <td colspan="2" align="center"><input type="submit" value="Login"></td>
   </tr> 
   
   <tr>
   	<td ></td>
   	<td align="left">Dont have Account? <a href="<c:url value='/all/getregistrationform'></c:url>">Sign Up</a> here</td>
   </tr> 
    
</table>
</form>

</div>

</body>
</html>