<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DESIGNED BY AFAQUE</title>

<script type="text/javascript">
$(document).ready(function(){
	var searchCondition='${searchCondition}'
	$('.table').DataTable({
		"lengthMenu":[[-1,5,2],["All",5,2]],
	    "oSearch" : {
		"sSearch" : searchCondition 
		}
	})
})
</script>
</head>

<body>
<div class="container">
	<table align="center" class="table">
		<thead>
			<tr>
		 <%--   <th>Product Id</th>   --%>
			    <th>Image</th>
				<th>Product Name</th>
				<th>Description</th>
		 <%--   <th>Categoryname</th>   --%>
				<th>Price</th>
		<security:authorize access="hasRole('ROLE_ADMIN')">
				<th>Action</th>
		</security:authorize>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${products }" var="p">
        <tr>
<%--    <td>${p.id }</td> --%>
        <td><a href="<c:url value='/all/getproduct?id=${p.id }'></c:url>"><img src="<c:url value='/resources/images/${p.id}.png'></c:url>" height="200px" width="200px"></a></td>
        <td><a href="<c:url value='/all/getproduct?id=${p.id }'></c:url>">${p.productname }</a></td>
        <td>${p.description }</td>
        <td>${p.price }</td>
        <td>
<%-- 	<a href="<c:url value='/all/getproduct?id=${p.id }'></c:url>"class="btn btn"><span class="glyphicon glyphicon-info-sign"></span> INFO</a> --%>
      
       <security:authorize access="hasRole('ROLE_ADMIN')">
        <a href="<c:url value='/admin/deleteproduct/${p.id }'></c:url>"class="btn btn" onclick="return confirm('Are you sure you want to delete this item?');" ><span class="glyphicon glyphicon-trash"></span> Delete</a>
        <a href="<c:url value='/admin/getupdateform?id=${p.id }'></c:url>"class="btn btn"><span class="glyphicon glyphicon-pencil"></span> Update</a>
        </security:authorize>
        
        </td>
        </tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>