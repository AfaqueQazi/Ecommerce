<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<c:url value='/resources/css/registrationform.css'></c:url>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"
		src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
		<link  rel="stylesheet" href="<c:url value='/resources/css/formerror.css'></c:url>">
<script type="text/javascript">
function fillShippingAddress(form){
	if(form.checkbox.checked==true){
		//Copy from billingaddress and assign to shippingaddress
		form["shippingAddress.apartmentnumber"].value=form["billingAddress.apartmentnumber"].value
		form["shippingAddress.streetname"].value=form["billingAddress.streetname"].value
		form["shippingAddress.city"].value=form["billingAddress.city"].value
		form["shippingAddress.state"].value=form["billingAddress.state"].value
		form["shippingAddress.country"].value=form["billingAddress.country"].value
		form["shippingAddress.zipcode"].value=form["billingAddress.zipcode"].value
	}
	else{
		form["shippingAddress.apartmentnumber"].value=""
		form["shippingAddress.streetname"].value=""
		form["shippingAddress.city"].value=""
		form["shippingAddress.state"].value=""
		form["shippingAddress.country"].value=""
		form["shippingAddress.zipcode"].value=""
	}
}

$(document).ready(function(){
	$('#form').validate({
		rules:{
			"firstname":{required:true},
			"lastname":{required:true},
			"phonenumber":{required:true,
				           minlength:10,
				           maxlength:10},
		    "user.email":{required:true,email:true},
		    "user.password":{required:true,minlength:5,maxlength:10},
		    "billingAddress.apartmentnumber":{required:true},
		    "billingAddress.streetname":{required:true},
		    "billingAddress.city":{required:true},
		    "billingAddress.state":{required:true},
		    "billingAddress.country":{required:true},
		    "billingAddress.zipcode":{required:true,number:true,minlength:6,maxlength:6}
		},
		messages:{
			"firstname":{required:"firstname is mandatory"},
		    "lastname":{required:"lastname is required"},
		    "phonenumber":{required:"phonenumber is mandatory",
		    	           minlength:"Please Enter valid phone Number",
		    	           maxlength:"Please Enter valid Phone Number"},
		    "zipcode":{required:"zipcode is Required",
		  		  		minlength:"Please Enter valid Zipcode",
 	           			maxlength:"zipcode cannot be more than 6 digits"},
		    "user.email":{required:"Email is mandatory",
		    	          email:"Enter valid email address"},
		    "user.password":{required:"Please enter password",
		    	             minlength:"Choose Password of size Atleast 5 Characters or more",
		    	             maxlength:"Choose Password not more than 10 Charactyers"}
		}
	})
})

</script>		
		
</head>

<body>
<div class="container">

<c:url value="/all/register" var="url"></c:url>
<form:form class="form-horizontal" action="${url }" method="post" modelAttribute="customer" id="form">

<p align="center"><b><font  size="4">CUSTOMER DETAILS</font></b></p>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="firstname" class="control-label">Firstname: </form:label>
</div>
<div class="col-sm-5">
<form:input path="firstname" class="form-control" placeholder="Enter First Name" id="firstname"/>
</div>
</div>
<br/>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="lastname" class="control-label">Lastname: </form:label><br/>
</div>
<div class="col-sm-5">
<form:input path="lastname" class="form-control" placeholder="Enter Last Name" id="lastname"/><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="phonenumber" class="control-label">Phone Number: </form:label><br/>
</div>
<div class="col-sm-5">
<form:input path="phonenumber" type="number" class="form-control" placeholder="Enter Phone Number" id="phonenumber"/>
</div>
</div>
<br/>

<p align="center" ><b><font  size="4">LOGIN CREDENTIALS</font></b></p>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="user.email" class="control-label">Email: </form:label><br/>
</div>
<div class="col-sm-5">
<form:input path="user.email" type="email" class="form-control" placeholder="Enter Email" id="user.email"/>
<span style="color:red">${errorMessage }</span><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="user.password" class="control-label">Password: </form:label><br/>
</div>
<div class="col-sm-5">
<form:input path="user.password" type="password" class="form-control" placeholder="Enter Password"  id="user.password"/><br/>
</div>
</div>
<form:hidden path="user.enabled" value="true"/>
<form:hidden path="user.authorities.role" value="ROLE_USER"></form:hidden>

<p align="center"><b><font  size="4">BILLING ADDRESS</font></b></p>
<div class="row">
<div class="col-sm-5" align="right">
<form:label path="billingAddress.apartmentnumber" class="control-label">Apartment Number</form:label>
</div>
<div class="col-sm-5">
<form:input path="billingAddress.apartmentnumber" class="form-control" placeholder="Enter Appartment Number" id="billingAddress.apartmentnumber"/><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="billingAddress.streetname" class="control-label">Streetname</form:label>
</div>
<div class="col-sm-5">
<form:input path="billingAddress.streetname" class="form-control" placeholder="Enter Street Name" id="billingAddress.streetname"/><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="billingAddress.city" class="control-label">City</form:label>
</div>
<div class="col-sm-5">
<form:input path="billingAddress.city" class="form-control" placeholder="Enter City" id="billingAddress.city"/><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="billingAddress.state" class="control-label">State</form:label>
</div>
<div class="col-sm-5">
<form:input path="billingAddress.state" class="form-control" placeholder="Enter State" id="billingAddress.state"/><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="billingAddress.country" class="control-label">Country</form:label>
</div>
<div class="col-sm-5">
<form:input path="billingAddress.country" class="form-control" placeholder="Enter Country" id="billingAddress.country"/><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="billingAddress.zipcode" class="control-label">Zipcode</form:label>
</div>
<div class="col-sm-5">
<form:input path="billingAddress.zipcode" type="number"  class="form-control" placeholder="Enter Zipcode" id="billingAddress.zipcode"/><br/>
</div>
</div>

<div class="row" align="center">
<input type="checkbox" onclick="fillShippingAddress(this.form)" id="checkbox">
Check this box, if shipping address is same as billing address
</div>

<br>
<p align="center"><b><font  size="4">SHIPPING ADDRESS</font></b></p>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="shippingAddress.apartmentnumber" class="control-label">Apartmentnumber</form:label>
</div>
<div class="col-sm-5">
<form:input path="shippingAddress.apartmentnumber" class="form-control" placeholder="Enter Appartment Number" /><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="shippingAddress.streetname" class="control-label">Streetname</form:label>
</div>
<div class="col-sm-5">
<form:input path="shippingAddress.streetname" class="form-control" placeholder="Enter Street Name" /><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="shippingAddress.city" class="control-label">City</form:label>
</div>
<div class="col-sm-5">
<form:input path="shippingAddress.city" class="form-control" placeholder="Enter City"/><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="shippingAddress.state" class="control-label">State</form:label>
</div>
<div class="col-sm-5">
<form:input path="shippingAddress.state" class="form-control" placeholder="Enter State"/><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="shippingAddress.country" class="control-label">Country</form:label>
</div>
<div class="col-sm-5">
<form:input path="shippingAddress.country" class="form-control" placeholder="Enter Country"/><br/>
</div>
</div>

<div class="row">
<div class="col-sm-5" align="right">
<form:label path="shippingAddress.zipcode" class="control-label">Zipcode</form:label>
</div>
<div class="col-sm-5">
<form:input path="shippingAddress.zipcode" type="number" class="form-control" placeholder="Enter Zipcode"/><br/>
</div>
</div>
<div class="row" align="center">
<input type="submit" value="REGISTER">
</div>
</form:form>
</div>
</body>
</html>