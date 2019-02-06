<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
	<div class="container">
		

<c:choose>
    <c:when test="${cartSize==0}">
		<h1><center>Your Cart is Empty</center></h1>
		<div class="text-center">
		<a href="<c:url value='/all/getallproducts'></c:url>" class="btn btn-lg btn-warning">Continue Shopping</a>
		</div>
    </c:when>
    <c:otherwise>
    <b>Cart Page</b><br>
    		<c:set var="grandTotal" value="0"></c:set>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th></th>
					<th>Image</th>
					<th>Productname</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>TotalPrice</th>
					<th>Remove</th>
				</tr>
			</thead>
			<c:forEach var="cartItem" items="${cartItems }">
			<form action="<c:url value='/cart/updatecartitem'></c:url>">
             <tr>
         	 <td><input type="hidden" name="cartItemId" value="${cartItem.cartItemId }"></td>
             <td><img src="<c:url value='/resources/images/${cartItem.product.id }.png'></c:url>" height="40px" width="40px" alt="No Image"></td>
             <td>${cartItem.product.productname }</td>
             <td><input type="number" name="requestedQuantity" value='${cartItem.quantity }' onchange="this.form.submit()" min="1" max="${productAttr.quantity}"></td>
             <td>${cartItem.product.price }</td>
             <td>${cartItem.totalPrice }</td>
             <td><a href="<c:url value='/cart/removecartitem/${cartItem.cartItemId }'></c:url>" class="btn btn-danger">Remove</a></td>
             <c:set var="grandTotal" value="${cartItem.totalPrice +grandTotal }"></c:set>
             </tr> 
             </form>
			</c:forEach>
			</table>
      <h4>Grand Total : ${grandTotal } Rs</h4> <a class="btn btn-success" href="<c:url value='/cart/getshippingaddressform'></c:url>">Place Order</a></td>
    </c:otherwise>
</c:choose>
			
			
            
             
		


	
	</div>
</body>
</html>