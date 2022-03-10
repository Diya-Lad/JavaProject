<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@include file="./base.jsp" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center mb-3">Welcome to Product App</h1>
				
				<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">S.No</th>
      <th scope="col">Product Name</th>
      <th scope="col">Description</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${product }" var="p">
    <tr>
      <th scope="row">${p.id }</th>
      <td>${p.name }</td>
      <td>${p.description }</td>
      <td class="font-weight-bold">&#x20B9; ${p.price }</td>
      <td>${p.quantity }</td>
      <td><img src="/imageDisplay?id=${p.id}"/></td>
      <td><a href="delete/${p.id }"><i class="fas fa-trash text-danger"></i></a>
      <a href="update/${p.id }"><i class="fas fa-pen-nib text-primary"></i></a>
      </td>
    </tr>
   </c:forEach>
  </tbody>
</table>

<div class="container" class="text-center">
	<a href="addProduct" class="btn btn-outline-success text-center">Add Product</a>
</div>
				
				
			</div>
		</div>
	</div>
</body>
</html>