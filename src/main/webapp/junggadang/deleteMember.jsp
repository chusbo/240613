<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="header.jsp" %>
	<div class="container py-4">
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
	
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">탈퇴하기</h1>	
		</div>
	</div>
	
	<div class="row align-items-md-stretch text-center">
		<div class="row justify-content-center align-items-center">
			<div class="h-100 p-5 col-md-6">
				<%
				  String error=request.getParameter("error");
				  if (error !=null){
					  out.println("<div class='alert alert-danger'>");
					  out.println("아이디와 비밀번호를 확인해 주세요");
					  out.println("</div>");
				  }
				%>		
				<form class="form-signin" action="./processDeleteMember.jsp" method="post">		
				<div class="form-floating mb-3 row">
					<input type="text" class="form-control" name="id"
					required autofocus>
					<label for="floatingInput">ID</label>					
				</div>
				<div class="form-floating mb-3 row">
					<input type="password" class="form-control" name="password">
					<label for="floatingInput">Password</label>
				</div>			
				<div class="d-flex justify-content-between">
					<button class="btn btn-lg btn-success">회원탈퇴</button>	
				</div>
				</form>
			</div>
		</div>
	</div>	
	<%@ include file="footer.jsp" %>
	</div>
</body>
</html>
