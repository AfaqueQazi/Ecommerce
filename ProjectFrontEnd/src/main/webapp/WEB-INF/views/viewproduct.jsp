<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DESIGNED BY AFAQUE</title>
<style>
.button1{width: 250px;}
</style>
</head>
<body>
<div class="container">

<table align="center" class="table">

<tr>
<td colspan="6"><b><center><font  size="4">Product Details</font></center></b></td>
</tr>
<tr>
	<td rowspan="9">
		<img src='<c:url value='/resources/images/${productAttr.id}.png'></c:url>' height="300px" width="300px"/> 
	</td>
</tr>
<tr>
	<td><font size="2">Product ID</font></td>
	<td><font size="2">${productAttr.id}</font></td>
</tr>
<tr>
	<td><b><font size="3">Product Name</font></b></td>
	<td><b><font size="2">${productAttr.productname}</font></b></td>
</tr>
<tr>
	<td><b><font size="3">Category</font></b></td>
	<td><b><font size="2">${productAttr.category.categoryname}</font></b></td>
</tr>
<tr>
	<td><b><font size="3">Price</font></b></td>
	<td><b><font size="2">${productAttr.price} Rs</font></b></td>
</tr>
<tr>
	<td><b><font size="3">Stock</font></b></td>
	<td><b><font size="2">${productAttr.quantity}</font></b></td>
</tr>
<tr>
	<td><b><font size="3">Product Description</font></b></td>
	<td><b><font size="2">${productAttr.description}</font></b></td>
</tr>
			<tr>
				<td></td>
				<td>
				<c:if test="${pageContext.request.userPrincipal.name==null }">
				<a class="btn btn-lg btn-info" href="<c:url value='/login'></c:url>">Login</a>
				</c:if>
				<security:authorize access="hasRole('ROLE_ADMIN')">
				<a class="btn btn-lg btn-info" href="<c:url value='/admin/getupdateform?id=${productAttr.id }'></c:url>">Update Product</a>
				</security:authorize>
				
				<security:authorize access="hasRole('ROLE_USER')">
	<c:choose>
    <c:when test="${productAttr.quantity==0 }">
    
        <input type="submit" class="btn btn-lg btn-danger" value="OUT OF STOCK" disabled>

    </c:when>
    <c:otherwise>
    	<form action="<c:url value='/cart/addtocart/${productAttr.id}'></c:url>">
			Enter required units<br>
		<input type="number"  name="requestedQuantity" min="1" value="1" max="${productAttr.quantity}"> 
		<input type="submit" class="btn btn-lg btn-success" value="Add To Cart">
		</form>
    </c:otherwise>
</c:choose>

						
				
				</security:authorize>
				</td>
				</tr>

			<tr>
	<td></td>
	<td>
	<a href="<c:url value='/all/getallproducts'></c:url>" class="btn btn-lg btn-warning" id="button"><span class="glyphicon glyphicon-arrow-left"></span>Previous Page</a>
</tr>

</table>
<a href="<c:url value='/resources/images/${productAttr.id}.png'></c:url>" class="btn btn-primary">Click to Zoom</a>
</div>
</body>
</html>