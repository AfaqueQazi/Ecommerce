<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value='/resources/css/form.css'></c:url>"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<c:url value="/admin/savecategory" var="cat"></c:url>

		<h3>
			<b><center>All Categories</center></b>
		</h3>
		<font color="red"><center>*make sure to change the
				category to another category before deleting</center></font>
		<table class="table" align="center" style="width: 60%">
			<tr>
				<td><strong>Category Name</strong></td>
				<td><strong>Action</strong></td>
			</tr>
			<c:forEach items="${categories}" var="c">
				<tr>
					<td>${c.categoryname }</td>
					<td><a
						href="<c:url value='/admin/deletecategory/${c.categoryid }'></c:url>">DELETE</</a></td>
				</tr>
			</c:forEach>
			<tr>
				<form:form class="form-horizontal" action="${cat} " method="post"
					modelAttribute="category" id="form">
					<td colspan="2"><form:label path="categoryname">Add New Category</form:label>
						<form:input path="categoryname" class="form-control"
							placeholder="Enter Category Name" id="categoryname" /></td>

					<tr>
						<td colspan="2"><input type="submit" value="Add Category"></td>
					</tr>
				</form:form>
			</tr>
		</table>
	</div>
</body>
</html>