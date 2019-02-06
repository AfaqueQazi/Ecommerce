<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DESIGNED BY AFAQUE</title>
<script type="text/javascript"
		src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
		<link href="<c:url value='/resources/css/form.css'></c:url>"  rel="stylesheet">
		<link  rel="stylesheet" href="<c:url value='/resources/css/formerror.css'></c:url>">

</head>

<div class="container">


<c:url value="/admin/addproduct" var="url"></c:url>
<form:form action="${url }" modelAttribute="product" enctype="multipart/form-data">
<table 	align="center" class="table">

<th colspan="2" ><h2 align="center">Add Product From</h2></th>

	<tr>
       <td><form:label path="productname" align="right">Product Name :</form:label></td>
       <td><form:input path="productname" class="form-control"/></td> 
   </tr>

	<tr>
       <td><form:label path="description" >Description :</form:label></td>
       <td><form:input path="description" class="form-control"/></td>
    </tr>

	<tr>
       <td><form:label path="price" >Set Price :</form:label></td>
       <td ><form:input path="price" class="form-control"/></td>
   </tr>
   <tr>
       <td><form:label path="quantity" >Set Quantity :</form:label></td>
       <td ><form:input path="quantity" class="form-control"/></td>
   </tr>
   
   	<tr> 
       <td><form:label path="category.categoryid" >Product Category :</form:label></td>
       <td><form:select path="category.categoryid" class="form-control">	
				<c:forEach items="${categories}" var="c"><%--model.addAttribute("categories",categories), items refers the model attribute categories --%>
						<form:option value="${c.categoryid }">${c.categoryname}</form:option>
				</c:forEach>
			</form:select></td>
   </tr>
   
	<tr>
       <td><form:label path="image" class="control-label">Upload Image :</form:label></td>
       <td><form:input path="image" type="file" class="control-label"/></td>
   </tr> 
   <tr>
   <td colspan="2" align="center"><input type="submit" value="Add Product"></td>
   </tr> 
</table>
</form:form>
</div>
</body>
</html>
