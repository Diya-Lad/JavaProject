<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="./base.jsp" %>
</head>
<body>
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3">Change the product details</h1>
				
				<form action="${pageContext.request.contextPath }/handle-product" method="post">
  <input type="hidden" value="${productUpdate.id }" name="id">
  <div class="form-group">
    <label for="name">Product name</label>
    <input type="text" name="name" value="${productUpdate.name }" class="form-control" placeholder="Enter the product name here" id="exampleFormControlInput1" placeholder="name@example.com">
  </div>
  <br>
  <div class="form-group">
    <label for="description">Product Description</label>
    <textarea class="form-control" name="description" placeholder="Enter the product description" id="exampleFormControlTextarea1" rows="5">${productUpdate.description }</textarea>
  </div>
  <br>
  <div class="form-group">
    <label for="price">Product Price</label>
    <input type="number" name="price" value="${productUpdate.price }" class="form-control" placeholder="Enter the product price" id="exampleFormControlInput1" placeholder="name@example.com">
  </div><br>
  <div class="form-group">
    <label for="quantity">Product Quantity</label>
    <input type="number" name="quantity" value="${productUpdate.quantity }" class="form-control" placeholder="Enter the product quantity" id="exampleFormControlInput1" placeholder="name@example.com">
  </div><br>
  <div class="container text-center">
  	<a href="${pageContext.request.contextPath }/"
  		class="btn btn-outline-danger">Back</a>&nbsp;&nbsp;
  	<button type="submit" class="btn btn-warning">Upadte</button>
  </div>
  
</form>
			</div>
		</div>
	</div>
</body>
</html>