<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<c:url value='/resources/css/form.css'></c:url>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<div class="container">

<c:url value="/admin/updateproduct" var="url"></c:url>
<form:form action="${url }" modelAttribute="product" enctype="multipart/form-data">
<form:hidden path="id"/>
<table align="center" class="table">
<tr>
<td colspan="2"><b><center><font  size="4">Update Product Form</font></center></b></td>
</tr>	<tr>
       <td><form:label path="productname" align="right" >Product Name :</form:label></td>
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
	<td><a href="<c:url value='/all/getallproducts'></c:url>" class="btn btn-lg btn-warning" id="button">Back</a></td>
  	<td><input type="submit" value="Update Product"></td>
   </tr>  
</table>

</form:form>
</div>
</body>
</html>