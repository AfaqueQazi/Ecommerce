<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		$('#form').validate({
			rules:{
				"apartmentnumber":{required:true},
				"streetname":{required:true},
				"state":{required:true},
				"city":{required:true},
				"country":{required:true},
				"zipcode":{required:true,number:true}
			}
		})
	})
</script>
</head>
<style>
input[type=submit] {
  width: 20%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>
<body>
<div class="container">
<c:url var="url" value="/cart/createorder"></c:url>
<form:form modelAttribute="shippingaddress" action="${url }" id="form">

<p align="center"><b>Shipping Address</b></p>	
<form:hidden path="shippingId"/>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="apartmentnumber" class="control-label">Apartmentnumber</form:label>
</div>
<div class="col-sm-5">
<form:input path="apartmentnumber" class="form-control" placeholder="Enter Appartment Number" id="apartmentnumber"/><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="streetname" class="control-label">Streetname</form:label>
</div>
<div class="col-sm-5">
<form:input path="streetname" class="form-control" placeholder="Enter Street Name" id="streetname"/><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="city" class="control-label">City</form:label>
</div>
<div class="col-sm-5">
<form:input path="city" class="form-control" placeholder="Enter City"  id="city"/><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="state" class="control-label">State</form:label>
</div>
<div class="col-sm-5">
<form:input path="state" class="form-control" placeholder="Enter State" id="state"/><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="country" class="control-label">Country</form:label>
</div>
<div class="col-sm-5">
<form:input path="country" class="form-control" placeholder="Enter Country" id="country"/><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="zipcode" class="control-label">Zipcode</form:label>
</div>
<div class="col-sm-5">
<form:input path="zipcode" type="number" class="form-control" placeholder="Enter Zipcode" id="zipcode"/><br/>
</div>
</div>
<div class="row" align="center">
<input type="submit" value="Confirm Your Order">
</div>
</form:form>
</div>
</body>
</html>
