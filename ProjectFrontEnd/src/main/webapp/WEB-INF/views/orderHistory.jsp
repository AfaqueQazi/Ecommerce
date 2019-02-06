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

<table class="table" align="center" style="width: 60%">
<thead>
<tr>
<th><strong>Cart Id</strong></th>
<th><strong>Grand Total	</strong></th>
<th><strong>Date & Time of Purchase</strong></th>
</tr>
</thead>

<tbody>

<c:forEach items="${customerorder }" var="order">
<tr>
<td>${order.orderId}	</td>
<td>${order.grandTotal }	</td>
<td>${order.purchaseDate }	</td>
</tr>
</c:forEach>

</tbody>
</table>

</body>
</html>