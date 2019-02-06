<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DESIGNED BY AFAQUE</title>
</head>
<body>

<div class="content">
		<div class="container">
			<div class="alert alert-success">
				<h3 class="text-center">Your Order is Confirmed!!</h3>
			</div>
		    <div class="row">
		        <div class="col-xs-12">
		    		<div class="invoice-title">
		    			<h2>Invoice</h2><h3 class="pull-right">Order # ${customerOrder.orderId }</h3>
		    		</div>
		    		<hr>
		    		<div class="row">
		    			<div class="col-xs-6">
		    				<address>
		    				<strong>Billed To:</strong><br>
		    					${customerOrder.user.customer.firstname }  ${customerOrder.user.customer.lastname }<br>
		    					${orderDetail.billing.addressLineOne}<br>
		    					${customerOrder.user.customer.billingAddress.apartmentnumber}, 
		    					${customerOrder.user.customer.billingAddress.streetname }<br>
		    					${customerOrder.user.customer.billingAddress.city} - ${customerOrder.user.customer.billingAddress.zipcode} <br>
		    					${customerOrder.user.customer.billingAddress.state} -  ${customerOrder.user.customer.billingAddress.country}
		    				</address>
		    			</div>
		    			<div class="col-xs-6 text-right">
		    				<address>
		        			<strong>Shipped To:</strong><br>
		    					${customerOrder.user.customer.firstname} ${customerOrder.user.customer.lastname}<br>
		    					 ${customerOrder.user.customer.shippingAddress.apartmentnumber}, 
		    					 ${customerOrder.user.customer.shippingAddress.streetname }<br>
		
		    					${customerOrder.user.customer.shippingAddress.city} - ${customerOrder.user.customer.shippingAddress.zipcode}<br>
		    					${customerOrder.user.customer.shippingAddress.state} - ${customerOrder.user.customer.shippingAddress.country}
		    				</address>
		    			</div>	
		    		</div>
		    		<div class="row">
		    			<div class="col-xs-6">
		    				<address>
		    					<strong>Payment Method:</strong><br>
		    					Card Payment <br>
		    					${orderDetail.user.email}
		    				</address>
		    			</div>
		    			<div class="col-xs-6 text-right">
		    				<address>
		    					<p>Shipping Date: </p>${customerOrder.purchaseDate }
		    				</address>
		    			</div>
		    		</div>
		    	</div>
		    </div>
		    
		    		    <div class="row">
		    	<div class="col-md-12">
		    		<div class="panel panel-default">
		    			<div class="panel-heading">
		    				<h3 class="panel-title"><strong>Order summary</strong></h3>
		    			</div>
		    			<div class="panel-body">
		    				<div class="table-responsive">
		    					<table class="table table-condensed">
		    						<thead>
		                                <tr>
		                                	<td class="text-center"><strong>Image</strong></td>
		        							<td><strong>Item</strong></td>
		        							<td class="text-center"><strong>Price</strong></td>
		        							<td class="text-center"><strong>Quantity</strong></td>
		        							<td class="text-right"><strong>Total</strong></td>
		                                </tr>
		    						</thead>
							<tbody>
		    							
                                <c:forEach items="${cartItems}" var="cartItem">
      
                                    <tr>
                            <c:url value="/resources/images/${cartItem.product.id }.png" var="imgUrl"></c:url>
                                        <td><img src="${imgUrl }" height="80px" width="80px">  </td>
                                        <td class="col-md-9"><em>${cartItem.product.productname }</em></td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.quantity }</td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.product.price }</td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.totalPrice }</td>
                                    </tr>
                             </c:forEach>
              
		    				</tbody>
		    				</table>
		    				</div>
		    			</div>
		    		</div>
		    	</div>
		    </div>
		    <div class="text-center">
		    	<a href="<c:url value='/cart/clearcart'></c:url>" class="btn btn-lg btn-warning">Continue Shopping</a>
		    	<a href="<c:url value='/all/history'></c:url>" class="btn btn-lg btn-info">Order History</a>
		    </div>
		 </div>
	 </div>

</body>
</html>
